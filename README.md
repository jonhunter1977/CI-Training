# Sample code for CI training course

# Setup Requirements

## Node

### Install NVM

Install NVM from https://github.com/creationix/nvm, using:
```
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
```

Run the following to update you sources.
```
source ~/.bashrc
```

Verify the install:
```
command -v nvm
```

### Install the correct version of Node  

Update node to the correct version of node:
```
nvm install v8.1.3
```

### Use the correct version of Node  

```
nvm use v8.1.3
```

## GIT

### Install GIT

Google it.

### Clone the repo
```
git clone git@github.com:jonhunter1977/CI-Training.git
```

## Node Project Management.

Navigate to project folder (where you cloned to) and install dependencies:
```
npm install
```

Run Tests:
```
npm run test-and-cover
```
