package com.hu.ssm.dao;

import com.hu.ssm.bean.Employee;
import java.util.List;

public interface EmployeeMapper {
    int deleteByPrimaryKey(Integer empId);

    int insert(Employee record);

    Employee selectByPrimaryKey(Integer empId);

    List<Employee> selectAll();

    int updateByPrimaryKey(Employee record);
    
    /**
                * 所有并且带部门信息
     * @param example
     * @return
     */
    List<Employee> selectAllWithDept();
    /**
               * 根据id查询并且带部门信息
     * @param empId
     * @return
     */
    Employee selectByPrimaryKeyWithDept(Integer empId);

    int selectCountByName(String empName);
    void deleteBatchByPrimaryKeys(List<Integer> del_ids);
}