module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'src/main.js': 'src/main.coffee',
          'src/base.js': 'src/base.coffee'
        options:
          bare: true

  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.registerTask 'default', ['coffee']