package group3.carrie.proc.model;

import java.util.List;

public interface ProcDAO_interface {
    public void insert(ProcVO procVO);
    public void update(ProcVO procVO);
    public void delete(Integer procedure_id);
    public ProcVO findByPrimaryKey(Integer procedure_id);
    public List<ProcVO> getAll();
    //k-----查療程類別所有療程
    public List<ProcVO> findByPType_id(Integer pType_id);
    //k
}
