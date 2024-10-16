/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.oregoom.mensajes;

import java.io.File;
import java.io.IOException;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

public class QRCodeUtil {
    public static void generaCodigoQR(String qrContent, File qrFile) {
    QRCodeWriter qrCodeWriter = new QRCodeWriter();
    try {
        BitMatrix bitMatrix = qrCodeWriter.encode(qrContent, BarcodeFormat.QR_CODE, 200, 200);
        // Usa el ImageIO para escribir el archivo
        MatrixToImageWriter.writeToPath(bitMatrix, "PNG", qrFile.toPath());
    } catch (WriterException | IOException e) {
        e.printStackTrace();
    }
}

}