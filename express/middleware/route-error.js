'use strict';

module.exports = (err, req, res, next) => {
  res.status(err.code || 500);
  res.send(err.message || 'Oops something went wrong');
};
