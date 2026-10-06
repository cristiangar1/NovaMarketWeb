<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Producto - NovaMarket</title>

        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 40px;
                background-color: #f5f5f5;
            }

            .contenedor {
                max-width: 700px;
                margin: auto;
                background-color: white;
                padding: 30px;
                border-radius: 10px;
            }

            h1 {
                text-align: center;
            }

            .exito {
                padding: 15px;
                margin-bottom: 25px;
                background-color: #e8f5e9;
                border: 1px solid #81c784;
                border-radius: 5px;
            }

            .dato {
                margin: 12px 0;
            }

            .boton {
                display: inline-block;
                margin-top: 20px;
                margin-right: 10px;
                padding: 10px 15px;
                text-decoration: none;
                background-color: #eeeeee;
                color: black;
                border-radius: 5px;
            }
        </style>
    </head>

    <body>

        <div class="contenedor">

            <h1>NovaMarket</h1>

            <h2>Producto registrado</h2>

            <% if (Boolean.TRUE.equals(request.getAttribute("guardado"))) { %>

                <div class="exito">
                    <strong>✓ Producto registrado correctamente.</strong>
                    <br>
                    El producto fue almacenado en la base de datos.
                </div>

            <% } else { %>

                <div>
                    <strong>⚠ No fue posible guardar el producto.</strong>
                </div>

            <% } %>

            <div class="dato">
                <strong>Nombre:</strong>
                ${nombre}
            </div>

            <div class="dato">
                <strong>Descripción:</strong>
                ${descripcion}
            </div>

            <div class="dato">
                <strong>Precio:</strong>
                $${precio}
            </div>

            <div class="dato">
                <strong>Stock:</strong>
                ${stock}
            </div>

            <a class="boton" href="producto-form.html">
                Registrar otro producto
            </a>

            <a class="boton" href="ProductoServlet">
                Ver productos
            </a>

        </div>

    </body>
</html>