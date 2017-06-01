'use strict';

const addTwoNumbers = require('../../../express/helpers/Square-Number.js');
const should = require('should');

describe('squareNumber', () => {

  it('should square a number', () => {
    const result = addTwoNumbers(4);
    should.equal(result, 16);
  })
});
