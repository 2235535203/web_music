	funtion sentdatabase()
	{
		function creatXMLHttpRequest ()
		{//创建XMLHttpRequest对象
			var xmlhttp;
			if (window.XMLHttpRequest)
			{
		//  IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
			xmlhttp=new XMLHttpRequest();
		}
		else
		{
			// IE6, IE5 浏览器执行代码
			xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
		}
		xmlhttp.onreadystatechange=function()
		{
			if (xmlhttp.readyState==4 && xmlhttp.status==200)
			{
				document.getElementById("search").innerHTML=xmlhttp.responseText;
			}
		}
		}
		
		function sent（）//获取用户搜索信息
		{
			createXMLHttpRequest();
            xmlHttp.onreadystatechange = handleStateChange;
			var sent= {
				"searchmessage":"健康歌"，//初始化
			}
			sent.searchmessage = document.getElementById('keywords').value;
			//从keywords获取值
		}
		 xmlHttp.open("GET", "http://localhost:8081/Tomcat_ktv/Search", true);
            xmlHttp.setRequestHeader("Content-type", "application/json");
            xmlHttp.send(sent);//向服务器发送数据
		
	}
		

	
	