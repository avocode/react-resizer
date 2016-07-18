React = require 'react'

{ div } = React.DOM

Resizer = React.createClass
  displayName: 'Resizer'

  propTypes:
    className: React.PropTypes.string
    handleClassName: React.PropTypes.string
    direction: React.PropTypes.string
    onResizeStart: React.PropTypes.func
    onResize: React.PropTypes.func.isRequired
    onResizeEnd: React.PropTypes.func

  getDefaultProps: ->
    className: ''
    handleClassName: ''
    direction: 'x'

  componentWillUnmount: ->
    @_removeListeners()

  _startPosition:
    x: 0
    y: 0

  _handleMouseMove: (e) ->
    if @props.direction is 'x'
      diff = @_startPosition.x - e.clientX

      if diff isnt 0
        @props.onResize(@_startPosition.x - e.clientX)

    if @props.direction is 'y'
      diff = @_startPosition.y - e.clientY

      if diff isnt 0
        @props.onResize(@_startPosition.y - e.clientY)

    @_updateStartPosition(e)

  _handleMouseDown: (e) ->
    @props.onResizeStart?(e)
    @_updateStartPosition(e)
    window.addEventListener 'mouseup', @_handleMouseUp
    window.addEventListener 'mousemove', @_handleMouseMove

  _handleMouseUp: (e) ->
    @props.onResizeEnd?(e)
    @_removeListeners()

  _removeListeners: ->
    window.removeEventListener 'mouseup', @_handleMouseUp
    window.removeEventListener 'mousemove', @_handleMouseMove

  _updateStartPosition: (e) ->
    @_startPosition.x = e.clientX
    @_startPosition.y = e.clientY

  render: ->
    div
      className: "resizer #{@props.className}",

      div
        onMouseDown: @_handleMouseDown
        className: "handle #{@props.handleClassName}"

      @props.children

module.exports = Resizer
