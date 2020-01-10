package com.hjc.ssm.service;

import com.hjc.ssm.bean.Employee;
import com.hjc.ssm.bean.EmployeeExample;
import com.hjc.ssm.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
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
        EmployeeExample example = new EmployeeExample();
        example.setOrderByClause("e.id");
        return employeeMapper.selectByExampleWithDpt(example);
    }

    public void insertEmp(Employee employee) {
        System.out.println(employee);
        employeeMapper.insertSelective(employee);
    }

    public boolean checkName(String empName) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long n = employeeMapper.countByExample(example);
        return n == 0;
    }


    public Employee getEmpById(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    public void updateEmp(Employee employee) {
        employeeMapper.updateByPrimaryKeySelective(employee);
    }
}
