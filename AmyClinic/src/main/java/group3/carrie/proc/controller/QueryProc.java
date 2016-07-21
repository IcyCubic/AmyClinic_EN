package group3.carrie.proc.controller;

import group3.carrie.proc.model.ProcService;
import group3.carrie.proc.model.ProcVO;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 轉交到療程介紹靜態網頁
 */
@WebServlet("/QueryProc")
public class QueryProc extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		Integer proc_id = Integer.parseInt(id);
		ProcService procServ = new ProcService();
		ProcVO proc = procServ.getOneProc(proc_id);
		request.setAttribute("proc", proc);
		RequestDispatcher rd = request.getRequestDispatcher("/other/services/proc"+proc_id+".jsp");
		rd.forward(request, response);
		return;
	}

}
