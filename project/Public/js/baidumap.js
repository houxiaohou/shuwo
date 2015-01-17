    //创建一个地图
	var map = new BMap.Map('container');
    //设置地图显示中心及放大倍数
    map.centerAndZoom('上海市嘉定区',12);
    //启用滚轮放大缩小，默认禁止
    map.enableScrollWheelZoom();
    //启用地图惯性拖拽，默认禁止
    map.enableContinuousZoom();
    //添加默认缩放平移控件
    map.addControl(new BMap.NavigationControl());
    //添加默认缩略地图控件，右下角打开
    map.addControl(new BMap.OverviewMapControl({isOpen:true,anchor:BMAP_ANCHOR_BOTTOM_RIGHT}));

    //新建一个查询
    var localSearch = new BMap.LocalSearch(map);
    //允许自动调节窗体大小
    localSearch.enableAutoViewport();

    function searchByStationName(){
    	map.clearOverlays();//清空原先的标注
      var provinceIndex = document.getElementById("loc_province").selectedIndex;
    	var province = document.getElementById("loc_province").options[provinceIndex].text;
    	document.getElementById("Province_1").value = province;

      var cityIndex = document.getElementById("loc_city").selectedIndex;
    	var city = document.getElementById("loc_city").options[cityIndex].text;
    	document.getElementById("City_1").value = city;

      var distinctIndex = document.getElementById("loc_town").selectedIndex;
    	var distinct = document.getElementById("loc_town").options[distinctIndex].text;
    	document.getElementById("Distinct_1").value = distinct;
      
    	var shopAddress = document.getElementById("ShopAddress").value;
    	var keyword = province + city + distinct + shopAddress;
    	localSearch.setSearchCompleteCallback( function(searchResult){
    		var poi = searchResult.getPoi(0);
    		document.getElementById("Longitude").value = poi.point.lng;
    		document.getElementById("Latitude").value = poi.point.lat;
    		map.centerAndZoom(poi.point,13);

    		//创建标注，为要查询地址的经纬度
    		var marker = new BMap.Marker(new BMap.Point(poi.point.lng,poi.point.lat));
    		map.addOverlay(marker);
    		var content = shopAddress + "<br/><br/>经度：" + poi.point.lng + "<br/>纬度：" + poi.point.lat;
    		var infoWindow = new BMap.InfoWindow("<p style='font-size:14px;'>" + content + '</p>');
    		marker.addEventListener('click',function(){
    			this.openInfoWindow(infoWindow);
    		});
    		marker.setAnimation(BMAP_ANIMATION_BOUNCE);
    	});
    	localSearch.search(keyword);
    }