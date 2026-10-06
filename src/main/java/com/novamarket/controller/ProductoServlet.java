package com.novamarket.controller;

import com.novamarket.dao.ProductoDAO;
import com.novamarket.model.Producto;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ProductoServlet", urlPatterns = {"/ProductoServlet"})
public class ProductoServlet extends HttpServlet {

    private ProductoDAO productoDAO = new ProductoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if ("eliminar".equals(accion)) {
            String idTexto = request.getParameter("id");
            if (idTexto != null && !idTexto.isEmpty()) {
                int id = Integer.parseInt(idTexto);
                productoDAO.eliminarProducto(id);
            }
        }

        List<Producto> lista = productoDAO.listarProductos();
        request.setAttribute("listaProductos", lista);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String precioTexto = request.getParameter("precio");
        String stockTexto = request.getParameter("stock");

        try {
            double precio = Double.parseDouble(precioTexto);
            int stock = Integer.parseInt(stockTexto);

            Producto producto = new Producto(nombre, descripcion, precio, stock);
            productoDAO.guardarProducto(producto);

            response.sendRedirect("ProductoServlet");

        } catch (NumberFormatException e) {
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h2>Error: el precio y el stock deben ser valores numéricos.</h2>");
        }
    }
}