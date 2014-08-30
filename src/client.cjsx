window.$ = window.jQuery = require('jquery/dist/jquery')
require('semantic/build/packaged/javascript/semantic')
React = require('react/addons')

Header = React.createClass
  render: ->
    <div className="ui fluid large transparent menu" style={opacity: 0.9}>
      <div className="title item">
        <b>APP NAME</b>
      </div>
      <div className="right floated connection status item">
        <i className="green bolt icon"/>
      </div>
    </div>

Body = React.createClass
  render: ->
    <div>
      <Header/>
      <div className="ui page grid">
        <div className="row">
          <h4 className="ui black header">
            <span>Get to work!</span>
            <div className="sub header">
              Make sure to check out README.md for development notes.
            </div>
          </h4>
        </div>
      </div>
    </div>

$ -> React.renderComponent(<Body/>, document.body)