import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class submitReservation
 */
@WebServlet("/submitReservation")
public class submitReservation extends HttpServlet {
    private static final long serialVersionUID = 1L;
   
   
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public submitReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 및 응답 인코딩 설정
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 요청 및 응답 인코딩 설정 (UTF-8)
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");        

        // 요청 데이터 가져오기
        String name = request.getParameter("name");
        String date = request.getParameter("date");
        String chef = request.getParameter("chef");

        // 쿠키 생성 및 추가 
        Cookie nameCookie = new Cookie("name", name);
        Cookie dateCookie = new Cookie("date", date);
        Cookie chefCookie = new Cookie("chef", chef);

        // 쿠키 설정 (예: 24시간 유지)
        nameCookie.setMaxAge(60 * 60); // 24시간
        dateCookie.setMaxAge(60 * 60); // 24시간
        chefCookie.setMaxAge(60 * 60); // 24시간

        // 쿠키를 응답에 추가
        response.addCookie(nameCookie);
        response.addCookie(dateCookie);
        response.addCookie(chefCookie);
        
        // 응답 출력
        response.getWriter().println("<!DOCTYPE html>");
        response.getWriter().println("<html lang='ko'>");
        response.getWriter().println("<head>");
        response.getWriter().println("<meta charset='UTF-8'>");
        response.getWriter().println("<title>예약 완료</title>");
        response.getWriter().println("</head>");
        response.getWriter().println("<body>");
        response.getWriter().println("<h1>예약이 완료되었습니다!</h1>");
        response.getWriter().println("<p>이름: " + name + "</p>");
        response.getWriter().println("<p>날짜: " + date + "</p>");
        response.getWriter().println("<p>셰프: " + chef + "</p>");
        response.getWriter().println("</body>");
        response.getWriter().println("</html>");
    }
}
