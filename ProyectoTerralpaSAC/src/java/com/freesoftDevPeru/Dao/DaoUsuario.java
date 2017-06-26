package com.freesoftDevPeru.Dao;

import com.freesoftDevPeru.Clases.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

public class DaoUsuario {

    public LinkedList<Usuario> listaUsuario(String pass,String user) throws ClassNotFoundException, SQLException {
        LinkedList<Usuario> lista = new LinkedList<Usuario>();
        ConexionBD con = new ConexionBD();
        con.getConexion();
        java.sql.Statement st = con.getConexion().createStatement();
        ResultSet rs = st.executeQuery("select * from usuarios where pass='"+pass+"' and usuario='"+user+"'");
        while (rs.next()) {
            Usuario resultados = new Usuario();
            resultados.setDni(rs.getInt("dni"));
            resultados.setNombreApellido(rs.getString("nombreApellido"));
            resultados.setUsuario(rs.getString("usuario"));
            resultados.setPass(rs.getString("pass"));
            resultados.setTipo(rs.getString("tipo"));
            lista.add(resultados);
        }
        con.cerrarConexion();
        return lista;
    }
    
    public LinkedList<Usuario> listaTotalUsuario(String dni) throws ClassNotFoundException, SQLException {
        LinkedList<Usuario> lista = new LinkedList<Usuario>();
        ConexionBD con = new ConexionBD();
        con.getConexion();
        java.sql.Statement st = con.getConexion().createStatement();
        ResultSet rs = st.executeQuery("select * from usuarios WHERE dni <> '"+dni+"'");
        while (rs.next()) {
            Usuario resultados = new Usuario();
            resultados.setDni(rs.getInt("dni"));
            resultados.setNombreApellido(rs.getString("nombreApellido"));
            resultados.setUsuario(rs.getString("usuario"));
            resultados.setPass(rs.getString("pass"));
            resultados.setTipo(rs.getString("tipo"));
            lista.add(resultados);
        }
        con.cerrarConexion();
        return lista;
    }
    
}
