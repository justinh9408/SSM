package com.hjc.ssm.test;

import com.github.pagehelper.PageInfo;
import com.hjc.ssm.bean.Employee;
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

import java.util.List;

/**
 * @Classname MvcTest
 * @Description TODO
 * @Date 2020-01-07 15:44
 * @Created by Justin
 */
@ContextConfiguration
        (
                {
                        "file:src/main/resources/spring/*.xml"
                }
        )
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
public class MvcTest {

    @Autowired
    WebApplicationContext webApplicationContext;

    MockMvc mockMvc;

    @Before
    public void intiMockMvc() {
        mockMvc = MockMvcBuilders.webAppContextSetup(webApplicationContext).build();
    }

    @Test
    public void testAllEmps() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders
                .get("/emps").param("pn", "6"))
                .andReturn();

        MockHttpServletRequest request = result.getRequest();
        PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
        System.out.println("当前页码 " + pi.getPageNum());
        System.out.println("总页码 " + pi.getPages());
        System.out.println("总记录数 " + pi.getTotal());
        System.out.println("在页面连续显示的页码");
        int[] navigatesNumb = pi.getNavigatepageNums();

        for (int i :
                navigatesNumb) {
            System.out.println(i);
        }

        List<Employee> emps = pi.getList();
        for (Employee e :
                emps) {
            System.out.println(e);
        }
    }
}
