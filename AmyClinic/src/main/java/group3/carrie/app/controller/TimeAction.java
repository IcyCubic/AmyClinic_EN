package group3.carrie.app.controller;

import group3.beef.employee.model.EmployeeService;
import group3.beef.employee.model.EmployeeVO;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import jxl.Sheet;
import jxl.Workbook;

/**
 * 查詢門診時間表
 */
public class TimeAction extends ActionSupport {

	public String execute() {
		HttpServletRequest request = ServletActionContext.getRequest();
		List<EmployeeVO> excel = new ArrayList<EmployeeVO>();
		File f1 = new File(TimeServlet.class.getResource(
				"/resource/carrie/time.xls").getFile());

		try {
			// 創建Workbook
			Workbook workbook = Workbook.getWorkbook(f1);
			// 選擇第一個工作表
			Sheet sheet1 = workbook.getSheet(0);
			// 取得列數
			int rows = sheet1.getRows();
			// 取得欄數
			int cols = sheet1.getColumns();

			EmployeeVO empVO = null;
			for (int i = 1; i < rows; i++) {
				for (int j = 1; j < cols; j++) {

					String ename = sheet1.getCell(j, i).getContents();
					EmployeeService empServ = new EmployeeService();
					empVO = empServ.getOneEmployee(ename);
					excel.add(empVO);
				}

			}

			request.setAttribute("list", excel);
			return SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		}
	}

}
