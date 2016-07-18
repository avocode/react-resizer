Resizer = require '../src/'

describe 'Resizer component:', ->

  baseProps =
    className: ''
    onResize: null

  beforeEach ->
    baseProps =
      className: 'sidebar'
      onResizeStart: sinon.spy()
      onResize: sinon.spy()
      onResizeEnd: sinon.spy()

  it 'should work mousedown on handle', ->
    {wrapper} = mountRender(Resizer, baseProps)
    wrapper.find('.handle').simulate('mousedown')

    expect(baseProps.onResizeStart.calledOnce).to.be.true

  it 'should work mousemove on handle', ->
    {wrapper} = mountRender(Resizer, baseProps)
    wrapper.find('.handle').simulate 'mousedown',
      clientX: 10

    event = simulant('mousemove')
    simulant.fire window, event,
      clientX: 20

    expect(baseProps.onResize.calledOnce).to.be.true

  it 'should work mouseup on handle', ->
    {wrapper} = mountRender(Resizer, baseProps)
    wrapper.find('.handle').simulate('mousedown')

    event = simulant('mouseup')
    simulant.fire window, event,
      clientX: 20

    expect(baseProps.onResizeEnd.calledOnce).to.be.true

  it 'should work className prop', ->
    {wrapper} = mountRender(Resizer, baseProps)
    expect(wrapper.find('.resizer')).to.have.className('sidebar')
