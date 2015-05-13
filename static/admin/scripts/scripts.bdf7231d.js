"use strict";angular.module("shuwoAdminApp",["ngAnimate","ngCookies","ngResource","ngRoute","ngSanitize","ngTouch","ui.router","mgcrea.ngStrap","ui.bootstrap"]).config(["$urlRouterProvider","$stateProvider","$httpProvider",function(a,b,c){var d=["$rootScope","$q","$injector",function(a,b,c){function d(a){return a}function e(a){var d=a.status;return 401==d?void c.get("$state").go("shuwo.account"):b.reject(a)}return function(a){return a.then(d,e)}}];c.responseInterceptors.push(d),c.defaults.headers.post["Content-Type"]="application/x-www-form-urlencoded;charset=utf-8",c.defaults.transformRequest=function(a){return void 0===a?a:$.param(a)},a.otherwise("/"),b.state("shuwo",{url:"",templateUrl:"views/base.html"}).state("shuwo.account",{url:"/account",controller:"AccountCtrl",templateUrl:"views/account.html"}).state("shuwo.default",{url:"/",templateUrl:"views/default.html",controller:"DefaultCtrl"}).state("shuwo.category",{"abstract":!0,url:"/category",template:"<ui-view />"}).state("shuwo.category.list",{url:"",templateUrl:"views/category.list.html",controller:"CategoryCtrl"}).state("shuwo.category.add",{url:"/add",templateUrl:"views/category.add.html",controller:"CategoryCtrl"}).state("shuwo.category.edit",{url:"/{categoryid:[0-9]{1,10}}",templateUrl:"views/category.edit.html",controller:"CategoryEditCtrl"}).state("shuwo.shop",{"abstract":!0,url:"/shop",template:"<ui-view />"}).state("shuwo.shop.list",{url:"",templateUrl:"views/shop.list.html",controller:"ShopCtrl"}).state("shuwo.shop.add",{url:"/add",templateUrl:"views/shop.add.html",controller:"ShopAddCtrl"}).state("shuwo.shop.detail",{url:"/{id:[0-9]{1,10}}",templateUrl:"views/shop.detail.html",controller:"ShopDetailCtrl"}).state("shuwo.shop.edit",{url:"/{id:[0-9]{1,10}}/edit",templateUrl:"views/shop.edit.html",controller:"ShopEditCtrl"}).state("shuwo.shop.product",{"abstract":!0,url:"/{id:[0-9]{1,10}}",template:"<ui-view />"}).state("shuwo.shop.product.list",{url:"/product",templateUrl:"views/shop.product.list.html",controller:"ShopProductCtrl"}).state("shuwo.shop.product.add",{url:"/product/add",templateUrl:"views/product.add.html",controller:"ProductAddCtrl"}).state("shuwo.shop.product.edit",{url:"/product/{productId:[0-9]{1,10}}",templateUrl:"views/product.edit.html",controller:"ProductEditCtrl"}).state("shuwo.order",{url:"/order","abstract":!0,template:"<ui-view />"}).state("shuwo.order.list",{url:"",templateUrl:"views/order.list.html",controller:"OrderListCtrl"}).state("shuwo.order.detail",{url:"/{id:[0-9]{1,20}}",templateUrl:"views/order.detail.html",controller:"OrderDetailCtrl"})}]).run(["$rootScope","$state","$stateParams","$http","$cookies",function(a,b,c,d,e){d.defaults.headers.common.Authorization=e.token,a.$state=b,a.$stateParams=c}]),angular.module("shuwoAdminApp").controller("DefaultCtrl",["$scope",function(){}]),angular.module("shuwoAdminApp").controller("CategoryCtrl",["$scope","$state","category",function(a,b,c){a.categoryList=[],c.listCategory().success(function(b){a.categoryList=b}).error(function(){alert("获取数据失败")}),a.selectCategory=function(b){a.selectedCategory=b},a.removeCategory=function(d){d.$hide(),a.selectedCategory&&c.deleteCategory(a.selectedCategory).success(function(){b.reload()}).error(function(){alert("删除失败")})},a.category={categoryname:""},a.saveCategory=function(){c.addCategory(a.category).success(function(){b.go("shuwo.category.list")}).error(function(){alert("添加出错")})}}]),angular.module("shuwoAdminApp").controller("CategoryEditCtrl",["$scope","$state","$stateParams","category",function(a,b,c,d){a.category={};var e=c.categoryid;d.getCategoryById(e).success(function(b){a.category=b}).error(function(){alert("获取数据出错")}),a.saveCategory=function(){d.updateCategory(a.category).success(function(){b.go("shuwo.category.list")}).error(function(){alert("保存出错！")})}}]),angular.module("shuwoAdminApp").service("constants",function(){var a="/shuwo/project/Api";return{api:{uptoken:a+"/uptoken",categoryAll:a+"/allcategory",category:a+"/category",shopAll:a+"/allshops",shop:a+"/shop",product:a+"/product",login:a+"/login",allOrders:a+"/allorder",order:a+"/order"}}}),angular.module("shuwoAdminApp").filter("category",function(){return function(a){var b={1:"个",2:"斤/克",3:"根",4:"盒"};return b[a]}}),angular.module("shuwoAdminApp").controller("ShopCtrl",["$scope","$state","shop",function(a,b,c){a.shopes=[],a.loading=!0,c.listShops().success(function(b){if("object"==typeof b)for(var c in b){var d=b[c];d.isopen="1"===d.isopen,a.shopes.push(d)}a.loading=!1}),a.selectShop=function(b){a.selectedShop=b},a.removeShop=function(d){d.$hide(),c.deleteShop(a.selectedShop),b.reload()},a.changeShopStatus=function(a){c.updateShopStatus(a)}}]),angular.module("shuwoAdminApp").controller("ShopAddCtrl",["$scope","$state","shop",function(a,b,c){function d(){var b=new BMap.Map("map");b.addControl(new BMap.NavigationControl),b.centerAndZoom("上海"),b.addEventListener("click",function(c){b.clearOverlays();var d=new BMap.Marker(c.point);b.addOverlay(d),a.shop.lat=c.point.lat,a.shop.lng=c.point.lng})}a.shop={simgurl:""},a.saveShop=function(){return void 0===a.shop.lat||void 0===a.shop.lng?void alert("请在地图上标出地点"):void c.newShop(a.shop).success(function(){b.go("shuwo.shop.list")}).error(function(){alert("创建失败！")})},d(),a.imageUploaded=function(b){a.shop.simgurl=b,a.$apply()}}]),angular.module("shuwoAdminApp").controller("ShopEditCtrl",["$scope","$state","$stateParams","shop",function(a,b,c,d){function e(){g=new BMap.Map("map"),g.addControl(new BMap.NavigationControl),g.centerAndZoom(new BMap.Point(a.shop.lng,a.shop.lat),15),g.addEventListener("click",function(b){g.clearOverlays();var c=new BMap.Marker(b.point);g.addOverlay(c),a.shop.lat=b.point.lat,a.shop.lng=b.point.lng})}var f=c.id;a.shop=void 0,d.getShopById(f).success(function(b){a.shop=b,a.shop.dlprice=Number(a.shop.dlprice),a.shop.isopen="1"===a.shop.isopen,e()});var g;a.$watch("shop",function(b,c){if(b!==c){var d=new BMap.Marker(new BMap.Point(a.shop.lng,a.shop.lat));g.addOverlay(d)}}),a.saveShop=function(){d.updateShop(a.shop).success(function(){b.go("shuwo.shop.list")})},a.imageUploaded=function(b){a.shop.simgurl=b,a.$apply()}}]),angular.module("shuwoAdminApp").controller("ShopDetailCtrl",["$scope","$state","$stateParams","shop",function(a,b,c,d){function e(){g=new BMap.Map("map"),g.addControl(new BMap.NavigationControl),g.centerAndZoom(new BMap.Point(a.shop.lng,a.shop.lat),15)}var f=c.id;a.shop=void 0,d.getShopById(f).success(function(b){a.shop=b,e()});var g;a.$watch("shop",function(b,c){if(b!==c){var d=new BMap.Marker(new BMap.Point(a.shop.lng,a.shop.lat));g.addOverlay(d)}})}]),angular.module("shuwoAdminApp").service("shop",["$http","constants",function(a,b){return{getShopById:function(c){return a.get(b.api.shop+"/"+c)},listShops:function(){return a.get(b.api.shopAll)},updateShop:function(c){return c.isopen=c.isopen?1:0,a.post(b.api.shop+"/"+c.shopid,c)},newShop:function(c){return a.post(b.api.shop,c)},deleteShop:function(c){return a["delete"](b.api.shop+"/"+c)},updateShopStatus:function(c){return a.post(b.api.shop+"/"+c.shopid+"/isopen",{isopen:c.isopen?1:0})}}}]),angular.module("shuwoAdminApp").service("category",["$http","constants",function(a,b){return{addCategory:function(c){return a.post(b.api.category,{categoryname:c.categoryname})},updateCategory:function(c){return a.post(b.api.category+"/"+c.categoryid,{categoryname:c.categoryname})},listCategory:function(){return a.get(b.api.categoryAll)},deleteCategory:function(c){return a["delete"](b.api.category+"/"+c)},getCategoryById:function(c){return a.get(b.api.category+"/"+c)}}}]),angular.module("shuwoAdminApp").controller("ShopProductCtrl",["$scope","$state","$stateParams","shop","product",function(a,b,c,d,e){var f=c.id;a.shop=void 0,a.loading=!0,a.products=[],d.getShopById(f).success(function(b){"object"==typeof b&&(a.shop=b)}),e.listProductsByShopId(f).success(function(b){if("object"==typeof b)for(var c in b){var d=b[c];d.issale="1"===d.issale,a.products.push(d)}a.loading=!1}),a.selectProduct=function(b){a.productSelected=b},a.removeProduct=function(c){c.$hide(),e.deleteProduct(a.productSelected),b.reload()},a.changeSaleStatus=function(a){e.updateProductStatus(a)}}]),angular.module("shuwoAdminApp").controller("ProductAddCtrl",["$scope","$state","$stateParams","shop","product","category",function(a,b,c,d,e,f){var g=c.id;a.product={issale:!0,shopid:g},a.options=[{label:"按数量销售，按重量计价",value:1},{label:"按重量销售，按重量计价",value:2},{label:"按数量销售，按数量计价",value:3}],a.product.attribute=a.options[0],a.categories=[],f.listCategory().success(function(b){for(var c in b)a.categories.push({label:b[c].categoryname,value:b[c].categoryid}),a.product.category=a.categories[0]}),a.imageUploaded=function(b){a.product.pimgurl=b,a.$apply()},a.saveProduct=function(){e.saveProduct(a.product),b.go("shuwo.shop.product.list")}}]),angular.module("shuwoAdminApp").controller("ProductEditCtrl",["$scope","$state","$stateParams","shop","product","category",function(a,b,c,d,e,f){function g(){f.listCategory().success(function(b){for(var c in b){var d={label:b[c].categoryname,value:b[c].categoryid};a.categories.push(d),b[c].categoryid==a.product.categoryid&&(a.product.category=d)}})}a.product={},a.categories=[],a.options=[{label:"按数量销售，按重量计价",value:1},{label:"按重量销售，按重量计价",value:2},{label:"按数量销售，按数量计价",value:3}],e.getProductById(c.productId).success(function(b){a.product=b,a.product.attribute=a.options[a.product.attribute-1],a.product.issale="1"===a.product.issale,g()}),a.imageUploaded=function(b){a.product.pimgurl=b,a.$apply()},a.updateProduct=function(){e.updateProduct(a.product),b.go("shuwo.shop.product.list")}}]),angular.module("shuwoAdminApp").service("product",["$http","constants",function(a,b){return{listProductsByShopId:function(c){return a.get(b.api.shop+"/"+c+"/allproducts")},saveProduct:function(c){var d=c.attribute;c.attribute=d.value;var e=c.category;return c.categoryid=e.value,c.issale=c.issale?1:0,a.post(b.api.product,c)},updateProduct:function(c){var d=c.attribute;c.attribute=d.value;var e=c.category;return c.categoryid=e.value,c.issale=c.issale?1:0,a.post(b.api.product+"/"+c.productid,c)},deleteProduct:function(c){return a["delete"](b.api.product+"/"+c.productid)},getProductById:function(c){return a.get(b.api.product+"/"+c)},updateProductStatus:function(c){return a.post(b.api.product+"/"+c.productid+"/issale",{issale:c.issale?1:0})}}}]),angular.module("shuwoAdminApp").controller("UploadCtrl",["$scope","upload","constants",function(a,b,c){Qiniu.uploader({runtimes:"html5,flash,html4",browse_button:"upload-btn",uptoken_url:c.api.uptoken,unique_names:!0,domain:"http://7u2out.com1.z0.glb.clouddn.com/",container:"container",max_file_size:"100mb",flash_swf_url:"js/plupload/Moxie.swf",max_retries:3,dragdrop:!0,drop_element:"container",chunk_size:"4mb",auto_start:!0,init:{FilesAdded:function(a,b){plupload.each(b,function(){})},BeforeUpload:function(){},UploadProgress:function(){},FileUploaded:function(b,c,d){var e=b.getOption("domain"),f=JSON.parse(d),g=e+f.key;a.$parent.imageUploaded(g),console.log(g)},Error:function(){},UploadComplete:function(){},Key:function(){var a="";return a}}})}]),angular.module("shuwoAdminApp").service("upload",function(){var a="";return{setImage:function(b){a=b},getImage:function(){return a}}}),angular.module("shuwoAdminApp").controller("AccountCtrl",["$scope","$state","$cookies","account",function(a,b,c,d){a.login=function(){d.login(a.user).success(function(a){c.token=a.utoken,b.go("shuwo.default")})}}]),angular.module("shuwoAdminApp").service("account",["$http","constants",function(a,b){return{login:function(c){return a.post(b.api.login,c)}}}]),angular.module("shuwoAdminApp").controller("OrderListCtrl",["$scope","order",function(a,b){function c(){a.loading=!0,b.listAllOrders((a.page-1)*a.perPage,a.perPage,a.status).success(function(b){a.orders=b,10===b.length&&(a.totalItems+=10),a.loading=!1})}a.loading=!0,a.status=-1,a.page=1,a.perPage=10,a.totalItems=1,c(),a.$watch("page",function(a,b){a!=b&&c()})}]),angular.module("shuwoAdminApp").controller("OrderDetailCtrl",["$scope","$stateParams","order","shop",function(a,b,c,d){var e=b.id;a.orderLoading=!0,a.shopLoading=!0,c.getOrderById(e).success(function(b){a.order=b,a.shopLoading=!1,d.getShopById(b.shopid).success(function(b){a.shop=b,a.shopLoading=!1})})}]),angular.module("shuwoAdminApp").service("order",["$http","constants",function(a,b){return{listAllOrders:function(c,d,e){return a.get(b.api.allOrders,{params:{start:c,count:d,status:e}})},getOrderById:function(c){return a.get(b.api.order+"/"+c)}}}]),angular.module("shuwoAdminApp").filter("humanTime",["$filter",function(a){return function(b){var c=new Date(b);b=c.getTime()/1e3;var d=new Date;if(c.getFullYear()!=d.getFullYear()||c.getMonth()!=d.getMonth())return a("date")(c,"yyyy-MM-dd HH:mm");if(d.getDate()-c.getDate()==1)return"昨天 "+a("date")(c,"HH:mm");var e=Date.now(),f=Math.ceil(e/1e3)-b;return 60>f?"刚刚":60>f/60?Math.ceil(f/60)+"分钟前":f/60>60&&24>f/60/60?Math.ceil(f/60/60)+"小时前":a("date")(1e3*b,"MM-dd HH:mm")}}]);