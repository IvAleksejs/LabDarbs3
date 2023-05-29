<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="lv.javagury.android.Purchase" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link rel="SHORTCUT ICON" href="https://png.pngtree.com/png-vector/20190115/ourmid/pngtree-vector-checklist-icon-png-image_319748.jpg" type="image/x-icon">
		<title>Shopping List</title>
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<link href="styles/index.css" rel="stylesheet">

		<script>
			$(function() {
				$(document).on("click", "#createListButton", () => {
					var listName = $("#listName").val();

					if (listName) {
						$.post("jsp/createList.jsp", { listName },
						() => { location.reload(); });
					}
				});
			});
		</script>
	</head>
	<body>

		<%
			Map<String, List<Purchase>> shoppingList = (Map<String, List<Purchase>>) session.getAttribute("shoppingList");
		%>

		<div class="body">
			<div class="createList">
				<h3>Izveidot jaunu sarakstu:</h3>
				<div class="button">
					<input type="text" id="listName" placeholder="Sarakstu nosaukums" required>
					<button id="createListButton">Pievienot</button>
				</div>
			</div>

			<% if (shoppingList != null) { %>
			<form action="" method="get">
				<select id="selectList" name="selectList">
					<option selected disabled hidden>Izveleties sarakstu</option>

					<%
						String selectedList = request.getParameter("selectList");
						if (shoppingList != null) {
							for (String listName : shoppingList.keySet()) {
								out.println("<option value=\""+listName+"\">"+listName+"</option>");
							}
						}
					%>
				</select>
			</form>
			<% } else { %>
					<p>Neviens saaraksts vel nav izveidots</p>
			<% } %>

			<div class="syncWreapper"><a class="sync" href="synchronization.jsp">Sinhronizet sarakstus</a></div>
		</div>

		<script>
			$(function() {
				$('#selectList').on('change', () => {
					var hrefValue = $('#selectList').val();
					window.location.href = "shoppingList.jsp?selectList=" + hrefValue;
				});
			});
		</script>
	</body>
</html>
