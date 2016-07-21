package group3.beef.employee.model.filter;

import group3.beef.employee.model.EmployeeVO;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter({"/Backstage/*","/appBack/*","/schedule/*","/emp/*"})
public class EmpLoginFilter implements Filter {
	private FilterConfig config;

	public void destroy() {
		config = null;
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		EmployeeVO empVO = (EmployeeVO) session.getAttribute("empVO");
		if (empVO == null) {
			session.setAttribute("location", req.getRequestURI());
			res.sendRedirect(req.getContextPath() + "/empLogin/login.jsp");
			return;
		} else {
			chain.doFilter(req, res);
		}
	}

	public void init(FilterConfig Config) throws ServletException {
		this.config = Config;
	}

}
