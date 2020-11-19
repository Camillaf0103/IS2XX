<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Registrer ny bruker</title>
    <link rel="stylesheet" href="test.css"/>
</head>
<body>
<ul>
    <li><form action="${pageContext.request.contextPath}/LoggUt" method="post">
        <input type="submit" value="Logg ut" /></form></li>
    <li><a href="RegistrerAdmin.jsp">Legg til ny Superbruker</a></li>
    <li><a href="RegistrerTrener.jsp">Legg til ny Trener</a></li>
        <li style="float:left"><button class="button" onclick="goBack()">G� tilbake</button>
            <script>
                function goBack() {
                    window.history.back();
                }
            </script></li>

</ul>
<%
    //allow access only if session exists
    String Bruker = null;
    if(session.getAttribute("Bruker") == null){
        response.sendRedirect("Login.jsp");
    }else Bruker = (String) session.getAttribute("Bruker");
    String bruker = null;
    String sessionID = null;
    Cookie[] cookies = request.getCookies();
    if(cookies !=null){
        for(Cookie cookie : cookies){
            if(cookie.getName().equals("Bruker")) bruker = cookie.getValue();
            if(cookie.getName().equals("JSESSIONID")) sessionID = cookie.getValue();
        }
    }
%>
<br>
<br>
<br>
User=<%=Bruker %>
<br>



<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AdminSide</title>
<div class="Introduksjon">
    <h1> Hei ${Bruker}. Her velger du hvilken type bruker du �nsker � registrere. Benytt valgene nedenfor for � legge inn brukere av ulik type <b> </h1>
</div>
<div class="Introduksjon">
    <button class="button"><a href="RegistrerAdmin.jsp">Legg til ny administrator</a></button>
    <button class="button"><a href="RegistrerTrener.jsp">Legg til ny trener</a></button>
</div>
<br>

</body>
</html>