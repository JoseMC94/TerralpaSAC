<%@page import="com.freesoftDevPeru.Clases.Seguimiento"%>
<%@page import="com.freesoftDevPeru.Dao.DaoSeguimiento"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.freesoftDevPeru.Clases.Documento"%>
<%@page import="com.freesoftDevPeru.Dao.DaoDocumento"%>
<%@page import="com.freesoftDevPeru.Clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="miUsuario" scope="session" class="com.freesoftDevPeru.Clases.Usuario"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico" />
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Documentos Recibidos</title>
        <jsp:include page="../imports/bootstrap.html"/>
        <jsp:include page="../imports/menu.jsp"/>
    </head>
    <body>
        <div class="container muestra">
            <h1>Documetos Recibidos</h1>
            <h3>
                Usuario:   <jsp:getProperty name="miUsuario" property="nombreApellido"/>
            </h3>




            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Fecha</th>
                        <th>Nombre Proyecto</th>
                        <th>Destinatario</th>
                        <th>Observación</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>

                        <%
                            Usuario login = (Usuario) session.getAttribute("miUsuario");

                            DaoSeguimiento seg = new DaoSeguimiento();
                            for (Iterator iterator = seg.listaDocumentoUsuario(login.getNombreApellido()).iterator(); iterator.hasNext();) {
                                Seguimiento next = (Seguimiento) iterator.next();
                                out.println("<tr>");
                                out.println("<td>" + next.getFecha() + "</td>");
                                out.println("<td>" + next.getIdDocumento() + "</td>");
                                out.println("<td>" + next.getuEnvio() + "</td>");
                                out.println("<td>" + next.getObservacion() + "</td>");
                                out.println("<td>" + "<a href=\"\">aceptar</a>" + "</td>");
                                out.println("</tr>");

                            }
                        %>   

                </tbody>
            </table>

        </div>

    </body>
</html>
