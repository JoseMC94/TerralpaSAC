package com.freesoftDevPeru.Clases;

public class Documento {
    
    private int idDocumento;
    private String nombre;
    private String descripcion;
    private int idCliente;
    private int idUsuario;
    
    
    public Documento(){
        
    }

    public Documento(int idDocumento, String nombre, String descripcion, int Cliente, int usuario) {
        this.idDocumento = idDocumento;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.idCliente = Cliente;
        this.idUsuario = usuario;
    }
    
    

    public int getIdDocumento() {
        return idDocumento;
    }

    public void setIdDocumento(int idDocumento) {
        this.idDocumento = idDocumento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int Cliente) {
        this.idCliente = Cliente;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    @Override
    public String toString(){
        return "idDocumento"+idDocumento+" nombre : "+nombre
                +"descripcion: "+descripcion;
    }
}
