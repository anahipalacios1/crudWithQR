<%-- 
    Document   : index
    Created on : 25 oct. 2020, 1:47:18
    Author     : Sammy Guergachi <sguergachi at gmail.com>
--%>

<%@page import="com.oregoom.mensajes.Mensaje"%>
<%@page import="java.util.*"%>
<%@page import="com.oregoom.mensajes.MensajeDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mensajes</title>
        <link rel="stylesheet" 
              href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
              integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" 
              crossorigin="anonymous">
    </head>
    <body>

        <!-- Modal -->
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="index.jsp" method="POST">
                    <div class="modal-header">
                        <h5 class="modal-title">Insertar Persona</h5>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="autor">Nombre y apellido</label>
                            <input id="autor" type="text" name="autor" class="form-control" placeholder="Nombre completo">
                        </div>

                        <div class="form-group">
                            <label for="cargo">Cargo</label>
                            <input id="cargo" type="text" name="cargo" class="form-control" placeholder="Cargo en la empresa">
                        </div>

                        <div class="form-group">
                            <label for="codigo_personal">Codigo Personal</label>
                            <input id="codigo_personal" type="text" name="codigo_personal" class="form-control" placeholder="Código personal">
                        </div>

                        <div class="form-group">
                            <label for="correo">Correo</label>
                            <input id="correo" type="text" name="correo" class="form-control" placeholder="Correo electrónico">
                        </div>

                        <div class="form-group">
                            <label for="telefono">Telefono</label>
                            <input id="telefono" type="text" name="telefono" class="form-control" placeholder="Número de teléfono">
                        </div>
                        
                        <div class="form-group">
                            <label for="mensaje">Comentario</label>
                            <textarea id="mensaje" class="form-control" name="mensaje" rows="3" placeholder="Escribe tu mensaje aquí..."></textarea>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" name="enviar">Enviar</button>
                    </div>
                </form>
            </div>
        </div>
        <%
            MensajeDao mensajeDao = new MensajeDao();
            try {
                if (request.getParameter("enviar") != null) {
                    String mensajeText = request.getParameter("mensaje");
                    String autor = request.getParameter("autor");
                    String cargo = request.getParameter("cargo");
                    String codigoPersonal = request.getParameter("codigo_personal");
                    String correo = request.getParameter("correo");
                    String telefono = request.getParameter("telefono");

                    // Imprimir los parámetros para comprobar
                    System.out.println("Mensaje: " + mensajeText);
                    System.out.println("Autor: " + autor);
                    System.out.println("Cargo: " + cargo);
                    System.out.println("Codigo Personal: " + codigoPersonal);
                    System.out.println("Correo: " + correo);
                    System.out.println("Telefono: " + telefono);

                    Mensaje mensaje = new Mensaje(mensajeText, autor, cargo, codigoPersonal, correo, telefono);
                    mensajeDao.inserta(mensaje);
                }
            } catch (Exception e) {
                out.println("<p>Error: " + e.getMessage() + "</p>");
                e.printStackTrace(System.out);
            }

        %>

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Todas las personas</h5>
                </div>
                <%					//MensajeDao mensajeDao = new MensajeDao();
                    List<Mensaje> mensajes = mensajeDao.seleccionar();

                    Collections.reverse(mensajes);

                    for (Mensaje mensaje : mensajes) {


                %>
                <div class="modal-body">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title"><%=mensaje.getAutor()%></h5>
                            <p class="card-text"><%=mensaje.getMensaje()%></p>
                            <p class="blockquote-footer"><cite><%=mensaje.getFecha()%></cite></p>
                            <a href="editar.jsp?id=<%=mensaje.getId()%>
                               &&mensaje=<%=mensaje.getMensaje()%>
                               &&autor=<%=mensaje.getAutor()%>
                               &&cargo=<%=mensaje.getCargo()%>
                               &&codigo_personal=<%=mensaje.getCodigoPersonal()%>
                               &&correo=<%=mensaje.getCorreo()%>
                               &&telefono=<%=mensaje.getTelefono()%>"
                               class="card-link">Editar</a>
                            <a href="eliminar.jsp?id=<%=mensaje.getId()%>" class="card-link">Eliminar</a>
                            <a href="seleccionar_id.jsp?id=<%=mensaje.getId()%>" class="card-link">Generar QR</a>
                        </div>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
    </body>
</html>
