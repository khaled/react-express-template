
gulp = require 'gulp'
gutil = require 'gulp-util'
rename = require 'gulp-rename'
coffee = require 'gulp-coffee'
less = require 'gulp-less'
browserify = require 'gulp-browserify'
livereload = require 'gulp-livereload'
nodemon = require 'gulp-nodemon'
plumber = require 'gulp-plumber'

err = (x...) -> gutil.log(x...); gutil.beep(x...)

css = ->
  gulp.src('./app/client/stylesheets/styles.less')
  .pipe(plumber())
  .pipe(less(
    paths: ['./app/client/components']
  ))
  .on('error', err)
  .pipe(gulp.dest('./public/stylesheets'))

js = ->
  gulp.src('./app/client/scripts/client.coffee')
  .pipe(plumber())
  .pipe(coffee())
  .on('error', err)
  .pipe(browserify(
    transform: ['coffeeify', 'debowerify']
    extensions: ['.coffee']
  ))
  .on('error', err)
  .pipe(rename('client.js'))
  .pipe(gulp.dest('./public/javascripts'))

gulp.task 'default', [ 'jsr', 'cssr', 'watch'], ->
  nodemon
    script: 'app/server/server.coffee'
    watch: [
      'app/server/'
    ]
    execMap:
      coffee: './node_modules/coffee-script/bin/coffee'

gulp.task 'build', ['js', 'css']

gulp.task 'css', -> css()

gulp.task 'js', -> js()

gulp.task 'cssr', -> css().pipe(livereload())

gulp.task 'jsr', -> js().pipe(livereload())

gulp.task 'viewsr', -> gulp.src('').pipe(livereload())

gulp.task 'watch', ->
  gulp.watch ['./app/client/scripts/**'], ['jsr']
  gulp.watch ['./app/client/stylesheets/**'], ['cssr']
  gulp.watch ['./app/client/components/**'], ['cssr', 'jsr']
  gulp.watch ['./app/views/**'], ['viewsr']