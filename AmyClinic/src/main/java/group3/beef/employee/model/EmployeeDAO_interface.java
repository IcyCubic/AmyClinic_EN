package group3.beef.employee.model;

 
import java.io.InputStream;
import java.util.List;

public interface EmployeeDAO_interface {
	public void insert(EmployeeVO employeeVO);
    public void update(EmployeeVO employeeVO);
    public void delete(Integer eid);
    public EmployeeVO findByPrimaryKey(Integer eid);
    public EmployeeVO findByMail(String mail);
    public EmployeeVO findByName(String name);
    public InputStream findEmpPicByPrimaryKey(Integer eid);
    public List<EmployeeVO> getAll();
}
