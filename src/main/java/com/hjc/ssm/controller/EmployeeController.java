package com.hjc.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hjc.ssm.bean.Employee;
import com.hjc.ssm.service.EmployeeService;
import com.hjc.ssm.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;

/**
 * @Classname EmployeeController
 * @Description TODO
 * @Date 2020-01-07 15:28
 * @Created by Justin
 */
@Controller
public class EmployeeController {

    @Autowired
    EmployeeService employeeService;

    @ResponseBody
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.PUT)
    public Msg updateEmp(Employee employee){
        System.out.println("update: " + employee);
        employeeService.updateEmp(employee);
        return Msg.success();
    }

    @ResponseBody
    @RequestMapping(value = "/emp/{id}", method = RequestMethod.GET)
    public Msg getEmpById(@PathVariable("id") Integer id){
        System.out.println("getEmpById");
        Employee employee = employeeService.getEmpById(id);
        return Msg.success().add("emp", employee);
    }

//    checkEmpName
    @ResponseBody
    @RequestMapping(value = "/checkEmpName", method = RequestMethod.GET)
    public Msg checkName(@RequestParam("empName") String empName){

        boolean b = employeeService.checkName(empName);
        if (b) {
            return Msg.success();
        }else
            return Msg.fail();
    }


    @RequestMapping(value = "/emps", method = RequestMethod.POST)
    @ResponseBody
    public Msg insertEmp(@Valid Employee employee, BindingResult bindingResult){
        if (bindingResult.hasErrors()) {
            HashMap<String, String> errorMap = new HashMap<String, String>();
            List<FieldError> fieldErrors = bindingResult.getFieldErrors();
            for (FieldError fieldError: fieldErrors) {
                String field = fieldError.getField();
                String defaultMessage = fieldError.getDefaultMessage();
                errorMap.put(field, defaultMessage);
            }
            return Msg.fail().add("errorMap", errorMap);
        }else {
            employeeService.insertEmp(employee);
            return Msg.success();
        }
    }

    //返回Json，客户端平台无关性
    @RequestMapping(value = "/emps", method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmpsInJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn){
        PageHelper.startPage(pn, 5);
        List<Employee> allEmps = employeeService.getAllEmps();
        PageInfo pageInfo = new PageInfo(allEmps,5);
        System.out.println("emps");
        return Msg.success().add("pageInfo", pageInfo);
    }

//    @RequestMapping("/emps")
    public String emps(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
                       Model model){
        PageHelper.startPage(pn, 5);
        List<Employee> allEmps = employeeService.getAllEmps();
        PageInfo pageInfo = new PageInfo(allEmps,5);
        model.addAttribute("pageInfo", pageInfo);
        return "list";
    }
}
