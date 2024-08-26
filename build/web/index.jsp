<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Jumble Word Solver</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            background-color: rgb(9, 25, 27);
            background-attachment: fixed;
            text-align: center;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        label {
            font-size: x-large;
        }
        input {
            background-color: rgb(0, 21, 20);
            font-size: x-large;
            text-align: center;
            height: 40px;
            line-height: 50px;
            border-radius: 15px 10px 50px 10px;
            color: white;
            border-style: solid;
            margin-top: 12px;
        }
        #noteSingleWord {
            padding-right: 200px;
            color: aliceblue;
        }
        #search_button {
            border-radius: 20px;
            background-color: rgb(106, 181, 76);
            padding-left: 20px;
            padding-right: 20px;
            margin-left: 10px;
            height: 40px;
            border-color: black;
            border-style: solid;
        }
        h1 {
            color: rgb(233, 210, 244);
            background: linear-gradient(to right, #f32170, #ff6b08, #cf23cf, #eedd44);
            -webkit-text-fill-color: transparent;
            -webkit-background-clip: text;
            padding-right: 20px;
        }
    </style>
</head>
<body>
    <img src="jumbleimage.jpg" width="600" height="150" style="border-radius: 25px; border: 2px solid #FFFF00;" alt="jumble image">
    <div style="text-align: center;">
        <h1>Jumble Word Solver</h1>
    </div>
    <form method="post" action="jumble.jsp">
        <label>
            <input type="text" name="jumble-word-input" placeholder="Type Jumble Word Here">
        </label>
        <button id="search_button" type="submit">Search</button>
    </form>
    <div style="text-align: center;">
        <p id="noteSingleWord">Note: Enter only <span style="color: red">ONE</span> word!</p>
    </div>
</body>
</html>
