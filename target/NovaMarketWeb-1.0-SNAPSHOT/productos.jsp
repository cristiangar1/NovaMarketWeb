<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.novamarket.model.Producto"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Productos - NovaMarket</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }

        h1 {
            text-align: center;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
        }

        th, td {
            border: 1px solid #cccccc;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #eeeeee;
        }

        .boton {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            text-decoration: none;
            background-color: #eeeeee;
            color: black;
            border-radius: 5px;
        }
    </style>
</head>

<body>

    <h1>Productos de NovaMarket</h1>

    <table>

        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Stock</th>
            </tr>
        </thead>

        <tbody>

            <%
                List<Producto> productos =
                        (List<Producto>) request.getAttribute("productos");

                if (productos != null && !productos.isEmpty()) {

                    for (Producto producto : productos) {
            %>

            <tr>
                <td><%= producto.getId_producto() %></td>
                <td><%= producto.getNombre_producto() %></td>
                <td><%= producto.getDescripcion() %></td>
                <td>$<%= producto.getPrecio() %></td>
                <td><%= producto.getStock() %></td>
            </tr>

            <%
                    }

                } else {
            %>

            <tr>
                <td colspan="5">
                    No hay productos registrados.
                </td>
            </tr>

            <%
                }
            %>

        </tbody>

    </table>

    <a class="boton" href="producto-form.html">
        Registrar nuevo producto
    </a>

</body>
</html>