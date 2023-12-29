<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Reset some default styles for the body and header */
    

        /* Apply styles to the header */
       header {
        position: sticky;
        top: 0;
        width: 100%;
        background-color: #fff;
        z-index: 1000; /* 높은 층위로 설정 */
    }

        .top {
            display: flex;
            justify-content: space-around; /* Change this line to space-around */
            align-items: center;
            padding: 10px 20px; /* Add padding to create some space around the content */
        }

        .top_menu {
            margin-right: 10px; /* Add some space between menu items */
        }

        .logo {
            width: 210px;
            height: 100px;
        }

        hr {
            margin: 0;
        }

        /* Add some styles to your navigation links if needed */
        .top_menu a {
            text-decoration: none;
            color: #333; /* Set your desired text color */
            font-weight: bold;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <header>
        <div class="top">
   <!--          <span class="top_menu"><a href="list.bk">책방</a></span> -->
            <a href="SiscMain.view"><img class="logo" src="<%=request.getContextPath()%>/resources/images/logo1.jpg"></a>
    <!--         <span class="top_menu"><a href="login.mb">로그인</a></span> -->
        </div>
        <hr>
    </header>
    <!-- Your content goes here -->
</body>
</html>
