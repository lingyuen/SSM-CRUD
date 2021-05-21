package com.hu.ssm.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hu.ssm.bean.Department;
import com.hu.ssm.dao.DepartmentMapper;

@Service
public class DepartmentService {
  
  @Autowired
  private DepartmentMapper departmentMapper;
  
  public List<Department> getDepts() {
    return departmentMapper.selectAll();
  }

}
