window.$ = window.jQuery = require('jquery/dist/jquery')
require('semantic/build/packaged/javascript/semantic')
React = require('react/addons')

Header = React.createClass
  render: ->
    <div className="ui fluid transparent fixed menu" style={opacity: 0.9}>
      <div className="title item">
        <b>node-template</b>
      </div>
      <div className="right floated connection status item">
        <i className="green bolt icon"/>
      </div>
    </div>

Body = React.createClass
  render: ->
    <Header/>

$ -> React.renderComponent(<Body/>, document.body)