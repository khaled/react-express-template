import React from "react/addons"
import Router from "react-router"

let {Link} = Router

export default React.createClass({
  render: function() {
    return <div className="ui pointing menu">
      <div className="ui page grid">
        <div className="column" style={{"padding-bottom": 0}}>
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
      </div>
    </div>
  }
});
