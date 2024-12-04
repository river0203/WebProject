import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewReservation
 */
@WebServlet("/viewReservation")
public class ViewReservation extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewReservation() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 응답 인코딩 설정
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");

        // 쿠키에서 정보 가져오기
        Cookie[] cookies = request.getCookies();
        String name = null;
        String date = null;
        String chef = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                switch (cookie.getName()) {
                    case "name":
                        name = cookie.getValue();
                        break;
                    case "date":
                        date = cookie.getValue();
                        break;
                    case "chef":
                        chef = cookie.getValue();
                        break;
                }
            }
        }

        // 새로운 웹페이지 생성
        response.getWriter().println("<!DOCTYPE html>");
        response.getWriter().println("<html lang='ko'>");
        response.getWriter().println("<head>");
        response.getWriter().println("<meta charset='UTF-8'>");
        response.getWriter().println("<title>예약 조회</title>");
        response.getWriter().println("</head>");
        response.getWriter().println("<body>");
        response.getWriter().println("<h1>예약 정보</h1>");
        
        if (name != null && date != null && chef != null) {
            response.getWriter().println("<p>이름: " + name + "</p>");
            response.getWriter().println("<p>날짜: " + date + "</p>");
            response.getWriter().println("<p>셰프: " + chef + "</p>");
        } else {
            response.getWriter().println("<p>예약 정보를 찾을 수 없습니다.</p>");
        }

        response.getWriter().println("</body>");
        response.getWriter().println("</html>");
    }
}
