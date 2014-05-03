define ['jquery','underscore','backbone','js/door'],($,_,Backbone,Door) ->
  # 常量
  DEFAULT_TASK = '有什么任务安排吗？'
  $('#taskIpt').attr 'placeholder',DEFAULT_TASK

  # 数据结构
  Task = Backbone.Model.extend
    initialize: () ->
      @bind 'change:text',() ->
        text = @get 'text'
        # console.log "create task [#{text}]"
      @bind 'invalid',(model,error) ->
        alert error

    defaults:
      text: DEFAULT_TASK

    validate: (task) ->
      text = $.trim task.text
      if text is DEFAULT_TASK
        return 'do not have changed!'
      else if not text.length
        return 'it is empty!'

  TaskList = Backbone.Collection.extend
    model: Task

  # 路由指挥
  Captain = Backbone.Router.extend
    routes:
      'like/:who': 'out',
      'byebye': 'hide'

    out: (who) ->
      # console.log who
      Door.close()

    hide: ()->
      $('#todo').slideUp('slow')

  # UI
  TodoView = Backbone.View.extend
    el: '#todo'
    tagName: 'div'

    initialize: () ->
      # console.log 'create todo view.'

    render: (list) ->
      if list
        list =
          taskList: list.toJSON()
        template = _.template $('#taskListTempl').html(),list
        @$el.find('#taskUl').html template

    events:
      'click #taskBtn': 'addTask',
      'keyup #taskIpt': 'enterAddTask'

    addTask: () ->
      # console.log "add task [#{taskList.length}] +1"
      task = new Task()
      task.set {text: $('#taskIpt').val()},{'validate': true}
      taskList.add task
      $('#taskIpt').val('')
      @render taskList

    enterAddTask: (event) ->
      event.preventDefault()
      @addTask if event.which is 13

  # 启动路由指挥
  # captain = new Captain()
  # Backbone.history.start()
  $('#todo').hide()

  # 展示 UI
  taskList = new TaskList()
  ui = new TodoView()