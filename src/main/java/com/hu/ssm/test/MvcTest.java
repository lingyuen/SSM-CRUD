package com.hu.ssm.test;



import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import com.github.pagehelper.PageInfo;
import com.hu.ssm.bean.Employee;
@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:applicationContext.xml","file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml"})


public class MvcTest {
    @Autowired
    private WebApplicationContext context;
    
    private MockMvc mockMvc;
    
    @Before
    public void initMockMvc() {
      mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }
    
    @Test
    public void testEmps() throws Exception {
      MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps")).andReturn();
      
      MockHttpServletRequest request = result.getRequest();
      
      @SuppressWarnings("unchecked")
      PageInfo<Employee> pi = (PageInfo<Employee>) request.getAttribute("pageInfo");
      System.out.println("当前页码 " +pi.getPageNum());
      System.out.println("总页码 "+pi.getPages());
      System.out.println("总记录数 "+pi.getTotal());
      
      System.out.println("连续显示页数：");
      int[] num = pi.getNavigatepageNums();
      for (int i : num) {
        System.out.println(" "+i);
      }
      System.out.println("员工明细：");
      List<Employee> list = pi.getList();
      for (Employee employee : list) {
        System.out.println(employee);
      }
    }

}
