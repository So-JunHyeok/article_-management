package com.real_estate.agent.controller;

import java.io.File;


import java.util.Date;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.swing.ImageIcon;

import org.junit.runners.Parameterized.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.real_estate.agent.dao.Building_ListService;
import com.real_estate.agent.dao.Object_List_Service;
import com.real_estate.agent.model.BL_Type;
import com.real_estate.agent.model.Building_List;
import com.real_estate.agent.model.Building_file_list;
import com.real_estate.agent.model.Filter_param;
import com.real_estate.agent.model.Object_List;
import com.real_estate.agent.model.Object_List_file;
import com.real_estate.agent.model.Schedule_VO;
import com.real_estate.agent.model.file_LIst;
import com.real_estate.agent.model.file_path;



@Controller
public class BuildingListAction {
	
	private static final String SAVE_PATH = "resources/room_photo/";
	
@Autowired
private Building_ListService BuildingService;

@Autowired
private ServletContext servletContext;

@Autowired
private Object_List_Service boardService;


int BL_Max = 0;
int BL_Min = 0;
int BL_Num = 0;
List <BL_Type> BF_Type = null;
String mess = "tt";
Building_List object_list = null;



String uploadFileName = "";
String filename = "";
long fileSize = 0;
int imgWidth = 0;
int imgHeight = 0;
int fileindex = 0;
int currentTime = 0;
Iterator<MultipartFile> it = null;
int cont = 0;
String file_null = "not_null";

@RequestMapping(value="building_img_data")
@ResponseBody 
public Map<String, Object> object_view_data_t(
		@RequestParam(value="img_num")String img_num,
		@RequestParam(value="img_type", defaultValue="no")String img_type
		)throws Exception{


	
	
	Map map = new HashMap();
	String type = "yes";
	if(img_type.equals("no") ) {
		type = "no";
	}
	
	map.put("BL_Num", img_num);
	map.put("img_type", img_type);	
	map.put("type", type);	

	
	
	List<file_path> ob_file = BuildingService.get_bl_file_list(map);
	

	
	HashMap<String, Object> result = new HashMap<String, Object>();


	result.put("ob_file", ob_file);
	
	return result;
}




@RequestMapping(value="object_list_data")
@ResponseBody 
public Map<String, Object> SubList(
		@RequestParam(value="state", defaultValue= "계약off")String state,
		@RequestParam(value="ob_s")String s_address,
		@RequestParam(value="ob_b")String b_address
		
		
		)throws Exception{
	
	String AC_Name = "sublist";
	
	
	Map map = new HashMap();
	map.put("state", state);
	map.put("AC_Name", AC_Name);
	map.put("s_address", s_address);
	map.put("b_address", b_address);
	
	List<Object_List> sublist = boardService.getSubList(map);
	
	HashMap<String, Object> result = new HashMap<String, Object>();
	

	result.put("listkey", sublist);
	


	  
	return result;
}





@RequestMapping(value="building_check")
@ResponseBody
public String building_check(
		@RequestParam(value="search_select", defaultValue= "no")String search_select,
		@RequestParam(value="search", defaultValue= "no")String search
		)throws Exception{
/*	System.out.println("building_check");
	System.out.println(search_select);
	System.out.println(search);
*/
	
	Map map = new HashMap();
	map.put("search_select", search_select);
	map.put("search", search);
	Building_List object_list = BuildingService.getbl_List_search(map);
	try {
		int search_num = object_list.getBL_Num();	
	}	
	catch (NullPointerException e) {
		return "no";
	}
	return "ok";
}
		




@RequestMapping(value="insert_check")
@ResponseBody
public String insert_check(
		@RequestParam(value="name", defaultValue= "no")String name,
		@RequestParam(value="b_address", defaultValue= "no")String b_address,
		@RequestParam(value="s_address", defaultValue= "no")String s_address
		)throws Exception{
		Building_List list_name = null;
		Building_List list_b = null;
		Building_List list_s = null;
		int result = 0;
		
/*		System.out.println("insert_check");
		System.out.println(name);
		System.out.println(b_address);
		System.out.println(s_address);*/

	
		Map map = new HashMap();
		
		map.put("search_select", "name");
		map.put("search", name);
		try {
			list_name = BuildingService.getbl_List_search(map);
			if(list_name.getBL_Name() == "") {
				list_name = null;
			}
			
		}
		catch(NullPointerException e) {
			list_name = null;
			
		}
			
		if(list_name == null) {
			
		}
		else {
			return "n";
		}
			
		map.put("search_select", "s_adds");
		map.put("search", s_address);
		try {
			list_s = BuildingService.getbl_List_search(map);
			if(list_s.getBL_S_Address() == "") {
				list_s = null;
			}
		}
		catch(NullPointerException e) {
			list_s = null;
		}
			
		if(list_s == null) {
			
		}
		else {
			return "s";
		}
		
		
	
		
		map.put("search_select", "b_adds");
		map.put("search", b_address);
		try {
			list_b = BuildingService.getbl_List_search(map);
			if(list_b.getBL_B_Address() == "") {
				list_b = null;
			}
		}
		catch(NullPointerException e) {
			list_b = null;
		}
			
		if(list_b == null) {
		
		}
		else {
			return "b";
		}
	
		
		if(list_name == null && list_s == null && list_b == null) {
			return "ok";
		}
	
		return "no";
	

}



@RequestMapping(value="building_popup")
public ModelAndView popup_view(
		@RequestParam(value="kind", defaultValue="insert")String kind,
		@RequestParam(value="up_num", defaultValue="0")String up_num
		
		) throws Exception {
	ModelAndView mv = new ModelAndView();
/*	System.out.println("eh");
	System.out.println(kind);
	System.out.println(up_num);*/
	
	Map map = new HashMap();
	
	
	if("update".equals(kind)) {
		map.put("BL_Num", up_num);
		Building_List list = BuildingService.getBuilding_List(map);
		mv.addObject("list", list);
		mv.setViewName("popup/Building_update");
	}
	else {
		mv.setViewName("popup/Building_insert");
	}
	
	
	
	
	
	
	return mv;
}




@RequestMapping(value="building_search")
public ModelAndView building_search(
		@RequestParam(value="state", defaultValue= "계약off")String state,
		@RequestParam(value="BL_Num", defaultValue= "no")String bl_Num
		) throws Exception {
/*	System.out.println("building_search");*/
	ModelAndView mv = new ModelAndView();
	Map map = new HashMap();
	
	int BL_Max = 0;
	int BL_Min = 0;
	int BL_Num = 0;
	int rownum = 0;
	
	try {
	BL_Max = BuildingService.getbl_List_count(map);
	} catch (NullPointerException e) {
	BL_Max = 0;	
	}
	
	try {
		BL_Min = BuildingService.getbl_List_min(map);
	} catch (NullPointerException e) {
		BL_Min = 0;	
	}
	
	

	map.put("BL_Num", bl_Num);
	Building_List search_List = BuildingService.getbl_List_search(map);
	
	rownum = search_List.getRowNum();
	
	try{
	BL_Num = search_List.getBL_Num();	
	}
	catch(NullPointerException e) {
		
	}

	mv.addObject("rownum", rownum);
	mv.addObject("state", state);
	mv.addObject("BL_Max", BL_Max);
	mv.addObject("BL_Min", BL_Min);
		/* mv.addObject("BL_Num", BL_Num); */
	mv.addObject("object_list", search_List);
	mv.setViewName("sec/building_list");
	
	return mv;
}


@RequestMapping(value="building_nhn")
public ModelAndView building_view(
		@RequestParam(value="Num", defaultValue= "0")int Num,
		@RequestParam(value="state", defaultValue= "계약off")String state,
		@RequestParam(value="Next", defaultValue= "no")String Next,
		@RequestParam(value="rownum", defaultValue= "0")int rownum,
		@RequestParam(value="Prev", defaultValue= "no")String Prev
		) throws Exception {
	
	int BL_Num=0;
	
	ModelAndView mv = new ModelAndView();
	Map map = new HashMap();
	
	
	try {BL_Max = BuildingService.getbl_List_count(map); System.out.println("count="+BL_Max);}
	catch (NullPointerException e) {BL_Max = 0;	}
	BL_Min = 0;
	
	if(Next.equals("Next")) {
		rownum+=1;
		System.out.println(rownum);
	}
	if(Prev.equals("Prev")) {
		rownum-=1;
	}
	

	
	map.put("rownum", rownum);
	try {
		System.out.println(rownum);
	object_list = BuildingService.getBuilding_List(map);
	} catch (NullPointerException e) {
		
	}
	BL_Num  = object_list.getBL_Num();
		
		mv.addObject("BL_Max", BL_Max);
		mv.addObject("BL_Num", BL_Num);
		mv.addObject("BL_Min", BL_Min);
		mv.addObject("rownum", rownum);
		mv.addObject("state", state);
		mv.addObject("BL_Type_List", BF_Type);
		mv.addObject("object_list", object_list);
		mv.setViewName("sec/building_list");
	return mv;
}





@RequestMapping(value="building_Insert")
public @ResponseBody ModelAndView Insert_schedule(
		Building_List building_List,
		@ModelAttribute(value="file_LIst")file_LIst files,
		@RequestParam(value="BL_Type", defaultValue="No_Type")String[] BL_Type
		)throws Exception {
	Map map = new HashMap();
	map.put("Building_List", building_List);
	BuildingService.insert_Building(map);
	int BBF_Num;
	int LastNum;
	Date date = new Date();
	LastNum = BuildingService.getblfile_in_num(map);
	
	for(int i = 0; i < BL_Type.length; i++) {
	  try {it = files.getFile_LIst().get(i).getFiles().iterator();}
	  catch (NullPointerException e) {file_null = "null";}
	    if(file_null == "not_null") {
	      while(it.hasNext()) {
			MultipartFile file = it.next();
			currentTime = (int) System.currentTimeMillis();
			filename = file.getOriginalFilename();
			uploadFileName = currentTime + filename; 	
			imgWidth = new ImageIcon(filename).getImage().getWidth(null);
			imgHeight = new ImageIcon(filename).getImage().getHeight(null);
			fileSize = file.getSize();
			BBF_Num = +1;
			map.put("filename", filename);
			map.put("uploadFileName", uploadFileName);
			map.put("imgWidth", imgWidth);
			map.put("imgHeight", imgHeight);
			map.put("fileSize", fileSize);
			map.put("LastNum", LastNum);
			map.put("date", date);
			map.put("BBF_Num", BBF_Num);
			map.put("BL_Type", BL_Type[i]);
			
			BuildingService.insert_blfiles(map);
			
File uploadfile = new File(servletContext.getRealPath("/") + SAVE_PATH +uploadFileName);
			
		try {if(filename.length()>0) {file.transferTo(uploadfile);}} 
		catch (Exception e) {e.printStackTrace();}				
	   }		
	 }		
   }
	ModelAndView mv = new ModelAndView();
	mv.setViewName("popup/success");
	mv.addObject("view","bliding_insert");
	return mv;
}




@RequestMapping(value="building_add_img", method=RequestMethod.POST)
public ModelAndView building_add_img(
		@ModelAttribute(value="file_LIst")file_LIst files,
		@RequestParam(value="BL_Type", defaultValue="No_Type")String[] BL_Type,
		@RequestParam(value="BL_Num", defaultValue="0")int BL_Num
		
		)throws Exception {
	Map map = new HashMap();

	String uploadFileName = "";
	String filename = "";
	long fileSize = 0;
	int imgWidth = 0;
	int imgHeight = 0;
	int fileindex = 0;
	int currentTime = 0;
	int BLF_Num;
	int cont = 0;
	Date date = new Date();
	map.put("bl_num", BL_Num);
	try {
		BLF_Num = BuildingService.get_blf_num(map);
		System.out.println("num:"+BLF_Num);
	} catch (NullPointerException e) {
		BLF_Num = 0;
	}
		
	
	
	
	ModelAndView mv = new ModelAndView();
	for(int i = 0; i < BL_Type.length; i++) {
	Iterator<MultipartFile> it = files.getFile_LIst().get(i).getFiles().iterator();
	while(it.hasNext()) {
	/*	System.out.println("ff");*/
		MultipartFile file = it.next();
		currentTime = (int) System.currentTimeMillis();
		filename = file.getOriginalFilename();
		uploadFileName = currentTime + filename; 	
		imgWidth = new ImageIcon(filename).getImage().getWidth(null);
		imgHeight = new ImageIcon(filename).getImage().getHeight(null);
		fileSize = file.getSize();
		BLF_Num +=1;
		
/*		System.out.println(currentTime);
		System.out.println(filename);
		System.out.println(uploadFileName);
		System.out.println(imgWidth);
		System.out.println(imgHeight);
		System.out.println(fileSize);
		System.out.println(BLF_Num);*/
		
		
		map.put("filename", filename);
		map.put("uploadFileName", uploadFileName);
		map.put("imgWidth", imgWidth);
		map.put("imgHeight", imgHeight);
		map.put("fileSize", fileSize);
		map.put("LastNum", BL_Num);
		map.put("date", date);
		map.put("BBF_Num", BLF_Num);
		map.put("BL_Type", BL_Type[i]);
		
		
		
		System.out.println(servletContext.getRealPath("/") + SAVE_PATH);
		
		BuildingService.insert_blfiles(map);
		
		File uploadfile = new File(servletContext.getRealPath("/") + SAVE_PATH +uploadFileName);
		
		try {
			if(filename.length()>0)
				
				file.transferTo(uploadfile);
		
	} catch (Exception e) {
		e.printStackTrace();
	}		
		
		
	}	
	
}	mv.addObject("BL_Num", BL_Num);
	mv.setViewName("popup/success");
	mv.addObject("view","bliding_insert");
	return mv;
}



















@RequestMapping(value="bl_update")
public ModelAndView bl_update(
		Building_List building_List,
		@RequestParam(value="num", defaultValue="0")int num
		)throws Exception{
	
	
	
	Map map = new HashMap();
	ModelAndView mv = new ModelAndView();
	
	map.put("list", building_List);
	map.put("BL_Num", num);
	
	BuildingService.update_bl_list(map);

	mv.setViewName("popup/success");
	mv.addObject("view","bliding_update");
	
	return mv;
	
}


@RequestMapping(value="bl_delete")
public String bl_delete(
		@RequestParam(value="del_num", defaultValue="0")int del_num
		) throws Exception{
	
	Map map = new HashMap();
	
	
	map.put("BL_Num", del_num);
	BuildingService.delete_bl_list(map);
	BuildingService.delete_bl_files(map);
	
	return "redirect:building_nhn";
	
}

@RequestMapping(value="bl_add_img")
public ModelAndView bl_add_img_form(
		@RequestParam(value="BL_Num", defaultValue="0")int BL_Num
		) throws Exception {
	
	ModelAndView mv = new ModelAndView();
/*	System.out.println("b이미지도착");*/
	mv.addObject("BL_Num", BL_Num);
	mv.setViewName("popup/b_img_add2");
	
	
	return mv;
}





@RequestMapping(value="search_building")
public ModelAndView building_list(
		@RequestParam(value="search_select", defaultValue="name")String search_select,
		@RequestParam(value="state", defaultValue= "계약off")String state,
		@RequestParam(value="search", defaultValue="")String search
		)throws Exception{

	ModelAndView mv = new ModelAndView();
	Map map = new HashMap();
	map.put("search_select", search_select);
	map.put("search", search);
	
	String select_option = "건물명";
/*	
	System.out.println("search_select"+search_select);
	System.out.println("search"+search);*/
	
	List<Building_List> bl_list = BuildingService.get_building_List(map);
	
	
	if(search_select.equals("s_adds") ) {
		select_option = "도로명";
	}
	if(search_select.equals("b_adds") ) {
		select_option = "번지명";
	}
	if(search_select.equals("name") ) {
		select_option = "건물명";
	}
	
	
	mv.addObject("state", state);
	mv.addObject("bl_list", bl_list);
	mv.addObject("search_select", select_option);
	mv.addObject("search", search);
	mv.setViewName("popup/building_search_list");
	
	return mv;
	
}









}
	