package com.freesoftDevPeru.Dao;

import com.freesoftDevPeru.Clases.Cliente;
import com.freesoftDevPeru.Clases.Documento;
import com.freesoftDevPeru.Clases.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author José Maldonado <josephcand at gmail.com>
 */
public class DaoDocumento {

    public LinkedList<Documento> listaDocumentoUsuario(String dni) throws ClassNotFoundException, SQLException {
        LinkedList<Documento> lista = new LinkedList<Documento>();
        ConexionBD con = new ConexionBD();
        con.getConexion();
        java.sql.Statement st = con.getConexion().createStatement();
        ResultSet rs = st.executeQuery("select * from documento where Usuarios_dni=" + dni);
        while (rs.next()) {
            Documento resultados = new Documento();
            resultados.setIdDocumento(rs.getInt("idDocumento"));
            resultados.setNombre(rs.getString("nombreProyecto"));
            resultados.setDescripcion(rs.getString("Descripcion"));
            resultados.setIdCliente(rs.getInt("Cliente_dni"));
            resultados.setIdUsuario(rs.getInt("Usuarios_dni"));

            lista.add(resultados);
        }
        con.cerrarConexion();
        return lista;
    }

    public LinkedList<Object> DocumentoBuscar(String nombre) throws ClassNotFoundException, SQLException {
        LinkedList<Object> lista = new LinkedList<Object>();

        ConexionBD con = new ConexionBD();
        con.getConexion();
        java.sql.Statement st = con.getConexion().createStatement();
        ResultSet rs = st.executeQuery("select idDocumento, nombreProyecto,Descripcion,Cliente_dni,Usuarios_dni,nombre,apellido,correo,direccion,nombreApellido from documento  inner join cliente on documento.Cliente_dni=cliente.dni inner join usuarios on documento.Usuarios_dni=usuarios.dni  where nombreProyecto='" + nombre + "'");
        while (rs.next()) {
            Documento doc = new Documento();
            doc.setIdDocumento(rs.getInt("idDocumento"));
            doc.setNombre(rs.getString("nombreProyecto"));
            doc.setDescripcion(rs.getString("Descripcion"));
            doc.setIdCliente(rs.getInt("Cliente_dni"));
            doc.setIdUsuario(rs.getInt("Usuarios_dni"));
            lista.add(doc);
            Cliente cliente = new Cliente();
            cliente.setDni(rs.getInt("Cliente_dni"));
            cliente.setNombre(rs.getString("nombre"));
            cliente.setApellido(rs.getString("apellido"));
            cliente.setCorreo(rs.getString("correo"));
            cliente.setDireccion(rs.getString("direccion"));
            lista.add(cliente);
            Usuario user = new Usuario();
            user.setDni(rs.getInt("Usuarios_dni"));
            user.setNombreApellido(rs.getString("nombreApellido"));
            lista.add(user);
        }
        con.cerrarConexion();
        return lista;
    }

//    public static void main(String[] args) throws ClassNotFoundException, SQLException {
//        DaoDocumento d = new DaoDocumento();
//        for (Iterator iterator = (Iterator) d.DocumentoBuscar("Construcción Sol").iterator(); iterator.hasNext();) {
//            Object next = (Object) iterator.next();
//            System.out.println(next.toString());
//
//        }
//    }
}
