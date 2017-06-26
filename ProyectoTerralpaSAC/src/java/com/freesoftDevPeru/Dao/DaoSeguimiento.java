package com.freesoftDevPeru.Dao;

import com.freesoftDevPeru.Clases.Documento;
import com.freesoftDevPeru.Clases.Seguimiento;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.LinkedList;

public class DaoSeguimiento {

    public void guardarSeguimiento(String fecha, String uDestino, String uEnvio, String Observacion, String Documento) throws SQLException {
        ConexionBD con = new ConexionBD();
        String sql = "insert into seguimiento values(NULL,'" + fecha + "','" + uDestino + "','" + uEnvio + "','" + Observacion + "','" + Documento + "')";
        Statement s = (Statement) con.getConexion().createStatement();
        s.executeUpdate(sql);
        con.cerrarConexion();
    }

    public LinkedList<Seguimiento> listaDocumentoUsuario(String nombreUsuario) throws ClassNotFoundException, SQLException {
        LinkedList<Seguimiento> lista = new LinkedList<Seguimiento>();
        ConexionBD con = new ConexionBD();
        con.getConexion();
        java.sql.Statement st = con.getConexion().createStatement();
        ResultSet rs = st.executeQuery("select * from seguimiento where seguimiento.udestino='" + nombreUsuario + "'");
        while (rs.next()) {
            Seguimiento resultados = new Seguimiento();
            resultados.setFecha(rs.getString("fecha"));
            resultados.setuDestino(rs.getString("udestino"));
            resultados.setuEnvio(rs.getString("uenvio"));
            resultados.setObservacion(rs.getString("obs"));
            resultados.setIdDocumento(rs.getString("Documento_nombreDocumento"));

            lista.add(resultados);
        }
        con.cerrarConexion();
        return lista;
    }

//    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        DaoSeguimiento seg = new DaoSeguimiento();
//        seg.guardarSeguimiento("12/07/17", "maria.farfan", "jose.maldonado", "pasar atastrodocumento", "documeto");
//
//        for (Iterator iterator = seg.listaDocumentoUsuario("Farfan Ochatoma, Maria Magdalena").iterator(); iterator.hasNext();) {
//            Seguimiento next = (Seguimiento) iterator.next();
//            System.out.println(next.getIdDocumento());
//        }
//    }

}
