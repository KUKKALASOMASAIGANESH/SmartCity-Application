<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Urban Compass Cities</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1" />
    <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Roboto:wght@400;700&display=swap" rel="stylesheet" />
    <style>
        :root {
            --primary-color: #4CAF50;
            --secondary-color: #ffffff;
            --overlay-bg: rgba(0, 0, 0, 0.4);
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(to right, #ece9e6, #ffffff);
            color: #333;
        }

        .header {
            text-align: center;
            font-size: 28px;
            margin: 20px;
            font-weight: 700;
        }

        .back-button {
            text-align: center;
            margin: 20px 0;
        }

        .back-button a {
            text-decoration: none;
            background-color: var(--primary-color);
            color: var(--secondary-color);
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s;
            font-weight: 500;
        }

        .back-button a:hover {
            background-color: #388e3c;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
            padding: 20px;
        }

        .card {
            position: relative;
            width: 300px;
            height: 450px;
            overflow: hidden;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            text-decoration: none;
            transition: transform 0.3s, box-shadow 0.3s;
            background: #fff;
        }

        .card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.3);
        }

        .wrapper {
            position: absolute;
            width: 100%;
            height: 100%;
        }

        .cover-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
            transition: transform 0.5s;
        }

        .card:hover .cover-image {
            transform: scale(1.1);
        }

        .character {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            opacity: 0;
            transition: opacity 0.4s;
            z-index: 2;
        }

        .card:hover .character {
            opacity: 1;
        }

        .overlay-text {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            padding: 20px;
            background: var(--overlay-bg);
            color: var(--secondary-color);
            font-size: 22px;
            font-family: "Pacifico", cursive;
            text-align: center;
            z-index: 3;
        }

        @media (max-width: 768px) {
            .card {
                width: 90%;
                height: 400px;
            }

            .overlay-text {
                font-size: 18px;
            }
        }
    </style>
</head>

<body>
    <div class="back-button">
        <a href="home.jsp">Return Back</a>
    </div>
<%@ include file="navbar.jsp" %>
    <div class="header">
        𝙳𝚒𝚜𝚌𝚘𝚟𝚎𝚛 𝚢𝚘𝚞𝚛 𝚙𝚛𝚎𝚏𝚎𝚛𝚛𝚎𝚍 𝚌𝚒𝚝𝚢 𝚋𝚢 𝚜𝚎𝚕𝚎𝚌𝚝𝚒𝚗𝚐 𝚏𝚛𝚘𝚖 𝚝𝚑𝚎 𝚌𝚑𝚘𝚒𝚌𝚎𝚜 𝚋𝚎𝚕𝚘𝚠.
    </div>

    <div class="card-container">
        <c:forEach items="${clist}" var="c">
            <a href="home?city=${c.city}" class="card">
                <div class="wrapper">
                    <img src="displaycityimage1?id=${c.id}" class="cover-image" alt="${c.city}" />
                    <div class="overlay-text"><c:out value="${c.city}" /></div>
                    <img src="displaycityimage2?id=${c.id}" class="character" alt="${c.city}" />
                </div>
            </a>
        </c:forEach>
    </div>
</body>

</html>
