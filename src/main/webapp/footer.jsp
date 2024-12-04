<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="footer">
    <button onclick="redirectToReservationPage()">예약하기</button>
</div>
<style>
    .footer {
        background-color: #333;
        color: #fff;
        text-align: center;
        padding: 20px 0;
        position: fixed;
        bottom: 0;
        left: 0; /* 왼쪽 끝으로 고정 */
        width: 100%;
        border-top: 5px solid #666;
        z-index: 100;
    }

    .footer button {
        padding: 10px 20px;
        font-size: 1.2em;
        background-color: #007BFF;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .footer button:hover {
        background-color: #0056b3;
    }
</style>
<script>
    function redirectToReservationPage() {
        window.location.href = "bookPage.jsp"; // 예약 페이지로 이동
    }
</script>
