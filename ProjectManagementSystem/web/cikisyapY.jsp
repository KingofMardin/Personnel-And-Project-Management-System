<%
session.setAttribute("kullaniciAdi", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>