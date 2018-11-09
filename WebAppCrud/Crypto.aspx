<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Crypto.aspx.cs" Inherits="WebAppCrud.Crypto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>CryptoList from DB:</h1>
            <asp:GridView ID="GridView1" AutoGenerateColumns="true" runat="server">

            </asp:GridView>
        </div>
    </form>

<h1>KURSY</h1><div id="czas" style="font-size: 20px"></div>
<p>
<!-- <label for="btc"><b>BTC:</b></label> <div id="btc"></div> -->
<!-- <br> -->
<!-- <label for="etc"><b>ETC:</b></label> <div id="etc"></div> -->
<p>
<input type="button" value="ODŚWIEŻ" onclick="odswiez()">
	
<div id="oblBTC" style="width: 400px;"></div>
<div id="oblBTC7d" style="width: 400px;"></div>
<div id="oblBTC24h" style="width: 400px;"></div>
<div id="oblBTC1h" style="width: 400px;"></div>
<br>
<div id="oblETC" style="width: 400px;"></div>
<div id="oblETC7d" style="width: 400px;"></div>
<div id="oblETC24h" style="width: 400px;"></div>
<div id="oblETC1h" style="width: 400px;"></div>
<br>

<script>
		 
		setInterval("location.reload()",30000);

		//clock
		var dt = new Date();
		var s = dt.getSeconds().toString();
        var m =  dt.getMinutes().toString();
        var h = dt.getHours().toString();
        if (s < 10) s = '0' + s;
        if (m < 10) m = '0' + m;
        if (h < 10) h = '0' + h;
		document.getElementById("czas").innerHTML = h + ":" + m + ":" + s;

        function odswiez() {
		javascript:location.reload();
		}
		
		var xhr = new XMLHttpRequest();
		xhr.open("GET", "https://api.coinmarketcap.com/v2/ticker/?limit=2", false);
		xhr.send();
		console.log(xhr.status);
		console.log(xhr.responseText);
		
		var fixedResponse = xhr.responseText.replace(/\\'/g, "'");  
		var jsonObj = JSON.parse(fixedResponse);  
		
		/*
		document.getElementById("btc").innerHTML = jsonObj.data[1].quotes.USD.price + "<br>7d: " + jsonObj.data[1].quotes.USD.percent_change_7d +"<br>24h: " + jsonObj.data[1].quotes.USD.percent_change_24h + "<br>1h: " + jsonObj.data[1].quotes.USD.percent_change_1h;
		
		document.getElementById("etc").innerHTML = jsonObj.data[1027].quotes.USD.price + "<br>7d: " + jsonObj.data[1027].quotes.USD.percent_change_7d +"<br>24h: " + jsonObj.data[1027].quotes.USD.percent_change_24h + "<br>1h: " + jsonObj.data[1027].quotes.USD.percent_change_1h;
		*/
				
		var a = jsonObj.data[1].quotes.USD.price;
		var d7_btc = jsonObj.data[1].quotes.USD.percent_change_7d;
		var h24_btc = jsonObj.data[1].quotes.USD.percent_change_24h;
		var h1_btc = jsonObj.data[1].quotes.USD.percent_change_1h;
		
		var b = jsonObj.data[1027].quotes.USD.price;
		var d7_etc = jsonObj.data[1027].quotes.USD.percent_change_7d;
		var h24_etc = jsonObj.data[1027].quotes.USD.percent_change_24h;
		var h1_etc = jsonObj.data[1027].quotes.USD.percent_change_1h;


		document.getElementById("oblBTC").innerHTML = "BTC $" + Math.round(a*100)/100;;
        document.getElementById("oblBTC7d").innerHTML = "7D " + d7_btc;
		document.getElementById("oblBTC24h").innerHTML = "24H " + h24_btc;
		document.getElementById("oblBTC1h").innerHTML = "1H " + h1_btc;
		
		document.getElementById("oblETC").innerHTML = "ETC $" + Math.round(b*100)/100;;
		document.getElementById("oblETC7d").innerHTML = "7D " + d7_etc;
		document.getElementById("oblETC24h").innerHTML = "24H " + h24_etc;
		document.getElementById("oblETC1h").innerHTML = "1H " + h1_etc;
		
		if (a<7000) {
		document.getElementById("oblBTC").style.color = 'green';
		} else {
		document.getElementById("oblBTC").style.color = 'red';
		}
		
			if (d7_btc<-5) {
				document.getElementById("oblBTC7d").style.color = 'green';
			} else {
			document.getElementById("oblBTC7d").style.color = 'red';
			}
			if (h24_btc<-2) {
				document.getElementById("oblBTC24h").style.color = 'green';
			} else {
			document.getElementById("oblBTC24h").style.color = 'red';
			}
			if (h1_btc<-1) {
				document.getElementById("oblBTC1h").style.color = 'green';
			} else {
			document.getElementById("oblBTC1h").style.color = 'red';
			}
			
		
		if (b<500) {
		document.getElementById("oblETC").style.color = 'green';
		} else {
		document.getElementById("oblETC").style.color = 'red';
		}
		
			if (d7_etc<-5) {
				document.getElementById("oblETC7d").style.color = 'green';
			} else {
			document.getElementById("oblETC7d").style.color = 'red';
			}
			if (h24_etc<-2) {
				document.getElementById("oblETC24h").style.color = 'green';
			} else {
			document.getElementById("oblETC24h").style.color = 'red';
			}
			if (h1_etc<-1) {
				document.getElementById("oblETC1h").style.color = 'green';
			} else {
			document.getElementById("oblETC1h").style.color = 'red';
			}

	</script>

</body>
</html>
