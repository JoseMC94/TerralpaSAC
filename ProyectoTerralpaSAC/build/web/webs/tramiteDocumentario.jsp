<%@page import="com.freesoftDevPeru.Clases.Seguimiento"%>
<%@page import="com.freesoftDevPeru.Dao.DaoSeguimiento"%>
<%@page import="com.freesoftDevPeru.Dao.DaoDocumento"%>
<%@page import="com.freesoftDevPeru.Clases.Usuario"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.freesoftDevPeru.Clases.Documento"%>
<%@page import="com.freesoftDevPeru.Dao.DaoUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="miUsuario" scope="session" class="com.freesoftDevPeru.Clases.Usuario"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico" />
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Seguimiento de trámite documentario</title>
        <jsp:include page="../imports/bootstrap.html"/>
        <jsp:include page="../imports/menu.jsp"/>


        <script language="javascript" src="../js/enviarDocumento.js"></script>


    </head>
    <body>
        <div class="container-fuid">
            <div class="container subC">
                <h1 style="text-align: center">Seguimiento de Documentos</h1>
                <h2> Buscar Documento</h2>
                <div class="row">

                    <div class="col-lg-offset-3 col-lg-6">
                        <form class="form-horizontal formularioBuscar" role="form" method="post" action="../contrlBuscarDocumento">
                            <div class="form-group">
                                <label  class="col-lg-2 control-label">Buscar</label>
                                <div class="col-lg-8">
                                    <input name="inputBuscar" type="text" class="form-control" placeholder="Código Documento">
                                </div>
                                <div class="col-lg-2">
                                    <button type="submit" class="btn btn-primary">BUSCAR</button>
                                </div>
                            </div>

                        </form>
                    </div>

                </div>


                <h2>Enviar Documento</h2>
                <div class="row">
                    <div class="col-lg-offset-3 col-lg-6">
                        <form method="post" action="../CntrlDocumentosEnviados" class="form-horizontal formularioEnviar" role="form" id="dataEnviar">

                            <div class="form-group">
                                <label  class="col-lg-4 control-label">Usuario Remitente :</label>
                                <div class="col-lg-8">
                                    <input name="usuarioEnvio" id="usuarioEnvio" type="text" class="form-control" value="<jsp:getProperty name="miUsuario" property="nombreApellido"/>" disabled>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-4 control-label">Documento :</label>
                                <div class="col-lg-8">
                                    <select name="documento" class="form-control" >

                                        <%

                                            Usuario login = (Usuario) session.getAttribute("miUsuario");

                                            DaoDocumento listaDoc = new DaoDocumento();
                                            Documento doc = new Documento();
                                            for (Iterator iterator = listaDoc.listaDocumentoUsuario("" + login.getDni()).iterator(); iterator.hasNext();) {
                                                Documento next = (Documento) iterator.next();
                                                out.println("<option>");
                                                out.println(next.getNombre());
                                                out.println("</option>");
                                            }%>             
                                    </select>


                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-4 control-label">Usuario Destino:</label>
                                <div class="col-lg-8">
                                    <select name="usuarioRecibe" class="form-control" >

                                        <%
                                            // Usuario login = (Usuario) session.getAttribute("miUsuario");

                                            DaoUsuario user = new DaoUsuario();
                                            for (Iterator iterator = user.listaTotalUsuario("" + login.getDni()).iterator();
                                                    iterator.hasNext();) {
                                                Usuario next = (Usuario) iterator.next();
                                                out.println("<option>");
                                                out.println(next.getNombreApellido());
                                                out.println("</option>");
                                            }
                                        %>

                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label  class="col-lg-4 control-label">Observaciones :</label>
                                <div class="col-lg-8">
                                    <textarea name="observacion" class="form-control" rows="5" id="comment"></textarea>
                                </div>

                            </div>

                            <div class="form-group">
                                <div class="col-lg-offset-4 col-lg-2">
                                    <button type="submit" class="btn btn-primary">ENVIAR</button>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>

            </div>

        </div>
    </body>
</html>
