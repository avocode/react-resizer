React Resizer
=============

![React Resizer example](https://cldup.com/ZdLk2YMH3V.gif)

A React component for resizing HTML elements.

## Installation:

`npm install react-resizer`


## Usage:

For a more comprehensive use case, please check the example folder in this repository.

```
'use strict';

let React = require('react');
let Resizer = require('react-resizer');

let App = React.createClass({
  displayName: 'App',
  
  _handleResize: function(diff) {
    return console.log('resizing');
  },
  
  _handleResizeStart: function() {
    return console.log('resize start');
  },
  
  _handleResizeEnd: function() {
    return console.log('resize end');
  },
  
  render: function() {
    return (
      <Resizer
        onResizeStart={this._handleResizeStart}
        onResize={this._handleResize}
        onResizeEnd={this._handleResizeEnd}
      >
        <div>Right sidebar</div>
      </Resizer>
    )
  }
});

React.render(<App />, document.getElementById('content'));
```
