package group3.carrie.schedule.model;

import java.sql.Date;
import java.util.List;

public interface ScheduleDAO_interface {
	public void insert(ScheduleVO scheduleVO);
	public void update(ScheduleVO scheduleVO);
	public void delete(Integer sch_id);
	public ScheduleVO findByPrimaryKey(Integer sch_id);
	public List<ScheduleVO> findByDateAndHour(Date date,String c_hours);
	public List<ScheduleVO> findByDate(Date date);
	public List<ScheduleVO> getAll();
	public List<ScheduleVO> getByDayAndHour(Integer day,String c_hours);


}
