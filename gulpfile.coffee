gulp = require 'gulp'
gutil = require 'gulp-util'
livereload = require 'gulp-livereload'
nodemon = require 'gulp-nodemon'
plumber = require 'gulp-plumber'
gwebpack = require 'gulp-webpack'
less = require 'gulp-less'
postcss = require 'gulp-postcss'
autoprefixer = require 'autoprefixer-core'
rimraf = require 'rimraf'
GLOBAL.Promise = (require 'es6-promise').Promise # to make gulp-postcss happy

src_path = "src"
components_path = "bower_components"
modules_path = "node_modules"
semantic_path = "#{modules_path}/semantic-ui-css"
dist_path = "dist"

err = (x...) -> gutil.log(x...); gutil.beep(x...)

webpack = (name, ext, watch) ->
  options =
#    bail: true
    watch: watch
    cache: true
    devtool: "source-map"
    output:
      filename: "#{name}.js"
      sourceMapFilename: "[file].map"
    resolve:
      extensions: ["", ".webpack.js", ".web.js", ".js", ".jsx", ".coffee", ".cjsx"]
      modulesDirectories: [components_path, modules_path]
    module:
      loaders: [
        {
          test: /\.coffee$/
          loader: "coffee-loader"
        }
        {
          test: [/\.js$/, /\.jsx$/]
          exclude: [new RegExp(modules_path), new RegExp(components_path)]
          loader: "babel-loader"
        }
        {
          test: /\.cjsx$/
          loader: "transform?coffee-reactify"
        }
      ]

  gulp.src("#{src_path}/#{name}.#{ext}")
  .pipe(gwebpack(options))
  .pipe(gulp.dest(dist_path))


js = (watch) -> webpack("client", "cjsx", watch)
gulp.task 'js', -> js(false)

gulp.task 'js-dev', -> js(true)

gulp.task 'css', ->
  gulp.src("#{src_path}/styles.less")
  .pipe(plumber())
  .pipe(less(
    paths: [components_path, modules_path]
  ))
  .on('error', err)
  .pipe(postcss([autoprefixer(browsers: ["last 2 versions", "ie 8", "ie 9"])]))
  .pipe(gulp.dest(dist_path))

gulp.task 'clean', ->
  rimraf.sync(dist_path)

gulp.task 'copy', ->
  gulp.src("#{src_path}/*.html").pipe(gulp.dest(dist_path))
  gulp.src("#{src_path}/favicon.ico").pipe(gulp.dest(dist_path))
  gulp.src("#{semantic_path}/themes/default/assets/**/*").pipe(gulp.dest("#{dist_path}/themes/default/assets/"))

gulp.task 'build', ['clean', 'copy', 'css', 'js']

server_main = "#{src_path}/server.coffee"
gulp.task 'server', ->
  nodemon
    script: server_main
    watch: [server_main]
    env:
      PORT: process.env.PORT or 3000

gulp.task 'default', ['clean', 'copy', 'css', 'server', 'js-dev', 'watch']

gulp.task 'watch', ['copy'], ->
  livereload.listen()
  gulp.watch(["#{dist_path}/**/*"]).on('change', livereload.changed)
  gulp.watch ["#{src_path}/**/*.less"], ['css']
  gulp.watch ["#{src_path}/**/*.html"], ['copy']
