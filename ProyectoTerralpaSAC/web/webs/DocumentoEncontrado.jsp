<%-- 
    Document   : DocumentoEncontrado
    Created on : 05/06/2017, 04:22:48 AM
    Author     : José Maldonado <josephcand at gmail.com>
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="miDocumentoEncontrado" scope="session" class="com.freesoftDevPeru.Clases.Documento"></jsp:useBean>
<jsp:useBean id="miCliente" scope="session" class="com.freesoftDevPeru.Clases.Cliente"></jsp:useBean>
<jsp:useBean id="miUsuarioDoc" scope="session" class="com.freesoftDevPeru.Clases.Usuario"></jsp:useBean>
    <!DOCTYPE html>
    <html>
        <head>
            <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.ico" />
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Documento Encontrado</title>
        <jsp:include page="../imports/bootstrap.html"/>
        <jsp:include page="../imports/menu.jsp"/>
    </head>
    <body>

        <div class="container muestra">
            
            <div class="row">
                <div class="col-lg-offset-2 col-lg-8">
                    <h2>Datos Documento</h2>
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3 class="panel-title"> Número de Documento: <jsp:getProperty name="miDocumentoEncontrado" property="idDocumento"/></h3>
                        </div>
                        <div class="panel-body">
                            <p>nombre de Proyecto:
                                <jsp:getProperty name="miDocumentoEncontrado" property="nombre"/></p>
                            <p>Descripcion Proyecto:
                                <jsp:getProperty name="miDocumentoEncontrado" property="descripcion"/></p>
                            <p>Dni Cliente:
                                <jsp:getProperty name="miCliente" property="dni"/></p>
                            <p>nombre Cliente:
                                <jsp:getProperty name="miCliente" property="nombre"/>
                                <jsp:getProperty name="miCliente" property="apellido"/></p>
                            <p>
                                Direccion:
                                <jsp:getProperty name="miCliente" property="direccion"/>
                            </p>
                            <p>Correo:
                                <jsp:getProperty name="miCliente" property="correo"/></p>
                            <p>Observaciones:
                                <jsp:getProperty name="miCliente" property="observacion"/></p>
                            <p>Usuario atencion:       
                                <jsp:getProperty name="miUsuarioDoc" property="nombreApellido"/></p>
                            <p>Dni Usuario:
                                <jsp:getProperty name="miUsuarioDoc" property="dni"/>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
