package com.hjc.ssm.test;

import com.hjc.ssm.bean.Department;
import com.hjc.ssm.bean.Employee;
import com.hjc.ssm.dao.DepartmentMapper;
import com.hjc.ssm.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

import static org.junit.Assert.*;

/**
 * @Classname MapperTest
 * @Description TODO
 * @Date 2020-01-07 14:13
 * @Created by Justin
 */
@ContextConfiguration
        (
                {
                        "file:src/main/resources/spring/*.xml"
                }
        )
@RunWith(SpringJUnit4ClassRunner.class)
public class MapperTest {

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void mapperTest() {
//        departmentMapper.insertSelective(new Department(null, "开发部"));
//        departmentMapper.insertSelective(new Department(null, "测试部"));

//        employeeMapper.insertSelective(new Employee(null, "Justin", "M", "justin@gmail.com", 7));

        EmployeeMapper batchEmployeeMapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0; i < 1000; i++) {
            String uuid = UUID.randomUUID().toString().substring(0, 5);
            batchEmployeeMapper.insertSelective(new Employee(null, uuid, "M", uuid+"@gmail.com", 7));
        }
        System.out.println("Batch Insert Complete");
    }

}