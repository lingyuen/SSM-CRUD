package com.hu.ssm.controller;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hu.ssm.bean.CommonResult;
import com.hu.ssm.bean.Employee;
import com.hu.ssm.service.EmployeeService;

@Controller
public class EmployeeController {
  
  @Autowired
  private EmployeeService employeeService;
  
  
  @RequestMapping(value="/checkuser",method=RequestMethod.GET)
  @ResponseBody
  public CommonResult checkUser(String empName) {
    System.out.println("********************check user **********");
    
    String regex = "^[a-zA-Z0-9_-]{6,16}$";
    if(!empName.matches(regex)) {
      return CommonResult.fail().add("vaMsg", "用户名格式不正确");
    };

    boolean b = employeeService.checkUser(empName);
    if(b) {
      return CommonResult.success().add("vaMsg", "用户名可用");
    } else {
      return CommonResult.fail().add("vaMsg", "用户名不可用");
    }
    
  }  
  
  @RequestMapping(value="/emp",method=RequestMethod.PUT)
  @ResponseBody
  public CommonResult editEmp(Employee employee) {
    System.out.println("********************edit emp **********"+employee);
    boolean flag = employeeService.updateEmp(employee);
    if(flag) {
      return CommonResult.success(); 
    } else {
      return CommonResult.fail();
    }
  }  
  
  @ResponseBody
  @RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
  public CommonResult deleteEmp(@PathVariable("ids")String ids){
    System.out.println("*********delete emp**********"+ids);
      //批量删除
      if(ids.contains("-")){
          List<Integer> del_ids = new ArrayList<>();
          String[] str_ids = ids.split("-");
          
          //组装id的集合
          for (String string : str_ids) {
              del_ids.add(Integer.parseInt(string));
          }
          employeeService.deleteBatch(del_ids);
      }else{
          Integer id = Integer.parseInt(ids);
          employeeService.deleteEmp(id);
      }
      return CommonResult.success();
  }
  
  @RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
  @ResponseBody
  public CommonResult getEmp(@PathVariable("id") Integer id) {
    System.out.println("********************get emp **********");
    Employee emp =employeeService.getEmp(id);
    return CommonResult.success().add("emp", emp);
  }  
  
  @RequestMapping(value="/emp",method=RequestMethod.POST)
  @ResponseBody
  public CommonResult addEmp(Employee employee) {
    System.out.println("********************add emp **********"+employee);
    employeeService.saveEmp(employee);
    return CommonResult.success();
  }  
  
  @RequestMapping("/emps")
  @ResponseBody
  public CommonResult getEmpsWithJson(@RequestParam(value="cp",defaultValue="1") Integer cp,Model model) {
    PageHelper.startPage(cp, 5);
    List<Employee> list = employeeService.list();
    PageInfo<Employee> page = new PageInfo<Employee>(list, 5);
    return CommonResult.success().add("pageInfo", page);
  }
  
  /**
         * 获取全部雇员信息
   * @return
   */
  //@RequestMapping("/emps")
  public String getEmps(@RequestParam(value="cp",defaultValue="1") Integer cp,Model model) {
    PageHelper.startPage(cp, 5);
    List<Employee> list = employeeService.list();
    PageInfo<Employee> page = new PageInfo<Employee>(list, 5);
    model.addAttribute("pageInfo", page);
    return "list";
  }
  
}
