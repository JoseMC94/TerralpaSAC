
package com.freesoftDevPeru.Clases;

public class Usuario {

    private int dni;
    private String nombreApellido;
    private String usuario;
    private String pass;
    private String tipo;
    
    public Usuario() {
    }

    public Usuario(int dni, String nombreApellido, String usuario, String pass, String tipo) {
        this.dni = dni;
        this.nombreApellido = nombreApellido;
        this.usuario = usuario;
        this.pass = pass;
        this.tipo = tipo;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getNombreApellido() {
        return nombreApellido;
    }

    public void setNombreApellido(String nombreApellido) {
        this.nombreApellido = nombreApellido;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
    
    public String toString(){
        return "dni: "+dni+"nombre y apellido: "+nombreApellido;
    }
    
}
