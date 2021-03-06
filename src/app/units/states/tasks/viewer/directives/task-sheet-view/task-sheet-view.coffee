angular.module('doubtfire.units.states.tasks.viewer.directives.task-sheet-view', [])

.directive('taskSheetView', ->
  restrict: 'E'
  templateUrl: 'units/states/tasks/viewer/directives/task-sheet-view/task-sheet-view.tpl.html'
  scope:
    taskDef: '='
    unit: '='
  controller: ($scope, $timeout, TaskFeedback, taskService, alertService, listenerService, Task, Unit) ->
    # Cleanup
    listeners = listenerService.listenTo($scope)

    $scope.clearSelectedTask = -> $scope.taskDef = null

    listeners.push $scope.$watch 'taskDef', (newTask) ->
      setDetails = ->
        if newTask?
          $scope.hasPdf = newTask.has_task_pdf
          $scope.taskPdfUrl = Task.getTaskPDFUrl($scope.unit, $scope.taskDef)
      setDetails()
)
      
