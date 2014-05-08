_ = require('lodash')
window.$ = window.jQuery = require('jquery')
require('semantic/build/packaged/javascript/semantic')
React = require('react')

R = React.DOM
Header = React.createClass
  render: ->
    R.div {className:"ui fluid transparent fixed menu", style: {opacity: 0.9}},
      R.div {className:"title item"},
        (R.b {}, "node-template"),
      R.div {className: "right floated connection status item"},
        R.i({className:"green bolt icon"})


$ ->
  console.log($('.app-content'))
  React.renderComponent(Header(), $('.app-content')[0])