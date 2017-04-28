'use strict';

const logger = require('winston');

const logInfo = (message) => {
  logger.level = 'info';
  logger.log('info', message);
};

const logError = (message) => {
  logger.level = 'error';
  logger.log('error', message);
};

module.exports = (req, res, next) => {
  req.logInfo = logInfo;
  req.logError = logError;
  next();
};
