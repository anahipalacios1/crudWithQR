package com.oregoom.mensajes;

public class Mensaje {
    private int id;
    private String mensaje;
    private String autor;
    private String fecha;
    private String cargo;
    private String codigoPersonal;
    private String correo;
    private String telefono;

    public Mensaje() {
    }

    public Mensaje(int id) {
        this.id = id;
    }

    public Mensaje(String mensaje, String autor) {
        this.mensaje = mensaje;
        this.autor = autor;
    }
    
    public Mensaje(String mensaje, String autor,String cargo, String codigoPersonal, String correo, String telefono) {
        this.mensaje = mensaje;
        this.autor = autor;
        this.cargo = cargo;
        this.codigoPersonal = codigoPersonal;
        this.correo = correo;
        this.telefono = telefono;
    }

    public Mensaje(int id, String mensaje, String autor) {
        this.id = id;
        this.mensaje = mensaje;
        this.autor = autor;
    }

    public Mensaje(int id, String mensaje, String autor, String fecha) {
        this.id = id;
        this.mensaje = mensaje;
        this.autor = autor;
        this.fecha = fecha;
    }
    public Mensaje(int id, String mensaje, String autor, String fecha, String cargo) {
        this.id = id;
        this.mensaje = mensaje;
        this.autor = autor;
        this.fecha = fecha;
        this.cargo = cargo;
    }
    public Mensaje(int id, String mensaje, String autor, String fecha,String cargo, String codigoPersonal) {
        this.id = id;
        this.mensaje = mensaje;
        this.autor = autor;
        this.fecha = fecha;
        this.cargo = cargo;
        this.codigoPersonal = codigoPersonal;
    }
    public Mensaje(int id, String mensaje, String autor, String fecha, String cargo, String codigoPersonal, String correo) {
        this.id = id;
        this.mensaje = mensaje;
        this.autor = autor;
        this.fecha = fecha;
        this.cargo = cargo;
        this.codigoPersonal = codigoPersonal;
        this.correo = correo;
    }
    public Mensaje(int id, String mensaje, String autor, String fecha, String cargo, String codigoPersonal, String correo, String telefono) {
        this.id = id;
        this.mensaje = mensaje;
        this.autor = autor;
        this.fecha = fecha;
        this.cargo = cargo;
        this.codigoPersonal = codigoPersonal;
        this.correo = correo;
        this.telefono = telefono;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMensaje() {
        return mensaje;
    }

    public void setMensaje(String mensaje) {
        this.mensaje = mensaje;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public String getCodigoPersonal() {
        return codigoPersonal;
    }

    public void setCodigoPersonal(String codigoPersonal) {
        this.codigoPersonal = codigoPersonal;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("Mensaje{id: ").append(id);
        sb.append("\n Mensaje: ").append(mensaje);
        sb.append("\n Nombre: ").append(autor);
        sb.append("\n Fecha: ").append(fecha);
        sb.append("\n Cargo: ").append(cargo);
        sb.append("\n CodigoPersonal: ").append(codigoPersonal);
        sb.append("\n Correo: ").append(correo);
        sb.append("\n Telefono: ").append(telefono);
        sb.append('}');
        return sb.toString();
    }

}
