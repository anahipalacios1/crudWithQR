<%@page import="com.oregoom.mensajes.QRCodeUtil"%>
<%@page import="java.io.IOException"%>
<%@page import="com.oregoom.mensajes.MensajeDao"%>
<%@page import="com.oregoom.mensajes.Mensaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="com.google.zxing.BarcodeFormat"%>
<%@page import="com.google.zxing.WriterException"%>
<%@page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>
<%@page import="com.google.zxing.common.BitMatrix"%>
<%@page import="com.google.zxing.qrcode.QRCodeWriter"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Generar QR</title>
</head>
<body>
<%
    String idParam = request.getParameter("id");
    MensajeDao mensajeDao = new MensajeDao();
    Mensaje mensaje = null;

    if (idParam != null && !idParam.isEmpty()) {
        try {
            // Crear un objeto Mensaje con el ID
            Mensaje mensajeConsulta = new Mensaje(Integer.valueOf(idParam));
            mensaje = mensajeDao.seleccionarById(mensajeConsulta); // Obtener el mensaje

            if (mensaje != null) {
                // Aquí puedes llamar a la función para generar el código QR
                String qrContent = "http://localhost:8080/Mensajes/qr_id.jsp?id=" + mensaje.getId();

                // Generar la ruta completa donde se guardará la imagen del código QR
                File qrDir = new File(application.getRealPath("/") + "qrCodes");
                if (!qrDir.exists()) {
                    qrDir.mkdirs(); // Crea la carpeta si no existe
                }
                File qrFile = new File(qrDir, "qrCode.png"); // Archivo QR

                // Llama al método para generar el QR
                QRCodeUtil.generaCodigoQR(qrContent, qrFile); 

                // Mostrar la imagen del código QR
                out.println("<h3>Código QR generado:</h3>");
                out.println("<img src='qrCodes/qrCode.png' alt='Código QR' />"); // Asegúrate de que esta ruta sea correcta
            } else {
                out.println("<p>Mensaje no encontrado.</p>");
            }
        } catch (Exception e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        }
    } else {
        out.println("<p>ID no proporcionado.</p>");
    }
%>
</body>
</html>
