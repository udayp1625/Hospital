<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #e6f1fd;
        }
        .box {
            border: 2px solid white;
            padding: 20px;
            max-width: 350px;
            width: 90%;
            margin: 10% auto;
            background-color: white;
            border-radius: 30px;
            text-align: center;
        }
        img {
            margin-top: 10px;
            height: 6em;
        }
        h2 {
            font-family: 'Roboto', sans-serif;
            font-weight: 600;
            font-size: 24px;
            color: rgb(24, 23, 23);
        }
        input {
            padding: 10px;
            border-radius: 15px;
            margin: 10px 0;
            width: 80%;
            border: 1px dotted #aaa;
        }
        button {
            padding: 10px;
            width: 100px;
            border-radius: 20px;
            border: 0.5px solid black;
            background-color: #36b6ff;
            color: white;
            font-weight: bold;
        }
        footer {
            color: rgb(66, 64, 64);
            margin-top: 20px;
            font-size: 14px;
        }
        @media only screen and (max-width: 500px) {
            .box {
                margin: 20% auto;
                padding: 15px;
            }
            img {
                height: 3em;
            }
            h2 {
                font-size: 20px;
            }
            button {
                width: 80%;
            }
        }
    </style>
</head>
<body>
    <form action="loginservlet.jsp" autocomplete="off">
        <div class="box">
            <img src="logo.png" alt="Logo">
            <h2>Login</h2>
            <input type="text" name="username" placeholder="Username" required>
            <br>
            <input type="password" name="password" placeholder="Password" required>
            <br><br>
            <button type="submit" class="btn btn-primary">Login</button>
            <footer>© 2025 PharmaCare</footer>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
