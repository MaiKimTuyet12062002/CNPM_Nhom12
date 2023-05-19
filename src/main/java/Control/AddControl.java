package Control;

import Entity.products;
import Service.ManageService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddControl", value = "/addControl")
public class AddControl extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int pid = Integer.parseInt(request.getParameter("id"));
        String pname = request.getParameter("name");
        String pimage = request.getParameter("image");
        String pprice = request.getParameter("price");
        String pdescription = request.getParameter("description");
        int pcategory = Integer.parseInt(request.getParameter("category"));


        products product = new products();
        product.setIdProduct(pid);
        product.setNameProduct(pname);
        product.setImage(pimage);
        product.setPrice(Integer.parseInt(pprice));
        product.setDescription(pdescription);
        product.setIdCat(pcategory);
        ManageService.addProduct(product);
        System.out.println(product);
        response.sendRedirect("/manageControl");
    }
}
