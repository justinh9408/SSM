package com.hjc.ssm.service;

import com.hjc.ssm.bean.Department;
import com.hjc.ssm.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Classname DepartmentService
 * @Description TODO
 * @Date 2020-01-09 13:34
 * @Created by Justin
 */
@Service
public class DepartmentService {

    @Autowired
    DepartmentMapper departmentMapper;

    public List<Department> getDepts() {

        return departmentMapper.selectByExample(null);

    }
}
