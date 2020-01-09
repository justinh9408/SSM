package com.hjc.ssm.service;

import com.hjc.ssm.bean.Employee;
import com.hjc.ssm.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * @Classname EmployeeService
 * @Description TODO
 * @Date 2020-01-07 15:29
 * @Created by Justin
 */
@Service
public class EmployeeService {

    @Autowired
    EmployeeMapper employeeMapper;


    public List<Employee> getAllEmps() {
        return employeeMapper.selectByExampleWithDpt(null);
    }

    public void insertEmp(Employee employee) {
        System.out.println(employee);
        employeeMapper.insertSelective(employee);
    }
}
