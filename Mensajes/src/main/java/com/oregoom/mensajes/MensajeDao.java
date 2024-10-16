package com.oregoom.mensajes;

import static com.oregoom.mensajes.Conexion.*;
import java.sql.*;
import java.util.*;

public class MensajeDao {

    private Connection conn = null;
    private PreparedStatement ps = null;

    private Mensaje mensaje;

    public List<Mensaje> seleccionar() throws ClassNotFoundException {
        ResultSet rs = null;
        String sql = "SELECT * FROM mensajes";
        List<Mensaje> mensajes = new ArrayList<>();

        try {
            this.conn = getConexion();
            this.ps = this.conn.prepareStatement(sql);
            rs = this.ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id_mensaje");
                String msm = rs.getString("mensaje");
                String autor = rs.getString("autor");
                String fechar = rs.getString("fecha");
                String cargo = rs.getString("cargo");
                String codigoPersonal = rs.getString("codigo_personal");
                String correo = rs.getString("correo");
                String telefono = rs.getString("telefono");

                this.mensaje = new Mensaje(id, msm, autor, fechar, cargo, codigoPersonal, correo, telefono);
                mensajes.add(this.mensaje);
            }
        } catch (SQLException ex) {
            ex.printStackTrace(System.out);
        } finally {
            try {
                cerrar(rs);
                cerrar(this.ps);
                cerrar(this.conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return mensajes;
    }

    public int inserta(Mensaje mensaje) throws ClassNotFoundException {
        String sql = "INSERT INTO mensajes (mensaje, autor, cargo, codigo_personal, correo, telefono, fecha) VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIME())";
        int registros = 0;
        try {
            this.conn = getConexion();
            this.ps = this.conn.prepareStatement(sql);

            this.ps.setString(1, mensaje.getMensaje());
            this.ps.setString(2, mensaje.getAutor());
            this.ps.setString(3, mensaje.getCargo());
            this.ps.setString(4, mensaje.getCodigoPersonal());
            this.ps.setString(5, mensaje.getCorreo());
            this.ps.setString(6, mensaje.getTelefono());

            registros = this.ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error SQL: " + ex.getMessage());
            ex.printStackTrace(System.out);
        } finally {
            try {
                cerrar(this.ps);
                cerrar(this.conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return registros;
    }

    public int editar(Mensaje mensaje) throws ClassNotFoundException {
        String sql = "UPDATE mensajes SET mensaje=?, autor=?, fecha=CURRENT_TIMESTAMP(), cargo=?, codigo_personal=?, correo=?, telefono=? WHERE id_mensaje=?";
        int registros = 0;
        try {
            this.conn = getConexion();
            this.ps = this.conn.prepareStatement(sql);

            // Asignación correcta de los valores
            this.ps.setString(1, mensaje.getMensaje());
            this.ps.setString(2, mensaje.getAutor());
            this.ps.setString(3, mensaje.getCargo());
            this.ps.setString(4, mensaje.getCodigoPersonal());
            this.ps.setString(5, mensaje.getCorreo());
            this.ps.setString(6, mensaje.getTelefono());
            this.ps.setInt(7, mensaje.getId());

            registros = this.ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error SQL: " + ex.getMessage());
            ex.printStackTrace(System.out);
        } finally {
            try {
                cerrar(this.ps);
                cerrar(this.conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return registros;
    }

    public int eliminar(Mensaje mensaje) throws ClassNotFoundException {
        String sql = "DELETE FROM mensajes WHERE id_mensaje=?";
        int registros = 0;
        try {
            this.conn = getConexion();
            this.ps = this.conn.prepareStatement(sql);

            this.ps.setInt(1, mensaje.getId());
            registros = this.ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error SQL: " + ex.getMessage());
            ex.printStackTrace(System.out);
        } finally {
            try {
                cerrar(this.ps);
                cerrar(this.conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return registros;
    }

    public Mensaje seleccionarById(Mensaje mensaje) throws ClassNotFoundException {
        String sql = "SELECT * FROM mensajes WHERE id_mensaje=?";
        Mensaje resultado = null; // Inicializamos resultado como null
        try {
            this.conn = getConexion();
            this.ps = this.conn.prepareStatement(sql);

            this.ps.setInt(1, mensaje.getId());
            ResultSet rs = this.ps.executeQuery(); // Usamos executeQuery para obtener un ResultSet

            if (rs.next()) { // Comprobamos si hay resultados
                // Creamos un nuevo objeto Mensaje con los datos del ResultSet
                resultado = new Mensaje(
                        rs.getInt("id_mensaje"),
                        rs.getString("mensaje"),
                        rs.getString("autor"),
                        rs.getString("fecha"),
                        rs.getString("cargo"),
                        rs.getString("codigo_personal"),
                        rs.getString("correo"),
                        rs.getString("telefono")
                );
            }

        } catch (SQLException ex) {
            System.out.println("Error SQL: " + ex.getMessage());
            ex.printStackTrace(System.out);
        } finally {
            try {
                cerrar(this.ps);
                cerrar(this.conn);
            } catch (SQLException ex) {
                ex.printStackTrace(System.out);
            }
        }
        return resultado; // Devolvemos el objeto Mensaje
    }

}
