package group3.k.chart.controller;

import group3.k.SalesToProd.model.SalesToProdService;
import group3.k.SalesToProd.model.SalesToProdVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@WebServlet("/Backstage/HotProdServlet")
public class HotProdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public HotProdServlet() { super(); }
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doPost_OK");
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/json");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action");	
		// 找出hotTop5產品
		SalesToProdService  salesToProdService=new SalesToProdService();
		//============顯現一開始Chart.jsp的畫面=========================
//List產品 全部
		if("HotProd".equals(action)){
			System.out.println("HotProd_ok");
			
			List<SalesToProdVO> ProdVO=salesToProdService.getAll();
			List ProdList=new LinkedList();
			int i =0;
			for(SalesToProdVO prod :ProdVO){
				if( i <=4){
				i++;
				Map prodAllMap=new HashMap();
				prodAllMap.put("id",prod.getId());
				prodAllMap.put("name",prod.getName());
				prodAllMap.put("q",prod.getQuantity());
				prodAllMap.put("year",prod.getYears());
				prodAllMap.put("pid",prod.getPid());
				ProdList.add(prodAllMap);
System.out.println( prod.getId()+"名次"+prod.getPid()+"ID"+prod.getName()+"名稱"+prod.getQuantity()+"賣出"+prod.getYears()+"年份;");//test				
			}else break;
			}
			Gson gson = new Gson();
			   String str = gson.toJson(ProdList);
				out.println(str);
				System.out.println(str);
		}
	}//doPost
}