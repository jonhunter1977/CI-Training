'use strict';

const express = require('express');
const router = express.Router({
  mergeParams: true
});
const bodyParser = require('body-parser');
const RouteError = require('../routeError');

router.post('/', bodyParser.json(), (req, res, next) => {
  const loginResult = req.body.loginResult;

  if (!loginResult) {
    req.logInfo('no data');
    return next(new RouteError(400, 'loginResult Data missing in POST body'));
  }

  if (loginResult === 'success') {
    return res.status(200).send('Login OK');
  }

  res.status(401).send('Not authorised');

});

module.exports = router;
