<%@page import="com.freesoftDevPeru.Clases.Usuario"%>
<jsp:useBean id="miUsuario" scope="session" class="com.freesoftDevPeru.Clases.Usuario"></jsp:useBean>

<%
    Usuario login = (Usuario) session.getAttribute("miUsuario");
    //String n = login.getNombreApellido();
    if (login.getNombreApellido() == null) {
        response.sendRedirect("../index.html");
}%>

<%--<%=n%>--%>

<nav class="navbar navbar-default navbar-fixed-botton navbar-inverse">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#" style="font-family: 'Baloo Bhaina', cursive;font-size:  40px;">
                TERRALPA 
            </a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="#">Asistencia</a></li>
                <li><a href="#">Proforma</a></li>
                <li><a href="#">Seguimiento de Documento</a></li>


                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Clientes <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Agregar Clientes</a></li>
                        <li><a href="#">Listado de Clientes</a></li>
                        <li><a href="#">Historial de Clientes</a></li>
                    </ul>
                </li>

                <li><a href="#">Inventario</a></li>
            </ul>


            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">

                        <span class="glyphicon glyphicon-user"></span>
                    </a></li>


                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">

                        <jsp:getProperty name="miUsuario" property="nombreApellido"/>

                        <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="../ctnrlDocumentosRecibidos">Documentos Recibidos</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="../CntrlSalirLogin">Salir</a></li>
                    </ul>
                </li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>