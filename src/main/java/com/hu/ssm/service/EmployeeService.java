package com.hu.ssm.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.hu.ssm.bean.Employee;
import com.hu.ssm.dao.EmployeeMapper;

@Service
public class EmployeeService {
  @Autowired
  private EmployeeMapper employeeMapper;
  
  public List<Employee> list() {
    return employeeMapper.selectAllWithDept();
  }

  public void saveEmp(Employee employee) {
    employeeMapper.insert(employee);
  }

  public boolean checkUser(String empName) {
    
    return employeeMapper.selectCountByName(empName)==0;
  }

  public Employee getEmp(Integer id) {
    return employeeMapper.selectByPrimaryKey(id);
  }

  public boolean updateEmp(Employee employee) {
    return employeeMapper.updateByPrimaryKey(employee) > 0;
  }

  public boolean deleteEmp(Integer id) {
    return employeeMapper.deleteByPrimaryKey(id)>0;
  }

  public void deleteBatch(List<Integer> del_ids) {
    employeeMapper.deleteBatchByPrimaryKeys(del_ids);
  }





}
