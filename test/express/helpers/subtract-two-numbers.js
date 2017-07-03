'use strict';

const subtractTwoNumbers = require('../../../express/helpers/subtract-two-numbers.js');
const should = require('should');

describe('subtractTwoNumbers', () => {

  it('should subtract 2 numbers correctly', () => {
    const result = subtractTwoNumbers(4, 5);
    should.equal(result, -1);
  })
});
