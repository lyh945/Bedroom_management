package com.bed.controller;

import com.bed.dao.BedroomDao;
import com.bed.entity.Bedroom;
import com.bed.entity.StudentInfo;
import com.bed.service.Service_Impl.BedroomServiceImpl;
import com.bed.service.StuInfoService;
import com.bed.util.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName StuInfoController
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/10/6 20:34
 * @Version 1.0
 **/
@Controller
@RequestMapping("/stuInfo")
public class StuInfoController {

    private final StuInfoService stuInfoService;

    @Autowired
    public StuInfoController(StuInfoService stuInfoService) {
        this.stuInfoService = stuInfoService;
    }

    @RequestMapping("/toStuInfoList")
    public String toStuInfoList(){
        return "redirect:/stuInfo/stuInfoList";
    }

    @RequestMapping("/toAddStuInfo")
    public String toAddStuInfo(){
        return "stu_addStuInfo";
    }
    //获取所有学生个人信息
    @RequestMapping("/stuInfoList")
    public String stuInfoAllList(HttpServletRequest req,Model model, @RequestParam(defaultValue = "1",required = true,value = "pageNo") Integer pageNo){
        int pageSize=5;
        PageHelper.startPage(pageNo,pageSize);
        List<StudentInfo> stuInfos=stuInfoService.allListStuInfo();
        PageInfo<StudentInfo> stuInfoPageInfo=new PageInfo<>(stuInfos);
        model.addAttribute("stuInfos",stuInfos);
        model.addAttribute("stuInfoPageInfo",stuInfoPageInfo);
        model.addAttribute("isAllStuInfo",true);
        req.getSession().setAttribute("isExistStuId",false);
        return "stu_assignList";
    }
    //通过寝室号获取本寝室所有学生列表
    @RequestMapping("/bedIdToStuList")
    public String bedIdToStuList(int bed_id,Model model){
        List<StudentInfo> bedToStuInfos = stuInfoService.listStuInfo(bed_id);
        model.addAttribute("bedToStuInfos",bedToStuInfos);
        return "admin_stuInfoList";
    }
    //通过学号搜索获取单个学生个人信息
    @RequestMapping("/getStuInfo")
    public String getBedroom(String inputStuValue,Model model){
        List<StudentInfo> stuInfos=new ArrayList<>();
        StudentInfo stuInfo = stuInfoService.getStuInfo(inputStuValue);
        stuInfos.add(stuInfo);
        model.addAttribute("stuInfos",stuInfos);
        model.addAttribute("isAllStuInfo",false);
        return "stu_assignList";
    }
    //删除一个学生信息
    @RequestMapping("/deleteStuInfo")
    public String deleteStuInfo(HttpServletRequest req){
        String deleteStuId = (String) req.getSession().getAttribute("deleteStuId");
        Integer deleteBedId = stuInfoService.getBedId(deleteStuId);
        stuInfoService.deleteStuInfo(deleteStuId);
        if(deleteBedId!=null){
            req.getSession().setAttribute("deleteBedId",deleteBedId);
        }
        else{
            return "redirect:/stuInfo/stuInfoList";
        }

        req.getSession().setAttribute("decAndInc",false);
        req.getSession().setAttribute("onlyDec",false);
        req.getSession().setAttribute("onlyInc",false);
        req.getSession().setAttribute("deleteToDec",true);
        return "redirect:/bed/changeStuNum";
    }
    //为学生、分配更改寝室
    @RequestMapping("/assignBed")
    public String assignBed(Integer newBed_id,Integer oldBed_id,String stu_id,HttpServletRequest req){
        req.getSession().setAttribute("decAndInc",false);
        req.getSession().setAttribute("onlyDec",false);
        req.getSession().setAttribute("onlyInc",false);
        req.getSession().setAttribute("deleteToDec",false);
        if(oldBed_id != null){
            req.getSession().setAttribute("oldBed_id",oldBed_id);
            if(newBed_id!=null){
                req.getSession().setAttribute("decAndInc",true);
            }
            else{
                req.getSession().setAttribute("onlyDec",true);
                System.out.println("新寝室号为空");
            }
            System.out.println("更改寝室");
        }
        else{
            if(newBed_id!=null){
                req.getSession().setAttribute("onlyInc",true);
            }
            System.out.println("分配寝室");
        }
        req.getSession().setAttribute("newBed_id",newBed_id);
        stuInfoService.changeBedroomId(stu_id,newBed_id);
        return "redirect:/bed/changeStuNum";
    }
    //添加一个学生
    @RequestMapping("/addStuInfo")
    public String addStuInfo(@ModelAttribute StudentInfo studentInfo,Model model,String init_password){

        studentInfo.setBed_id(studentInfo.getBed_id());
        String stu_id = studentInfo.getStu_id();
        List<String> allStuId = stuInfoService.getAllStuId();
        for(String id:allStuId){
            if(id.equals(stu_id)){
                model.addAttribute("isExistStuId",true);
                return "stu_addStuInfo";
            }
        }
        model.addAttribute("isExistStuId",false);
        stuInfoService.addStuInfo(studentInfo);
        return "redirect:/stuInfo/stuInfoList";
    }
    //编辑中转站
    @RequestMapping("/editTemp")
    public String editTemp(String stu_id,Model model){
        StudentInfo tempStuInfo = stuInfoService.getStuInfo(stu_id);
        model.addAttribute("tempStuInfo",tempStuInfo);
        return "stu_editStuInfo";
    }
    //编辑学生个人信息
    @RequestMapping(value="/editStuInfo",method = RequestMethod.POST)
    public String editStuInfo(@ModelAttribute StudentInfo studentInfo){
        System.out.println(studentInfo);
        stuInfoService.changeStuInfo(studentInfo);
        return "redirect:/stuInfo/stuInfoList";
    }
}
