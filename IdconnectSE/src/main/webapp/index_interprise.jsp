<%-- 
    Document   : index_interprise
    Created on : 2025. 8. 1., 오전 11:19:27
    Author     : JairoHz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap demo</title>
        <link href="css/index_interprise.css" rel="stylesheet" type="text/css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    </head>
    <body>
        <style>

            .container {
                display: flex;
                flex-wrap: wrap;
                max-width: 1000px;
                margin: 50px auto;
                padding-top: 7%;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
            }
            .left, .right {
                flex: 1;
                min-width: 300px;
                padding: 15px;
                margin-bottom: 15px;
                margin-top: -9%;

                box-sizing: border-box;
            }
            .left {
                background-color: #007bff;
                color: white;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                border-radius: 12px 0px 0px 12px;

            }
            .left h1 {
                font-size: 24px;
                margin-bottom: 10px;
            }
            .left p {
                font-size: 18px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
                color: #333;
            }
            input {
                width: 100%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            button {
                width: 100%;
                padding: 12px;
                background-color: #007bff;
                border: none;
                color: white;
                font-weight: bold;
                border-radius: 5px;
                cursor: pointer;
            }
            button:hover {
                background-color: #0056b3;
            }
            .apps {
                margin-top: 20px;
                text-align: center;
            }
            .apps img {
                width: 120px;
                margin: 0 10px;
                vertical-align: middle;
            }
            @media (max-width: 768px) {
                .container {
                    flex-direction: column;
                    padding-top: 10%;
                }
            }

            body {
                margin: 0;
                font-family: 'Segoe UI', sans-serif;
                background-color: #f4f6f8;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
            }

            .login-box {
                background-color: white;
                width: 100%;
                max-width: 380px;
                padding: 30px;
                box-shadow: 0 0 10px rgba(0,0,0,0.1);
                border-radius: 0px 12px 12px 0px;
    margin-top: -9%;
    margin-bottom: 1.6%;
            }

            .login-box h2 {
                text-align: center;
                margin-bottom: 20px;
                color: #333;
            }

            .input-group {
                position: relative;
                margin-bottom: 20px;
            }

            .input-group input {
                width: 100%;
                padding: 12px 40px 12px 12px;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 14px;
            }

            .input-group i {
                position: absolute;
                right: 12px;
                top: 50%;
                transform: translateY(-50%);
                color: #aaa;
            }

            .login-btn {
                width: 100%;
                padding: 12px;
                background-color: #007bff;
                border: none;
                color: white;
                font-weight: bold;
                border-radius: 8px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .login-btn:hover {
                background-color: #0056b3;
            }

            .mobile-app {
                text-align: center;
                margin-top: 20px;
                font-size: 14px;
                color: #555;
            }

            .store-buttons img {
                width: 120px;
                margin: 10px 5px 0;
            }

            @media (max-width: 480px) {
                .login-box {
                    margin: 20px;
                }
            }


        </style>
        <div class="container">
            <div class="left">
                <h1>INICIO DE SESION</h1>
                <p>BCONNECT - EMPRESAS</p>
                <!-- Puedes incluir un <img> aquí para tu logotipo -->
            </div>
            <form class="login-box" method="post" action="administrator">

                <h2>Iniciar Sesión</h2>

                <div class="input-group">
                    <input type="text" class="form-control" id="usuario" name="usuario" placeholder="Usuario" required />
                    <i class="fas fa-user"></i>
                </div>

                <div class="input-group">
                    <input type="password" class="form-control" id="clave" name="clave" placeholder="Contraseña" required />
                    <i class="fas fa-lock"></i>
                </div>

                <button class="login-btn" type="submit" name="a" value="verify">INGRESAR</button>

                <div style="display: none;" class="mobile-app">
                    También disponible en aplicación móvil
                    <div class="store-buttons">
                        <img src="appstore.png" alt="App Store" />
                        <img src="playstore.png" alt="Play Store" />
                    </div>
                </div>
       

    </form>

 </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>
</html>
