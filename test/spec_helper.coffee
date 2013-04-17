class Helper

  constructor: ->

    # Configure test spies, stubs and mocks.
    root.sinon = require "sinon"
    root.chai = require "chai"
    root.should = require("chai").should()
    root.expect = require("chai").expect
    sinonChai = require "sinon-chai"
    chai.use sinonChai
    # Note: root.sandbox is exposed in spec_init.coffee

  require: (path) ->
    require('../src/' + path)

root.helper = new Helper
