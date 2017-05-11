'use strict';

const express = require('express');
const routes = require('../routes');
const logger = require('../middleware/logger');
const routeError = require('../middleware/route-error.js');
const version = require('../../package.json').version;

console.log('Running version : ' + version);

const app = express();

//middleware
app.use(logger);

//serve static files (react stuff)
app.use(express.static('www'));

//routes
app.use('/login', routes.login);

//error route
app.use(routeError);

module.exports = app;
