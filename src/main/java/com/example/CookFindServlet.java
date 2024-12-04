
package com.example;

import java.io.FileReader;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class CookFindServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // JSON 파일 경로 지정
            String filePath = getServletContext().getRealPath("/db/chefs.json");

            // JSON 파일 읽기 및 파싱
            JSONParser parser = new JSONParser();
            JSONObject chefsData = (JSONObject) parser.parse(new FileReader(filePath));

            // 데이터 JSP에 전달
            request.setAttribute("chefsData", chefsData);

            // JSP로 포워딩
            RequestDispatcher dispatcher = request.getRequestDispatcher("/CookFind.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("JSON 데이터를 처리하는 중 오류 발생", e);
        }
    }
}
