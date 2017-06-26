/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.freesoftDevPeru.Clases;

/**
 *
 * @author José Maldonado <josephcand at gmail.com>
 */
public class Cliente {

    private int dni;
    private String nombre;
    private String apellido;
    private String correo;
    private String direccion;
    private String observacion;

    public Cliente() {
    }

    public Cliente(int dni, String nombre, String apellido, String correo, String direccion, String observacion) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.direccion = direccion;
        this.observacion = observacion;
    }

    public String getObservacion() {
        return observacion;
    }

    public void setObservacion(String observacion) {
        this.observacion = observacion;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    @Override
    public String toString(){
        return "DNI Cliente: "+dni+" nombre Apellidos: "+nombre+" "+apellido+"correo: "+correo
                +"Direccion: "+direccion;
    }
    
}
