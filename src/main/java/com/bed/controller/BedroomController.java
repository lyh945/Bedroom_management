package com.bed.controller;

import com.bed.entity.Bedroom;
import com.bed.service.BedroomService;
import com.bed.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * @ClassName BedroomController
 * @Description DOTO
 * @Author lyh945
 * @Date 2020/9/20 16:50
 * @Version 1.0
 **/
@Controller
@RequestMapping("/bed")
public class BedroomController {
    private final BedroomService bedroomService;

    @Autowired
    public BedroomController(BedroomService bedroomService) {
        this.bedroomService = bedroomService;
    }

    @RequestMapping("/toAdd")
    public String toADD(){
        return "admin_addBed";
    }


    @RequestMapping("/editBedroom")
    public String editBedroom(@ModelAttribute Bedroom bedroom){
        bedroomService.editBedroom(bedroom);
        return "redirect:/bed/bed_List";
    }

    @RequestMapping("/editTemp")
    public String editTemp( int bed_id,Model model){
        Bedroom bedroomTemp = bedroomService.getBedroom(bed_id);
        model.addAttribute("bedroomTemp",bedroomTemp);
        return "admin_editBed";
    }

    @RequestMapping("/deleteBedroom")
    public String deleteBedroom(int bed_id){
        bedroomService.deleteBedroom(bed_id);
        return "redirect:/bed/bed_List";
    }

    @RequestMapping("/addBedroom")
    public String addBedroom(@ModelAttribute Bedroom bedroom,HttpServletRequest req){
        List<Integer> allBedId = bedroomService.getAllBedId();
        for(int bedId:allBedId){
            if(bedId==bedroom.getBed_id()){
                req.getSession().setAttribute("isExistBedId",true);
                return "redirect:/bed/toAdd";
            }
        }
        bedroomService.addBedroom(bedroom);
        req.getSession().setAttribute("isExistBedId",false);
        return "redirect:/bed/bed_List";
    }

    @RequestMapping("/bed_List")
    public String bed_List(HttpServletRequest req,Model model){
        int start=0;
        int count=5;
        Page page=null;
        int total=bedroomService.getTotal();
        if(req.getParameter("start")!=null){
            start= Integer.parseInt(req.getParameter("start"));
        }

        if(start<0 || total<=count){
            start=0;
        }
        if(total >count && start>=total){
            if(start%count==0){
                start-=count;
            }
            else{
                start=(total/count)*count;
            }
        }

        page=new Page(start,count,total);
        int totalPageNum=1;
        if(page.getTotal()%page.getCount()==0){
            totalPageNum=page.getTotal()/page.getCount();
        }
        else{
            totalPageNum=page.getTotal()/page.getCount()+1;
        }
        int nowPageNum=start/count+1;
        List<Bedroom> bedrooms = bedroomService.bed_List(page.getStart(),page.getCount());
        model.addAttribute("page",page);
        model.addAttribute("bedrooms",bedrooms);
        model.addAttribute("nowPageNum",nowPageNum);
        model.addAttribute("totalPageNum",totalPageNum);
        model.addAttribute("isAllBedroom",true);
        req.getSession().setAttribute("isExistBedId",false);
        return "admin_bedList";
    }

    @RequestMapping("/getBedroom")
    public String getBedroom(int inputBedValue,Model model){
        Page page=new Page(0,2);
        List<Bedroom> bedrooms=new ArrayList<>();
        Bedroom bedroom = bedroomService.getBedroom(inputBedValue);
        bedrooms.add(bedroom);
        model.addAttribute("bedrooms",bedrooms);
        model.addAttribute("page",page);
        model.addAttribute("nowPageNum",1);
        model.addAttribute("totalPageNum",1);
        model.addAttribute("isAllBedroom",false);
        return "admin_bedList";
    }

    @RequestMapping("/changeStuNum")
    public String changeStuNum(HttpServletRequest req){
        if((boolean) req.getSession().getAttribute("decAndInc")){
            Integer newBed_id = (Integer) req.getSession().getAttribute("newBed_id");
            int oldBed_id = (Integer) req.getSession().getAttribute("oldBed_id");
            Integer newStuNum = bedroomService.getStuNum(newBed_id);
            int oldStuNum = bedroomService.getStuNum(oldBed_id);
            bedroomService.decStuNum(oldStuNum,oldBed_id);
            bedroomService.incStuNum(newStuNum,newBed_id);
            req.getSession().setAttribute("decAndInc",false);
        }
        else if((boolean)req.getSession().getAttribute("onlyInc")){
            Integer newBed_id = (Integer) req.getSession().getAttribute("newBed_id");
            Integer newStuNum = bedroomService.getStuNum(newBed_id);
            bedroomService.incStuNum(newStuNum,newBed_id);
            req.getSession().setAttribute("onlyInc",false);
        }
        else if((boolean)req.getSession().getAttribute("onlyDec")){
            Integer oldBed_id =(Integer) req.getSession().getAttribute("oldBed_id");
            Integer oldStuNum=bedroomService.getStuNum(oldBed_id);
            bedroomService.decStuNum(oldStuNum,oldBed_id);
            req.getSession().setAttribute("onlyDec",false);
        }
        else if((boolean)req.getSession().getAttribute("deleteToDec")){
            Integer deleteBed_id = (Integer) req.getSession().getAttribute("deleteBedId");
            Integer oldStuNum=bedroomService.getStuNum(deleteBed_id);
            bedroomService.decStuNum(oldStuNum,deleteBed_id);
            req.getSession().setAttribute("deleteToDec",false);
        }
        return "redirect:/stuInfo/stuInfoList";
    }
}
