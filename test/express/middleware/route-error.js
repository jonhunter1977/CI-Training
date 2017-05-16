'use strict';

const routeError = require('../../../express/middleware/route-error.js');
const request = require('supertest');
const should = require('should');
const express = require('express');

describe('route-error', () => {

  let app;

  afterEach(() => {
    app = null;
  });

  const setUpApp = (mockErrorRoute) => {
    app = express();
    app.get('/', mockErrorRoute);
    app.use(routeError);
  };

  let mockRouteThatErrored;

  it('should return default values if there is no error object', (done) => {

    mockRouteThatErrored = (req, res, next) => {
      const err = {};
      return next(err);
    };

    setUpApp(mockRouteThatErrored);

    request(app)
      .get('/')
      .expect(500)
      .expect((response) => {
        should.equal(response.text, 'Oops something went wrong');
      })
      .end(done);
  });

  it('should return the set values if there is an error object', (done) => {

    mockRouteThatErrored = (req, res, next) => {
      const err = {
        code: 403,
        message: 'Forbidden'
      };
      return next(err);
    };

    setUpApp(mockRouteThatErrored);

    request(app)
      .get('/')
      .expect(403)
      .expect((response) => {
        should.equal(response.text, 'Forbidden');
      })
      .end(done);
  });

});
