React = require 'react'
ReactDOM = require 'react-dom-factories'
createClass = require 'create-react-class'
Resizer = React.createFactory(require '../src/')

{div} = ReactDOM

module.exports = createClass
  displayName: 'App'

  getInitialState: ->
    minWidth: 200
    maxWidth: 500
    sidebarWidth: 350

  _handleResize: (diff) ->
    console.log 'resizing'
    elementNewWidth = @state.sidebarWidth + diff

    @setState
      sidebarWidth: elementNewWidth

  _handleResizeStart: ->
    console.log 'resize start'

  _handleResizeEnd: ->
    console.log 'resize end'

    if @state.sidebarWidth < @state.minWidth
      @setState
        sidebarWidth: @state.minWidth
    else if @state.sidebarWidth > @state.maxWidth
      @setState
        sidebarWidth: @state.maxWidth

  render: ->
    div
      className: 'flex-container'

      div
        className: 'flex-content'

      div
        className: 'flex-item right-sidebar'
        style:
          width: "#{@state.sidebarWidth}px"
          minWidth: "#{@state.minWidth}px"
          maxWidth: "#{@state.maxWidth}px"

        Resizer
          onResizeStart: @_handleResizeStart
          onResize: @_handleResize
          onResizeEnd: @_handleResizeEnd
          direction: 'x',
          div null, 'Right sidebar'

