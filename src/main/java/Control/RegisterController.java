package Control;

import java.sql.SQLException;
import javax.servlet.ServletResponse;
import javax.servlet.ServletRequest;
import Dao.AccountDao;
import Entity.Account;
import Service.UserService;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet(name = "RegisterController", value = { "/Register" })
public class RegisterController extends HttpServlet
{
    protected void doGet(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Register.jsp").forward(request, response);
    }

    protected void doPost(final HttpServletRequest request, final HttpServletResponse response) throws ServletException, IOException {
        // Lấy các thông tin người dùng nhập từ form
        final String firstname = request.getParameter("firstname");
        final String lastname = request.getParameter("lastname");
        final String email = request.getParameter("email");
        final String phone = request.getParameter("telephone");
        final String password = request.getParameter("password");
        final String verifyPassword = request.getParameter("confirm");
        final int newsletter = 0;
        final int sex = Integer.parseInt(request.getParameter("male"));
        System.out.println(password+"-"+verifyPassword);
        final String fullname =  firstname+" "+ lastname;
        // Kiểm tra mật khẩu có trùng khớp với nhập lại mật khẩu hay không
        if(!password.equals(verifyPassword)){
            // Nếu không trùng khớp sẽ yêu cầu nhập lại
            request.setAttribute("mess", "Mật khẩu không trùng khớp! Vui lòng nhập lại");
            request.getRequestDispatcher("Register.jsp").forward(request, response);
            return;
        }
        try {
            // Lấy account từ email người dùng nhập vào
            final UserService service = new UserService();
            final Account account = service.findAccount(email);
            // Nếu account == null tức chưa có account trong database. Sẽ thêm account vào cơ sở dữ liệu
            if (account == null) {
                // Tạo 1 account từ thông tin của người dùng
                final Account acountNew = new Account(email, password, fullname, phone, sex, newsletter);
                //Thêm account vào database
                AccountDao.addAccount(acountNew);
                System.out.println(acountNew.toString());
                //Thêm account thành công sẽ thông báo đăng ký thành công và chuyển sang trang đăng nhập
                //Khi qua trang sẽ hiện 1 alert thông báo trạng thái(sử dụng get attribute "mess" để lấy nội dung trạng thái và hiện nó ra nếu khách null)
                request.setAttribute("mess", "Đăng ký tài khoản thành công");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
            // Nếu account != nuaill nghĩa là đã tồn tại, sẽ thông báo người dùng tài khoản tồn tại
            else {
                request.setAttribute("mess", "Tài khoản đã tồn tại!");
                request.getRequestDispatcher("Register.jsp").forward((ServletRequest)request, (ServletResponse)response);
            }
        }
        catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}