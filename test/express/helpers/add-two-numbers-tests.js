'use strict';

const addTwoNumbers = require('../../../express/helpers/add-two-numbers.js');
const should = require('should');

describe('addTwoNumbers', () => {

  it('should add 2 numbers correctly', () => {
    const result = addTwoNumbers(4, 5);
    should.equal(result, 9);
  })
});
