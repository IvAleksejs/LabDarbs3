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
			$(function () {
				$("#createProduct").submit(() => {
					var name = $("#name").val();
					var quantity = $("#quantity").val();
					var selectedList = $("#selectList").val();

					$.post("jsp/createProduct.jsp", { name, quantity, selectedList },
          () => { location.reload(1); });
				});

				$(document).on("click", ".deleteProduct", function() {
					var product = $(this).parent().siblings(".name").text().trim();
					var selectedList = $("#selectList").val();

					$.post("jsp/deleteProduct.jsp", { product, selectedList },
          () => { location.reload(); });
				});

        $(document).on("click", "#deleteList", function() {
					var selectedList = $("#selectList").val();

					$.post("jsp/deleteList.jsp", { selectedList }, 
          () => { window.location.href = "index.jsp"; });
				});
			});
		</script>
	</head>
	<body>

    <%
      Map<String, List<Purchase>> shoppingList = (Map<String, List<Purchase>>) session.getAttribute("shoppingList");
    %>

    <div class="body list">
      <%if (shoppingList != null) { %>
      <div class="header">
        <a href="index.jsp" class="back">
          <svg width="20px"fill="#000000" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 532.439 532.439" xml:space="preserve"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"> <g> <g> <polygon points="532.439,44.56 241.74,266.22 532.439,487.88 532.439,377.05 386.484,266.22 532.439,155.39 "></polygon> <polygon points="290.699,487.88 290.699,377.05 144.744,266.22 290.699,155.39 290.699,44.56 0,266.22 "></polygon> </g> </g> </g></svg>
        </a>
        <form id="selectListForm" action="" method="get">
          <select id="selectList" name="selectList">
            <option selected disabled hidden>Izveleties sarakstu</option>

            <%
              String selectedList = request.getParameter("selectList");
              for (String listName : shoppingList.keySet()) {
                boolean isSelected = listName.equals(selectedList);
                String selected = isSelected ? "selected" : "";

                out.println("<option value=\""+listName+"\""+selected+">"+listName+"</option>");
              }
            %>
          </select>
        </form>
        <a href="synchronization.jsp" class="sync">Sinhronizet sarakstus</a>
      </div>

      <table>
        <thead>
          <tr>
            <th>Nosaukums</th>
            <th>Daudzums</th>
            <th></th>
          </tr>
        </thead>
        <tbody>

          <%
            if (shoppingList != null && selectedList != null && shoppingList.containsKey(selectedList)) {
              List<Purchase> certainList = shoppingList.get(selectedList);
              if (certainList.isEmpty()) {
                out.println("<tr><td>-</td><td>-</td><td>-</td></tr>");
              } else {
                for (Purchase purchase : certainList) {
                  out.println("<tr>");
                  out.println("<td class=\"name\">" + purchase.getName() + "</td>");
                  out.println("<td>" + purchase.getQuantity() + "</td>");
                  out.println("<td><button class=\"deleteProduct\">Nodzest</button></td>");
                  out.println("</tr>");
                }
              }
            }
          %>
        </tbody>
      </table>

      <form id="createProduct" action="" method="post">
        <input type="text" id="name" name="name" placeholder="Nosaukums" required>
        <input type="number" id="quantity" name="quantity" placeholder="Daudzums" required>
        <button type="submit">Pievienot</button>
      </form>

      <div class="deleteList">
        <button id="deleteList">Nodzest sarakstu</button>
      </div>

      <% } %>
    </div>

    <script>
      $(function() {
        $('#selectList').on('change', () => $('#selectListForm').submit());
      });
    </script>
	</body>
</html>
