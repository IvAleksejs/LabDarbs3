<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<html>
	<head>
    <meta charset="utf-8">
		<link rel="SHORTCUT ICON" href="https://png.pngtree.com/png-vector/20190115/ourmid/pngtree-vector-checklist-icon-png-image_319748.jpg" type="image/x-icon">
		<title>Shopping List</title>
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<link href="styles/index.css" rel="stylesheet">
	</head>
	<body>

    <div class="body download">
      <a href="index.jsp">
        <svg width="20px"fill="#000000" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 532.439 532.439" xml:space="preserve">
        <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <g> 
        <polygon points="532.439,44.56 241.74,266.22 532.439,487.88 532.439,377.05 386.484,266.22 532.439,155.39 "></polygon> 
        <polygon points="290.699,487.88 290.699,377.05 144.744,266.22 290.699,155.39 290.699,44.56 0,266.22 "></polygon> 
        </g> </g> </g></svg>
      </a><br>
      <div><button onclick="downloadSessionData()">Saglabat produktu sarakstus</button></div>
    </div>

    <script>
      function downloadSessionData() {
        var userProductList = <%= new com.google.gson.Gson().toJson(session.getAttribute("shoppingList")) %>;
        var element = document.createElement('a');

        element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(JSON.stringify(userProductList)));
        element.setAttribute('download', 'userProductList.json');

        document.body.appendChild(element);
        element.click();
        document.body.removeChild(element);
      }
    </script>
	</body>
</html>
