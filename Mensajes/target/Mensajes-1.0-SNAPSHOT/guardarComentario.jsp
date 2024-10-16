<%@page import="com.oregoom.mensajes.MensajeDao"%>
<%@page import="com.oregoom.mensajes.Mensaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Obtener los datos del formulario
    String id = request.getParameter("id");
    String comentario = request.getParameter("mensaje");

    // Verificar si los datos son válidos
    if (id != null && !id.isEmpty()) {
        try {
            // Crear el DAO y actualizar el mensaje con el comentario
            MensajeDao mensajeDao = new MensajeDao();
            Mensaje mensaje = mensajeDao.seleccionarById(new Mensaje(Integer.parseInt(id)));

            // Guardar el comentario (aquí puedes añadir el comentario a un campo existente o crear uno nuevo)
            mensaje.setMensaje(comentario); // Asegúrate de que exista un método setComentario() en tu clase Mensaje
            mensajeDao.editar(mensaje); // Actualizar el mensaje con el comentario

            // Mostrar mensaje de éxito
            out.println("<p>Comentario guardado exitosamente.</p>");
        } catch (Exception e) {
            out.println("<p>Error al guardar el comentario: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p>Datos inválidos. No se puede guardar el comentario.</p>");
    }
%>
<a href="index.jsp">Regresar</a>
