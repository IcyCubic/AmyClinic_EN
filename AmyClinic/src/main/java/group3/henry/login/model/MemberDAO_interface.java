package group3.henry.login.model;

import java.util.*;

public interface MemberDAO_interface {
          public void insert(MemberVO memberVO);
          public void update(MemberVO memberVO);
          public void delete(Integer mid);
          public MemberVO findByPrimaryKey(Integer mid);
          //k
          public List<MemberVO> findName(String name);
          //k
          public List<MemberVO> getAll();
		
}
