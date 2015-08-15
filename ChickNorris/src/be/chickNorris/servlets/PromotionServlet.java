package be.chickNorris.servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Davy on 8/15/2015.
 */

/**
 * Servlet implementation class PromotionServlet
 */

@WebServlet("/Promotion.htm")
public class PromotionServlet extends HttpServlet {

        private static final long serialVersionUID = 1L;
        private static final String VIEW = "WEB-INF/JSP/promotion.jsp";

        /**
         * @see HttpServlet#HttpServlet()
         */
        public PromotionServlet() {
            super();
            // TODO Auto-generated constructor stub
        }

        /**
         * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
         */
        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            RequestDispatcher dispatcher = request.getRequestDispatcher(VIEW);
            dispatcher.forward(request, response);
        }

        /**
         * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
         */
        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            // TODO Auto-generated method stub
        }
}
