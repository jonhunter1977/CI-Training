'use strict';

const request = require('supertest');
const should = require('should');

describe('POST /login', () => {

  let app;
  beforeEach(() => {
    app = require('../../../../express/lib/app');
  });

  it('should respond with a 400 if the POST data is missing', (done) => {
    request(app)
      .post('/login')
      .expect(400)
      .end(done);
  });

  it('should response with a 200 if the POST data requests a successful login', (done) => {
    request(app)
      .post('/login')
      .send({
        loginResult: 'success'
      })
      .expect(200)
      .expect((response) => {
        should.equal(response.text, 'Login OK');
      })
      .end(done);
  });

  it('should response with a 401 if the POST data requests anything else', (done) => {
    request(app)
      .post('/login')
      .send({
        loginResult: 'fail'
      })
      .expect(401)
      .expect((response) => {
        should.equal(response.error.text, 'Not authorised');
      })
      .end(done);
  });
});
