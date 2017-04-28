'use strict';

module.exports = class RouteError {
    constructor(statusCode, errorMessage) {
        this.code = statusCode;
        this.message = errorMessage;
    }
};
