package com.freesoftDevPeru.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author José Maldonado <josephcand at gmail.com>
 */
public class ConexionBD {

    private Connection conexion = null;
    private String servidor = "localhost";
    private String database = "terralpasac";
    private String usuario = "root";
    private String password = "newlifefb94";
    private String url = "";

    public ConexionBD() {
        try {

            this.servidor = servidor;
            this.database = database;
            Class.forName("com.mysql.jdbc.Driver");
            url = "jdbc:mysql://" + servidor + "/" + database;
            conexion = DriverManager.getConnection(url, usuario, password);
            
//            para la web  o pruebas utilizar este link 
   //         conexion = DriverManager.getConnection("jdbc:mysql://node66411-freesoftdev.jls-sto1.elastx.net/terralpasac", "freesoftdev", "70905469");

            System.out.println("Conexion a Base de Datos " + url + " . . . . .Ok");
        } catch (SQLException ex) {
            System.out.println(ex);
        } catch (ClassNotFoundException ex) {
            System.out.println(ex);
        }
    }

    public Connection getConexion() {
        return conexion;
    }

    public Connection cerrarConexion() {
        try {
            conexion.close();
//            System.out.println("Cerrando conexion a " + url + " . . . . . Ok");
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        conexion = null;
        return conexion;
    }

//    public static void main(String[] args) throws ClassNotFoundException, SQLException {
//        ConexionBD con = new ConexionBD();
//
//        DaoUsuario user = new DaoUsuario();
//
//        for (Iterator iterator = user.listaUsuario("123456", "jose.maldonado").iterator(); iterator.hasNext();) {
//            Usuario next = (Usuario) iterator.next();
//            System.out.println(next.getNombreApellido());
//        }
//
//        for (Iterator iterator = user.listaTotalUsuario("70905469").iterator(); iterator.hasNext();) {
//            Usuario next = (Usuario) iterator.next();
//            System.out.println(next.getNombreApellido());
//        }
//
//        DaoDocumento dD = new DaoDocumento();
//        for (Iterator iterator = dD.listaDocumentoUsuario("70905469").iterator(); iterator.hasNext();) {
//            Documento next = (Documento) iterator.next();
//            System.out.println(next.getNombre());
//        }
//
//    }
}
