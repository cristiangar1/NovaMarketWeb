<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.novamarket.model.Producto" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>NovaMarket - Gestión de Productos</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; background-color: #f4f4f9; }
        .container { display: flex; gap: 30px; }
        .form-box { background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); width: 320px; }
        .table-box { flex-grow: 1; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        label { display: block; margin-top: 10px; font-weight: bold; }
        input { width: 100%; padding: 8px; margin-top: 5px; box-sizing: border-box; }
        button { margin-top: 15px; width: 100%; padding: 10px; background-color: #28a745; color: white; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; }
        button:hover { background-color: #218838; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { border: 1px solid #ddd; padding: 10px; text-align: left; }
        th { background-color: #007bff; color: white; }
        .btn-danger { background-color: #dc3545; color: white; padding: 6px 12px; text-decoration: none; border-radius: 4px; font-size: 12px; }
    </style>
</head>
<body>

<h1>Bienvenido a NovaMarket</h1>
<p>Mi tienda virtual - Módulo de gestión de productos</p>

<div class="container">
    <div class="form-box">
        <h2>Registrar Producto</h2>
        <form action="ProductoServlet" method="POST">
            <label>Nombre del Producto:</label>
            <input type="text" name="nombre" required>

            <label>Descripción:</label>
            <input type="text" name="descripcion" required>

            <label>Precio:</label>
            <input type="number" step="0.01" name="precio" required>

            <label>Stock Inicial:</label>
            <input type="number" name="stock" required>

            <button type="submit">Guardar en Base de Datos</button>
        </form>
    </div>

    <div class="table-box">
        <h2>Inventario Registrado</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Precio</th>
                    <th>Stock</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Producto> lista = (List<Producto>) request.getAttribute("listaProductos");
                    if (lista != null && !lista.isEmpty()) {
                        for (Producto p : lista) {
                %>
                <tr>
                    <td><%= p.getId() %></td>
                    <td><%= p.getNombre() %></td>
                    <td><%= p.getDescripcion() %></td>
                    <td>$<%= p.getPrecio() %></td>
                    <td><%= p.getStock() %></td>
                    <td>
                        <a href="ProductoServlet?accion=eliminar&id=<%= p.getId() %>" class="btn-danger" onclick="return confirm('¿Seguro que desea eliminar este registro?');">Eliminar</a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="6">No se han cargado datos. Ingrese mediante el Servlet para consultar.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>