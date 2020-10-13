package com.bed.controller;

import com.bed.entity.StudentAcc;
import com.bed.service.StuAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName StuAccountController
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/10/6 16:54
 * @Version 1.0
 **/
@Controller
@RequestMapping("/stuAcc")
public class StuAccountController {

    private final StuAccountService stuAccountService;

    @Autowired
    public StuAccountController(StuAccountService stuAccountService) {
        this.stuAccountService = stuAccountService;
    }
    //登录验证
    @RequestMapping(value="/login",method = RequestMethod.POST)
    public String stuLogin(String stu_id,String stu_password, HttpServletRequest req, Model model){
        StudentAcc studentAcc = stuAccountService.getStudent(stu_id);
        if(studentAcc !=null){
            if(studentAcc.getStu_password().equals(stu_password)){
                model.addAttribute("stuLoginSuccess",true);
                return "redirect:/bed/bed_List";
            }
            else{
                System.out.println("密码错误！");
                model.addAttribute("stuLoginSuccess",false);
                return "login";
            }
        }
        else{
            System.out.println("学号不存在！");
            model.addAttribute("stuLoginSuccess",false);
            return "login";
        }
    }
    //删除学生账户
    @RequestMapping("/deleteStuAcc")
    public String deleteStuAcc(String stu_id,HttpServletRequest req){
        stuAccountService.deleteStuAcc(stu_id);
        req.getSession().setAttribute("deleteStuId",stu_id);
        return "redirect:/stuInfo/deleteStuInfo";
    }

}
