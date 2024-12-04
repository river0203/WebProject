<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약하기</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        label {
            font-size: 1.2em;
            color: #333;
        }

        input, select, button {
            padding: 10px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button {
            background-color: #007BFF;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>예약하기</h1>
        <form action="submitReservation" method="post">
            <div>
                <label for="name">이름:</label>
                <input type="text" id="name" name="name" placeholder="이름을 입력하세요" required>
            </div>
            <div>
                <label for="date">날짜:</label>
                <input type="date" id="date" name="date" required>
            </div>
            <div>
                <label for="chef">셰프:</label>
                <select id="chef" name="chef" required>
                    <option value="최현석">최현석</option>
                    <option value="최현석">여경래</option>
                    <option value="최현석">정지선</option>
                    <option value="최현석">오세득</option>
                    <option value="최현석">김도윤</option>
                    <option value="최현석">조셉 리저우드</option>
                    <option value="최현석">파브리치오 페라리</option>
                    <option value="최현석">황진선</option>
                    <option value="최현석">최강록</option>
                    <option value="최현석">이영숙</option>
                    <option value="최현석">조은주</option>
                    <option value="최현석">남정석</option>
                    <option value="최현석">안유셩</option>
                    <option value="최현석">장호준</option>
                    <option value="최현석">에드워드 리</option>
                    <option value="최현석">최현석</option>
                    <option value="히든천재">히든천재</option>
                    <option value="최현석">반찬 셰프</option>
                    <option value="최현석">영탉</option>
                    <option value="최현석">간귀</option>
                    <option value="최현석">원투쓰리</option>
                    <option value="최현석">이모카세 1호</option>
                    <option value="최현석">철가방 요리사</option>
                    <option value="최현석">만찢남</option>
                    <option value="최현석">고기깡패</option>
                    <option value="최현석">셀럽의 셰프</option>
                    <option value="최현석">야키토리왕</option>
                    <option value="최현석">나폴리 맛피아</option>
                    <option value="최현석">요리하는 돌아이</option>
                    <option value="최현석">키친 갱스터</option>
                </select>
            </div>
            <button type="submit">제출</button>
        </form>
    </div>
</body>
</html>
