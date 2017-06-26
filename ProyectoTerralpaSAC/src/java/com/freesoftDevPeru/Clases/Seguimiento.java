package com.freesoftDevPeru.Clases;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;


public class Seguimiento {

    private int idSeguimineto;
    private String fecha;
    private String uDestino;
    private String uEnvio;
    private String Observacion;
    private String nombreDoc;

    public Seguimiento(int idSeguimineto, String fecha, String uDestino, String uEnvio, String Observacion, String idDocumento) {
        this.idSeguimineto = idSeguimineto;
        this.fecha = fecha;
        this.uDestino = uDestino;
        this.uEnvio = uEnvio;
        this.Observacion = Observacion;
        this.nombreDoc = idDocumento;
    }

    public Seguimiento() {

    }

    public int getIdSeguimineto() {
        return idSeguimineto;
    }

    public void setIdSeguimineto(int idSeguimineto) {
        this.idSeguimineto = idSeguimineto;
    }

    public String getFecha() {
        Date ahora = new Date();
        SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yy");
        return formateador.format(ahora);
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getuDestino() {
        return uDestino;
    }

    public void setuDestino(String uDestino) {
        this.uDestino = uDestino;
    }

    public String getuEnvio() {
        return uEnvio;
    }

    public void setuEnvio(String uEnvio) {
        this.uEnvio = uEnvio;
    }

    public String getObservacion() {
        return Observacion;
    }

    public void setObservacion(String Observacion) {
        this.Observacion = Observacion;
    }

    public String getIdDocumento() {
        return nombreDoc;
    }

    public void setIdDocumento(String idDocumento) {
        this.nombreDoc = idDocumento;
    }

}
