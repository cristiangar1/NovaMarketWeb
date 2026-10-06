package com.novamarket.config;

import java.sql.Connection;

public class PruebaConexion {
    public static void main(String[] args) {
        Connection con = Conexion.obtenerConexion();
        if (con != null) {
            System.out.println("Conexion exitosa");
        } else {
            System.out.println("Error de conexion");
        }
    }
}