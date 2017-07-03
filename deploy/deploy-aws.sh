#!/usr/bin/env bash

# more bash-friendly output for jq
JQ="jq --raw-output --exit-status"

configure_aws_cli(){
	aws --version
	aws configure set default.region eu-west-1
	aws configure set default.output json
}

deploy_cluster() {

    family="ci-training-task"

    make_task_def
    register_definition
    task_id=$(aws ecs list-tasks --cluster ci-training-cluster | $JQ ".taskArns[0]")
    echo $task_id
    echo "-----------"
    aws ecs stop-task --cluster ci-training-cluster --task $task_id
    echo "-----------"
    aws ecs update-service --cluster ci-training-cluster --service ci-training-service --task-definition $revision
    echo "-----------"
    return 0;
}

make_task_def(){
	task_template='[
		{
			"name": "ci-training",
			"image": "registry.hub.docker.com/jonhunter1977/ci-training",
			"essential": true,
			"memory": 200,
			"cpu": 10,
			"portMappings": [
				{
					"containerPort": 4001,
					"hostPort": 80,
          "protocol": "tcp"
				}
			]
		}
	]'

	task_def=$(printf "$task_template" $AWS_ACCOUNT_ID $CIRCLE_SHA1)
}

register_definition() {

    if revision=$(aws ecs register-task-definition --container-definitions "$task_def" --family $family | $JQ '.taskDefinition.taskDefinitionArn'); then
        echo "Revision: $revision"
    else
        echo "Failed to register task definition"
        return 1
    fi

}

configure_aws_cli
deploy_cluster
