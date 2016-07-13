chai = require 'chai'
chaiEnzyme = require 'chai-enzyme'

chai.use(chaiEnzyme())

global.expect = chai.expect
global.jsdom = require 'jsdom'
global.sinon = require 'sinon'
global._ = require 'lodash'
global.enzyme = require 'enzyme'
global.React = require 'react'

global.mountRender = (Component, props = {}, context = {}) ->
  element = React.createElement(Component, props)
  wrapper = enzyme.mount(element, {context})
  return {
    wrapper
    instance: wrapper.instance()
  }

beforeEach ->
  global.document = jsdom.jsdom('<html><body></body></html>')
  global.window = document.defaultView
  global.Image = window.Image
  global.navigator = window.navigator
  global.CustomEvent = window.CustomEvent

  global.simulant = require 'simulant'