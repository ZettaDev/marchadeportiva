var app = angular.module("app",["ngRoute","ngResource"])
.config(['$routeProvider',function ($routeProvider)
{
    $routeProvider.when('/home', {
        templateUrl: 'templates/list.html',
        controller: 'HomeCtrl'
    }).when('/edit/:id', {
        templateUrl: 'templates/edit.html',
        controller: 'EditCtrl'
    }).when('/create', {
        templateUrl: 'templates/create.html',
        controller: 'CreateCtrl'
    }).otherwise({ redirectTo:'/home'});
}
])
.controller('HomeCtrl',['$scope','Cronicas', '$route', function($scope, Cronicas, $route) {

    Cronicas.get(function(data){
        $scope.cronicas = data.cronicas;
    })

    $scope.remove = function(id){
        Cronicas.delete({id:id}).$promise.then(function(data){
            if(data.msg){
                $route.reload();
            }
        })
    }

}])
.controller('EditCtrl',['$scope','Cronicas', '$routeParams', function($scope, Cronicas, $routeParams) {

    $scope.settings = {
        pageTitle: "Editar cronica",
        action: "Edit"
    }

    var id = $routeParams.id;

    Cronicas.get({id:id}, function(data){
        $scope.cronicas = data.cronica;
    })

    $scope.submit = function(){
        Cronicas.update({id:$scope.cronicas.id}, $scope.cronicas).$promise.then(function(data){
            if(data.msg){
                $scope.settings.success = "Cronica editada correctamente";
            }
        })
    }

}])
.controller('CreateCtrl',['$scope','Cronicas', function($scope, Cronicas) {

    $scope.settings = {
        pageTitle: "Crear cronica",
        action: "Crear"
    }

    $scope.cronicas = {
        cronica: ""
    }

    $scope.submit = function(){
        Cronicas.save($scope.cronicas).$promise.then(function(data){
            if(data.msg){
                angular.copy({}, $scope.cronicas);
                $scope.settings.success = "Cronica guardada correctamente";
            }
        })
    }

}])
.factory('Cronicas', function ($resource) {
    return $resource("http://api.zettadev.net/v1/public/index.php/cronicas/:id", {id:"@_id"}, {
        update: {method: "PUT", params: {id: "@id"}}
    })
})
