<%@page import="com.oregoom.mensajes.Mensaje"%>
<%@page import="com.oregoom.mensajes.MensajeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Datos del Fiscal</title>
        <link rel="stylesheet" 
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
              crossorigin="anonymous">
    </head>
    <body>
        <%
            // Obtener los datos del mensaje desde la base de datos usando el ID
            String idParam = request.getParameter("id");
            MensajeDao mensajeDao = new MensajeDao();
            Mensaje mensaje = null;

            if (idParam != null && !idParam.isEmpty()) {
                Mensaje mensajeConsulta = new Mensaje(Integer.valueOf(idParam));
                mensaje = mensajeDao.seleccionarById(mensajeConsulta); // Obtener el mensaje de la base de datos
            }
            
            // Procesar el envío del formulario
            if (request.getParameter("enviar") != null) {
                String mensajeTexto = request.getParameter("mensaje"); // Obtener el texto del mensaje
                if (idParam != null && !idParam.isEmpty()) {
                    mensaje.setMensaje(mensajeTexto); // Actualizar el mensaje en el objeto existente
                    mensajeDao.editar(mensaje); // Guardar los cambios en la base de datos
                }
            }
        %>

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Datos del Fiscal</h5>
                </div>
                <div class="modal-body">
                    <% if (mensaje != null) { %>
                        <div class="form-group">
                            <label>Nombre y Apellido</label>
                            <p class="form-control-static"><%=mensaje.getAutor()%></p>
                        </div>
                        <div class="form-group">
                            <label>Cargo</label>
                            <p class="form-control-static"><%=mensaje.getCargo()%></p>
                        </div>
                        <div class="form-group">
                            <label>Codigo Personal</label>
                            <p class="form-control-static"><%=mensaje.getCodigoPersonal()%></p>
                        </div>
                        <div class="form-group">
                            <label>Correo</label>
                            <p class="form-control-static"><%=mensaje.getCorreo()%></p>
                        </div>
                        <div class="form-group">
                            <label>Teléfono</label>
                            <p class="form-control-static"><%=mensaje.getTelefono()%></p>
                        </div>
                        <!-- Formulario para agregar un comentario -->
                        <form action="guardarComentario.jsp" method="POST">
                            <div class="form-group">
                                <label>Comentario</label>
                                <textarea class="form-control" name="mensaje" rows="3"></textarea>
                            </div>
                            <!-- Campo oculto para el ID del mensaje -->
                            <input type="hidden" name="id" value="<%=mensaje.getId()%>">
                            <div class="modal-footer">
                                <a href="index.jsp" class="btn btn-danger">Regresar</a>
                                <!-- Botón para enviar el comentario -->
                                <button type="submit" class="btn btn-primary" name="enviar">Guardar Comentario</button>
                            </div>
                        </form>
                    <% } else { %>
                        <p>Mensaje no encontrado.</p>
                    <% } %>
                </div>
            </div>
        </div>
    </body>
</html>
