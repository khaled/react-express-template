window.$ = window.jQuery = require('jquery/dist/jquery')
require('semantic/build/packaged/javascript/semantic')
React = require('react/addons')


Router = require('react-router')
{Routes, Route, DefaultRoute, Link} = Router

Header = React.createClass
  render: ->
    <div className="ui transparent menu" style={opacity: 0.9}>
      <div className="title item">
        <b>Application Name</b>
      </div>
      <Link className="item" to="home">
        Home
      </Link>
      <Link className="item" to="about">
        About
      </Link>
      <div className="right floated item">
        <i className="setting icon"/>
      </div>
      <div className="right floated item">
        <div className="ui teal button">Sign Up</div>
      </div>
      <div className="right floated item">
        <div className="ui button">Log in</div>
      </div>
    </div>

Home = React.createClass
  render: ->
    <div className="row">
      <h4 className="ui black header">
        <span>Get to work!</span>
        <div className="sub header">
          Make sure to check out README.md for development notes.
        </div>
      </h4>
    </div>

About = React.createClass
  render: ->
    <div className="row">
      <h4 className="ui black header">This is the about page.</h4>
    </div>

Main = React.createClass
  render: ->
    <div>
      <Header/>
      <div className="ui page grid">
        <@props.activeRouteHandler/>
      </div>
    </div>

routes =
  <Routes location="hash">
    <Route path="/" handler={Main}>
      <DefaultRoute name="home" handler={Home}/>
      <Route name="about" handler={About}/>
    </Route>
  </Routes>

$ -> React.renderComponent(routes, document.body)