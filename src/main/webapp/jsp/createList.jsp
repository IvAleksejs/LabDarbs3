<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="lv.javagury.android.Purchase" %>

<%
  String listName = request.getParameter("listName");

  Map<String, List<Purchase>> shoppingList = (Map<String, List<Purchase>>) session.getAttribute("shoppingList");
  List<Purchase> newList = new ArrayList<>();

  if (shoppingList == null) { shoppingList = new HashMap<>(); }

  shoppingList.put(listName, newList);

  session.setAttribute("shoppingList", shoppingList);
%>
