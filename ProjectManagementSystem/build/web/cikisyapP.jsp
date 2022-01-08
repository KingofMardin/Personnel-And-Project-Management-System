<%
session.setAttribute("kullaniciAdi", null);
session.invalidate();
response.sendRedirect("personelGiris.jsp");
%>