<%-- 
    Document   : editar
    Created on : 25 oct. 2020, 16:58:07
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="com.oregoom.mensajes.Mensaje"%>
<%@page import="com.oregoom.mensajes.MensajeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Editar Mensaje</title>
        <link rel="stylesheet" 
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
              crossorigin="anonymous">
    </head>
    <body>
        <!-- Modal -->
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="editar.jsp" method="POST">
                    <!-- Formulario sin el campo fecha -->
                    <div class="modal-header">
                        <h5 class="modal-title">Editar Mensaje</h5>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>Autor</label>
                            <input type="text" name="autor" class="form-control" value="<%=request.getParameter("autor")%>">
                        </div>

                        <div class="form-group">
                            <label>Cargo</label>
                            <input type="text" name="cargo" class="form-control" value="<%=request.getParameter("cargo")%>">
                        </div>

                        <div class="form-group">
                            <label>Codigo Personal</label>
                            <input type="text" name="codigo_personal" class="form-control" value="<%=request.getParameter("codigo_personal")%>">
                        </div>

                        <div class="form-group">
                            <label>Correo</label>
                            <input type="text" name="correo" class="form-control" value="<%=request.getParameter("correo")%>">
                        </div>

                        <div class="form-group">
                            <label>Teléfono</label>
                            <input type="text" name="telefono" class="form-control" value="<%=request.getParameter("telefono")%>">
                        </div>

                        <div class="form-group">
                            <input type="hidden" name="id" value="<%=request.getParameter("id")%>" >
                            <label>Ingrese un comentario</label>
                            <textarea class="form-control" name="mensaje" rows="3"><%=request.getParameter("mensaje")%></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <a href="index.jsp" class="btn btn-danger">Regresar</a>
                        <button type="submit" class="btn btn-primary" name="enviar">Guardar Cambios</button>
                    </div>
                </form>

            </div>
        </div>

        <%
            MensajeDao mensajeDao = new MensajeDao();

            String id = request.getParameter("id");
            String mensajeTexto = request.getParameter("mensaje");
            String autor = request.getParameter("autor");
            String cargo = request.getParameter("cargo");
            String codigoPersonal = request.getParameter("codigo_personal");
            String correo = request.getParameter("correo");
            String telefono = request.getParameter("telefono");

            if (request.getParameter("enviar") != null) {
                try {
                    Mensaje mensaje = new Mensaje(
                            Integer.parseInt(id.trim()),
                            mensajeTexto,
                            autor,
                            null, // No necesitas la fecha en este punto
                            cargo,
                            codigoPersonal,
                            correo,
                            telefono
                    );
                    int registros = mensajeDao.editar(mensaje);

                    if (registros > 0) {
                        out.println("<p>Mensaje actualizado correctamente.</p>");
                    } else {
                        out.println("<p>Error al actualizar el mensaje.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                }
            }
        %>


    </body>
</html>
