module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      compile:
        files:
          'www/js/config.js': 'www/coffee/config.coffee',
          'www/js/main.js': 'www/coffee/main.coffee',
          'www/js/door.js': 'www/coffee/door.coffee',
          'www/js/todo.js': 'www/coffee/todo.coffee',
          'www/js/todo/common.js': 'www/coffee/todo/common.coffee',
          'www/js/todo/model/task.js': 'www/coffee/todo/model/task.coffee',
          'www/js/todo/collection/taskList.js': 'www/coffee/todo/collection/taskList.coffee',
          'www/js/todo/view/taskView.js': 'www/coffee/todo/view/taskView.coffee',
          'www/js/todo/view/todoView.js': 'www/coffee/todo/view/todoView.coffee',
          'www/js/todo/route/todoRouter.js': 'www/coffee/todo/route/todoRouter.coffee'
        options:
          bare: true,
          sourceMap: true
    less:
      compile:
        files:
          'www/css/door.css': 'www/less/door.less',
          'www/css/todo.css': 'www/less/todo.less'
    cssmin:
      compile:
        files:
          'www/css/style.min.css': [
            'www/lib/bootstrap/dist/css/bootstrap.css',
            'www/lib/bootstrap/dist/css/bootstrap-theme.css',
            'www/css/door.css',
            'www/css/todo.css'
          ]
    watch:
      scripts:
        files: ['www/coffee/**/*.coffee','www/less/*.less']
        tasks: ['coffee','less','cssmin']

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'default',['coffee','less','cssmin']