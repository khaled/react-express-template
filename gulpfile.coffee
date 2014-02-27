
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

gulp.task 'default', [ 'js', 'css', 'watch'], ->
  nodemon
    script: 'app/server/server.coffee'
    watch: [
      'app/server/'
    ]
    execMap:
      coffee: './node_modules/coffee-script/bin/coffee'

gulp.task 'css', ->
  gulp.src('./app/client/stylesheets/styles.less')
  .pipe(plumber())
  .pipe(less(
    paths: ['./app/client/components']
  ))
  .on('error', err)
  .pipe(gulp.dest('./public/stylesheets'))
  .pipe(livereload())

gulp.task 'js', ->
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
  .pipe(livereload())

gulp.task 'views', -> gulp.src('').pipe(livereload())

gulp.task 'watch', ->
  gulp.watch ['./app/client/scripts/**'], ['js']
  gulp.watch ['./app/client/stylesheets/**'], ['css']
  gulp.watch ['./app/client/components/**'], ['css', 'js']
  gulp.watch ['./app/views/**'], ['views']