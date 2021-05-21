package com.hu.ssm.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.hu.ssm.bean.CommonResult;
import com.hu.ssm.bean.Department;
import com.hu.ssm.service.DepartmentService;

@Controller
public class DepartmentController {
  
  @Autowired
  private DepartmentService departmentService;
  
  @RequestMapping("/depts")
  @ResponseBody
  public CommonResult getDepts() {
    List<Department> list = departmentService.getDepts();
    return CommonResult.success().add("depts", list);
  }
}
