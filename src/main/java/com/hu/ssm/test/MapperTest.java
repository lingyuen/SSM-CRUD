package com.hu.ssm.test;



import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.hu.ssm.bean.Department;
import com.hu.ssm.bean.Employee;
import com.hu.ssm.dao.DepartmentMapper;
import com.hu.ssm.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    private DepartmentMapper departmentMapper;
    
    @Autowired
    private EmployeeMapper employeeMapper;
    
    @Test
    public void testDeptDao() {
      //1.新增部门
//      departmentMapper.insert(new Department(null,"开发部"));
//      departmentMapper.insert(new Department(null,"财务部"));
      
      //2.查询部门
      List<Department> list = departmentMapper.selectAll();
      for (Department department : list) {
        System.out.println(department);
      }
    }
    
    
    
    @Test
    public void testEmpDao() {
      //1.新增雇员
//      employeeMapper.insert(new Employee(null,"Tom","M","Tom@hu.com",1));
      
      //2.查询雇员
      
     List<Employee> list =  employeeMapper.selectAllWithDept();
     for (Employee employee : list) {
      System.out.println(employee);
     }
     
     
     Employee e =  employeeMapper.selectByPrimaryKeyWithDept(1);

      System.out.println(e);

    }
}
