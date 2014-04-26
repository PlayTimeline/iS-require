module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'www/js/config.js': 'www/coffee/config.coffee',
          'www/js/main.js': 'www/coffee/main.coffee',
          'www/js/door.js': 'www/coffee/door.coffee'
        options:
          bare: true
    less:
      compile:
        files:
          'www/css/door.css': 'www/less/door.less'
    watch:
      scripts:
        files: ['www/coffee/*.coffee', 'www/less/*.less']
        tasks: ['coffee', 'less']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default', ['coffee', 'less']