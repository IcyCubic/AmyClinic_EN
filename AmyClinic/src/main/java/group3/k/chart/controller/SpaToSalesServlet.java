package group3.k.chart.controller;

import group3.k.chart.model.SpaToSalesService;
import group3.k.chart.model.SpaToSalesVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.map.HashedMap;
import org.json.simple.JSONValue;

import com.google.gson.Gson;

@WebServlet("/Backstage/SpaToSalesServlet")
public class SpaToSalesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SpaToSalesServlet() {  super(); }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	//@SuppressWarnings({ "rawtypes", "unchecked" })
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		System.out.println("doPost_OK");
		req.setCharacterEncoding("UTF-8");
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/json");
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action");
		//熱門療程類別
		SpaToSalesService	 spaToSalesService= new SpaToSalesService(); 
		//SpaToSalesVO spaToSalesVO= new SpaToSalesVO();
		//============顯現一開始Chart.jsp的畫面=========================
//List療程 全部
		
		if("hotPorc".equals(action)){
			System.out.println("hotPorc_OK");
			//-------療程名稱
			List<SpaToSalesVO> spaTable=spaToSalesService.getAll();//取得tab全部
			List spaToSales=new LinkedList();
			
			//HashMap procAllMap=new HashMap();//for( )裝入map轉
			for(SpaToSalesVO spa :  spaTable ){//將table拆解 用vo分裝
				HashedMap procAllMap = new HashedMap();//for( )裝入map轉
				procAllMap.put("year",spa.getYear());	
				procAllMap.put("month", spa.getMonth());
				procAllMap.put("name", spa.getName());
				//procAllMap.put("療程id", spa.getpType_id());
				procAllMap.put("counts", spa.getCounts());
				spaToSales.add(procAllMap);//療程名稱
				
System.out.println( spa.getYear()+"年"+spa.getMonth()+"月"+spa.getName()+"科"+spa.getCounts()+"次;");//test
			}
//			String jsonName = JSONValue.toJSONString(spaToSales);//變成jsonName
//			out.println(jsonName);				
//			System.out.println(jsonName);
			
			Gson gson = new Gson();
		   String str = gson.toJson(spaToSales);
			out.println(str);
			System.out.println(str);
	}
		}//doPost
}