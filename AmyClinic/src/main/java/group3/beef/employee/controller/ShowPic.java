package group3.beef.employee.controller;

import group3.beef.employee.model.EmployeeService;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ShowEmpPic.servlet")
public class ShowPic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShowPic() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		res.setContentType("image/*");
		EmployeeService eSvc = new EmployeeService();
		String num = req.getParameter("num");
		int eid = Integer.parseInt(num);
		InputStream is = eSvc.getOneEmployeePic(eid);
		OutputStream os = res.getOutputStream();
		if (is != null) {
			byte[] data = new byte[8192];
			int len = 0;
			while ((len = is.read(data)) != -1) {
				os.write(data, 0, len);
			}

		}

	}

}
