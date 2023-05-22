package Control;

import Dao.LoginDao;
import Entity.Account;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialException;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import Entity.Account;
import Entity.category;
import Entity.products;
import Service.ManageService;
import Service.UserService;

import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "LoginControl", value = { "/login" })


public class LoginControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        request.setAttribute("mess", "");
        try
        {
            UserService service = new UserService();
            Account account = service.findAccount(username, password);
            if(account == null)
            {
                request.setAttribute("mess", "Sai tên đăng nhập hoặc mật khẩu!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            } else if(account.getRole()==2){
                HttpSession session = request.getSession();
                session.setAttribute("admin", account);
                response.sendRedirect("Manager.jsp");
            }
            else
            {
                if(account.getEnable()==1) {
                    request.setAttribute("mess", "Đăng nhập thành công");
                    HttpSession session = request.getSession();
                    session.setAttribute("account", account);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            }
        }
        catch(SQLException | ClassNotFoundException e)
        {
            throw new RuntimeException(e);
        }
    }

}