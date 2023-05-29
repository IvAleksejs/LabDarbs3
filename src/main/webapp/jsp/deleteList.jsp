<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="lv.javagury.android.Purchase" %>

<% 
  String selectedList = request.getParameter("selectedList");

  Map<String, List<Purchase>> shoppingList = (Map<String, List<Purchase>>) session.getAttribute("shoppingList");

  if (shoppingList.containsKey(selectedList)) {
    shoppingList.remove(selectedList);
  }

  session.setAttribute("shoppingList", shoppingList);
%>
