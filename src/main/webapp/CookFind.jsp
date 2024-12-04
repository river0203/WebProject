<%@ page import="java.io.*, org.json.simple.*, org.json.simple.parser.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>흑백 요리사</title>
    <style>
        /* 기본 레이아웃 */
        .banner {
            background-color: #ccc;
            text-align: center;
            padding: 20px 0;
            font-size: 5em;
            font-weight: bold;
            border-bottom: 5px solid #333;
        }

        .buttons {
            display: flex;
            border-top: 5px solid #333;
            border-bottom: 5px solid #333;
        }

        .button {
            flex: 1;
            padding: 20px;
            text-align: center;
            font-size: 1.5em;
            cursor: pointer;
            transition: background-color 0.3s;
            border-right: 5px solid #333;
        }

        .button:last-child {
            border-right: none;
        }

        .button.light {
            background-color: #fff;
        }

        .button.dark {
            background-color: #666;
            color: #fff;
        }

        /* 셰프 정보 컨테이너 */
        .chef-container {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin: 30px auto;
            width: 80%;
            font-family: Arial, sans-serif;
        }

        .chef-photo img {
            width: 500px;
            height: auto;
            border-radius: 10px;
        }

        .chef-info {
            flex: 1;
            margin-left: 20px;
            text-align: left;
        }

        .chef-info p {
            font-size: 1.2em;
            margin: 5px 0;
        }

        .chef-info a {
            color: #007BFF;
            text-decoration: none;
        }

        .chef-info a:hover {
            text-decoration: underline;
        }

        /* 시그니처 이미지 슬라이더 */
        .signature-photos {
            display: flex;
            align-items: center;
            width: 600px; /* 적당한 크기로 조정 */
            margin-left: 20px;
        }

        .signature-photos img {
            width: 500px; /* 이미지 크기 키움 */
            height: auto;
            border-radius: 15px;
            display: none;
        }

        .signature-photos img.active {
            display: block;
        }

        .prev, .next {
            font-size: 2em;
            cursor: pointer;
            padding: 0 10px;
            user-select: none;
        }
    </style>
    <script>
        function showChefContent(color) {
            document.getElementById("whiteChefs").style.display = color === 'white' ? "block" : "none";
            document.getElementById("blackChefs").style.display = color === 'black' ? "block" : "none";
        }

        function initializeSliders() {
            document.querySelectorAll(".signature-photos").forEach(function (container) {
                const images = container.querySelectorAll("img");
                let currentIndex = 0;

                // 초기 이미지 설정
                images[currentIndex].classList.add("active");

                // 좌우 버튼 클릭 이벤트
                container.querySelector(".prev").addEventListener("click", function () {
                    images[currentIndex].classList.remove("active");
                    currentIndex = (currentIndex - 1 + images.length) % images.length;
                    images[currentIndex].classList.add("active");
                });

                container.querySelector(".next").addEventListener("click", function () {
                    images[currentIndex].classList.remove("active");
                    currentIndex = (currentIndex + 1) % images.length;
                    images[currentIndex].classList.add("active");
                });
            });
        }

        window.onload = function () {
            showChefContent('black');
            initializeSliders();
        };
    </script>
</head>
<body>
    <div class="banner">흑백 요리사</div>
    <div class="buttons">
        <div class="button dark" onclick="showChefContent('black')">흑</div>
        <div class="button light" onclick="showChefContent('white')">백</div>
    </div>

    <!-- JSP 코드 -->
    <%
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = null;

        try {
            String filePath = application.getRealPath("/WEB-INF/chefs.json");
            Object obj = parser.parse(new FileReader(filePath));
            jsonObject = (JSONObject) obj;

            JSONArray blackChefs = (JSONArray) jsonObject.get("blackChefs");
            JSONArray whiteChefs = (JSONArray) jsonObject.get("whiteChefs");
    %>

    <!-- 흑 요리사 정보 -->
    <div id="blackChefs" style="display:none;">
        <% for (Object chefObj : blackChefs) {
            JSONObject chef = (JSONObject) chefObj;
            JSONArray photos = (JSONArray) chef.get("signaturePhotos");
        %>
        <div class="chef-container">
            <div class="chef-photo">
                <img src="<%= chef.get("photo") %>" alt="Chef Photo">
            </div>
            <div class="chef-info">
                <p>Chef: <%= chef.get("name") %></p>
                <p>Restaurant: <%= chef.get("restaurant") %></p>
                <p>위치: <%= chef.get("location") %></p>
                <p>지도: <a href="<%= chef.get("mapLink") %>" target="_blank">지도 보기</a></p>
                <p>시그니처 메뉴: <%= chef.get("mainMenu") %></p>
            </div>
            <div class="signature-photos">
                <div class="prev">◀</div>
                <% for (Object photoObj : photos) { %>
                    <img src="<%= photoObj %>" alt="Signature Photo">
                <% } %>
                <div class="next">▶</div>
            </div>
        </div>
        <% } %>
    </div>

    <!-- 백 요리사 정보 -->
    <div id="whiteChefs" style="display:none;">
        <% for (Object chefObj : whiteChefs) {
            JSONObject chef = (JSONObject) chefObj;
            JSONArray photos = (JSONArray) chef.get("signaturePhotos");
        %>
        <div class="chef-container">
            <div class="chef-photo">
                <img src="<%= chef.get("photo") %>" alt="Chef Photo">
            </div>
            <div class="chef-info">
                <p>Chef: <%= chef.get("name") %></p>
                <p>Restaurant: <%= chef.get("restaurant") %></p>
                <p>위치: <%= chef.get("location") %></p>
                <p>지도: <a href="<%= chef.get("mapLink") %>" target="_blank">지도 보기</a></p>
                <p>시그니처 메뉴: <%= chef.get("mainMenu") %></p>
            </div>
            <div class="signature-photos">
                <div class="prev">◀</div>
                <% for (Object photoObj : photos) { %>
                    <img src="<%= photoObj %>" alt="Signature Photo">
                <% } %>
                <div class="next">▶</div>
            </div>
        </div>
        <% } %>
    </div>
    <%
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
    <jsp:include page="footer.jsp" />
</body>
</html>
