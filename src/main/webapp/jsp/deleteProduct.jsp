<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.function.Predicate" %>
<%@ page import="lv.javagury.android.Purchase" %>

<%
  String product = request.getParameter("product");
  String selectedList = request.getParameter("selectedList");

  Map<String, List<Purchase>> shoppingList = (Map<String, List<Purchase>>) session.getAttribute("shoppingList");

  if (shoppingList.containsKey(selectedList)) {
    final String dProduct = product;
    List<Purchase> certainList = shoppingList.get(selectedList);
    certainList.removeIf(new Predicate<Purchase>() {
      @Override
      public boolean test(Purchase purchase) {
        return purchase.getName().equals(dProduct);
      }
    });
  }

  session.setAttribute("shoppingList", shoppingList);
%>
