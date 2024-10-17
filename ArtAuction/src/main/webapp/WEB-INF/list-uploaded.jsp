<%@ page import="java.util.ArrayList" %>
<%@ page import="java.nio.file.Path" %>

<%--
  Created by IntelliJ IDEA.
  User: dle
  Date: 10/15/24
  Time: 1:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<form action="/Upload" method="GET">
    <label for="uploadedFileId">Uploaded files</label>
    <select id="uploadedFileId" size="3" style="width: 800px;">
        <%
            @SuppressWarnings("unchecked")
            ArrayList<Path> uploaded = (ArrayList<Path>) request.getAttribute("uploaded");
            for (int i = 0; i < uploaded.size(); i++) {
                var path = uploaded.get(i);
                System.out.println(path);
        %>
        <option value=<%=i%>><%=path.toString()%></option>
        <%
            }
        %>
    </select>
    <button type="submit"></button>
</form>
</body>
</html>

