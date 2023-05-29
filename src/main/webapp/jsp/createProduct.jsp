<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="lv.javagury.android.Purchase" %>

<%
  String name = request.getParameter("name");
  String quantity = request.getParameter("quantity");
  String selectedList = request.getParameter("selectedList");

  Map<String, List<Purchase>> shoppingList = (Map<String, List<Purchase>>) session.getAttribute("shoppingList");
  List<Purchase> certainList = shoppingList.get(selectedList);
  Purchase newProduct = new Purchase();

  newProduct.setName(name);
  newProduct.setQuantity(quantity);
  certainList.add(newProduct);

  session.setAttribute("shoppingList", shoppingList);
%>