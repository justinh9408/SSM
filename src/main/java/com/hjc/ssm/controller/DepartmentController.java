package com.hjc.ssm.controller;

import com.hjc.ssm.bean.Department;
import com.hjc.ssm.dao.DepartmentMapper;
import com.hjc.ssm.service.DepartmentService;
import com.hjc.ssm.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Classname DepartmentController
 * @Description TODO
 * @Date 2020-01-09 13:31
 * @Created by Justin
 */
@Controller
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;

    @ResponseBody
    @RequestMapping("/depts")
    public Msg getDepts(){
        List<Department> departments = departmentService.getDepts();
        return Msg.success().add("depts",departments);
    }
}
