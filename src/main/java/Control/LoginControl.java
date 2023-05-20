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
import Service.UserService;

import java.sql.SQLException;

@WebServlet(name = "LoginControl", value = { "/login" })


public class LoginControl extends HttpServlet {


    protected void doGet(HttpServletRequest httpservletrequest, HttpServletResponse httpservletresponse)
            throws ServletException, IOException
    {
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        try
        {
            UserService service = new UserService();
            Account account = service.findAccount(username, password);
            if(account == null)
            {
                request.setAttribute("mess", "Sai thông tin!");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            } else if(account.getRole()==2){
                HttpSession session = request.getSession();
                session.setAttribute("admin", account);
                response.sendRedirect("AdminIndex");
            }
            else
            {
                if(account.getEnable()==1) {
                    request.setAttribute("mess", "Đăng nhập thành công");
                    HttpSession session = request.getSession();
                    session.setAttribute("account", account);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                else{
                    request.setAttribute("mess", "Tài khoản đã bị khóa, vui lòng liên hệ admin để được giải quyết");
                    request.getRequestDispatcher("Login.jsp").forward(request, response);
                }
            }
        }
        catch(SQLException | ClassNotFoundException e)
        {
            throw new RuntimeException(e);
        }
    }
}