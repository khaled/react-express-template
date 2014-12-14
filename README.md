react-coffee-express-template
=============================

Web app starter template with React, React Router, CoffeeScript, Express/Node.js, Semantic-UI, Gulp and more.

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/khaled/react-coffee-express-template)

### Getting Started ###

1. Fork and/or clone
2. Run ```npm install```
3. Start the dev server by running ```$(npm bin)/gulp```
4. Visit http://localhost:3000
5. Get to work!

### Languages / Frameworks / Libraries ###

* Facebook's React for client side view and controller logic
* CoffeeScript with React sugar (.cjsx)
* React Router for client side routing
* Normalize-CSS for normalization of default element styles across browsers
* Semantic-UI CSS framework
* LESS for extended styling capabilities
* Autoprefixer for automatic vendor prefixing
* JQuery because semantic wants it (use React for most client side view rendering / manipulation)
* Webpack for client side CommonJS modules and script concatenation
* Express for server side logic
* Gulp for building and change monitoring
* LiveReload

### Development Notes ###

* Client side scripts are concatenated using Webpack.  The main entry point is client.cjsx.  From here you can require() other .cjsx, .coffee, .jsx, or .js files.
* The main stylesheet entry point is styles.less.
* The server entry point is server.coffee.

### LiveReload ###

Install a live reload plugin for your browser to instantly see your changes in the browser when a client side file (cjsx/coffee/js/less/css/html) changes.
