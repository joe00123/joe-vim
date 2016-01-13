XPTemplate priority=lang-1
XPTinclude
      \ _common/common

XPT ng
<div ng-model="`cursor^"></div>

XPT layout-admin
<div style="background-color:blue;position:absolute;left:0px;top:0px;right:0px;height:50px"></div>
<div style="background-color:red;position:absolute;top:50px;left:0px;width:300px;bottom:10px;padding:0px;margin:0px"></div>
<div style="background-color:green;position:absolute;top:50px;left:310px;right:0px;bottom:10px;padding:0px;margin:0px">
<iframe src="http://www.taobao.com" frameborder="0" style="position:relative;width:100%;height:100%;"></iframe>
</div>

XPT html-angular
<!DOCTYPE html>
<html lang="en" data-ng-app>
<head>
<meta charset="utf-8" />
<!-- <script src="http://code.angularjs.org/angular&#45;1.0.1.min.js"></script> -->
<script src="/static/vendors/angular-1.4.8/angular.min.js"></script>
<title>Flask-Triangle - Tutorial</title>
</head>
<body>
<label>Name:</label>
<input type="text" data-ng-model="yourName" placeholder="Enter a name here" />
<hr/>
<h1>Hello {{yourName|angular}}!</h1>
</body>
</html>

XPT include-angular
<script src="/static/vendors/angular-1.4.8/angular.min.js"></script>
<script src="/static/vendors/angular-1.4.8/angular-resource.min.js"></script>

XPT angular-resource
`phonecatServices^.factory('`User^', ['$resource',
		function($resource){
			return $resource('/`user^/:id', {id:'@id'}, {
					query: {method:'GET', params:{phoneId:'phones'}, isArray:true},
			});
}]);

XPT include-bootstrap
<link rel="stylesheet" href="/static/vendors/bootstrap/3.3.6/css/bootstrap.min.css" />
<!-- Optional theme -->
<link rel="stylesheet" href="/static/vendors/bootstrap/3.3.6/css/bootstrap-theme.min.css" />
<script src="/static/vendors/jquery.js" ></script>
<script src="/static/vendors/bootstrap/3.3.6/js/bootstrap.min.js" ></script>

XPT header-mobile
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta property="qc:admins" content="245524267764737143526375" />
<meta name="viewport" content="width=device-width, initial-scale=1"/>

