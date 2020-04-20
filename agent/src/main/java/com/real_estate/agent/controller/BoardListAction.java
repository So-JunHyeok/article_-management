package com.real_estate.agent.controller;

import java.io.File;





import java.util.Date;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.real_estate.agent.dao.Building_ListService;
import com.real_estate.agent.dao.Customer_Service;
import com.real_estate.agent.dao.Object_List_Service;
import com.real_estate.agent.dao.Stroage_Service;
import com.real_estate.agent.model.Building_List;
import com.real_estate.agent.model.Filter_param;
import com.real_estate.agent.model.Object_List;
import com.real_estate.agent.model.Object_List_file;
import com.real_estate.agent.model.file_LIst;
import com.real_estate.agent.model.file_path;
import com.real_estate.agent.model.ob_select_dong_list;

import junit.framework.Test;



@Controller
public class BoardListAction {
	
private static final String SAVE_PATH = "resources/room_photo/";
	
@Autowired
private Object_List_Service boardService;
@Autowired
private Stroage_Service stroageService;	
@Autowired
private Customer_Service CustomerService;
@Autowired
private ServletContext servletContext;
@Autowired
private Building_ListService BuildingService;

String uploadFileName = "";
String filename = "";
long fileSize = 0;
int imgWidth = 0;
int imgHeight = 0;
int fileindex = 0;
int currentTime = 0;
int cont = 0;

@RequestMapping(value="object_form_popup")
public ModelAndView popup_view()throws Exception {
	
	ModelAndView mv = new ModelAndView();
	/*	System.out.println("form");*/


	Map map = new HashMap();
		mv.setViewName("popup/Form");
		
	return mv;
}

	
@RequestMapping(value="list", method=RequestMethod.GET)
public ModelAndView listview(
		@RequestParam(value="ListOption", defaultValue="OneRoom")String ListOption,
		@RequestParam(value="_list_filter", defaultValue="list")String list_filter,
		@RequestParam(value="address", defaultValue="번지명")String address,
		@RequestParam(value="py_m2", defaultValue="py")String py_m2,
		@RequestParam(value="currentpage", defaultValue= "1")int currentpage,
		@RequestParam(value="Nextpage", defaultValue= "0")int Nextpage,
		@RequestParam(value="S_Title", defaultValue="0")int S_Title,
		@RequestParam(value="C_tel", defaultValue="0")String Tel,
		@RequestParam(value="startpage", defaultValue="1")int startpage,
		@RequestParam(value="state", defaultValue="계약off")String state,
		@RequestParam(value="m_value", defaultValue="address")String m_value,
		@RequestParam(value="coo", defaultValue="no")String coo
		
)throws Exception {
	
	ModelAndView mv = new ModelAndView();
	
	Map map = new HashMap();

   int paging = 0;
   int endpage = 1;
   int pagecount = 0;
   int pagelist = 10;
 
   map.put("state", state);
   
   startpage = startpage + Nextpage;
   pagelist = startpage-1 + 10;
   paging = (currentpage-1)*13;
   
	map.put("ListOption", ListOption);
	pagecount = boardService.getObfect_Count(map);
	
	if(pagecount % 13 == 0) {
		endpage = pagecount / 13;
	}
	if(pagecount % 13 != 0) {
		endpage = (pagecount / 13)+1;
	}

	map.put("paging", paging);
	map.put("countpage", 13);
	
	List<Object_List> object_list = boardService.getObject_List(map);
	List <ob_select_dong_list> dong_list = boardService.dong_list(map);
		
	mv.addObject("m_value", m_value);
	mv.addObject("state", state);
	mv.addObject("dong_list", dong_list);
	mv.addObject("list_filter", list_filter);
	mv.addObject("pagelist", pagelist);
	mv.addObject("startpage", startpage);
	mv.addObject("endpage", endpage);
	mv.addObject("address", address);
	mv.addObject("py_m2", py_m2);
	mv.addObject("object_list", object_list);
	mv.addObject("S_Title", S_Title);
	mv.addObject("Tel", Tel);
	mv.addObject("currentpage", currentpage);
	mv.addObject("coo", coo);
	mv.setViewName("sec/object_list");
	
	
	
	mv.addObject("ListOption", ListOption);
	return mv;
}
	
	



@RequestMapping(value="sublist")
@ResponseBody 
public Map<String, Object> SubList(
		@RequestParam(value="s_address")String s_address,
		@RequestParam(value="state", defaultValue="계약off")String state,
		@RequestParam(value="b_address")String b_address
		
		
		)throws Exception{
	
	String AC_Name = "sublist";
	Map map = new HashMap();
	map.put("AC_Name", AC_Name);
	map.put("state", state);
	map.put("s_address", s_address);
	map.put("b_address", b_address);
	
	List<Object_List> sublist = boardService.getSubList(map);
	
	HashMap<String, Object> result = new HashMap<String, Object>();
	
	
	result.put("listkey", sublist);
	

	return result;
}



@RequestMapping(value="filter", method=RequestMethod.GET)
public ModelAndView filter(
		Filter_param filter_param,
		@RequestParam(value="list_filter", defaultValue="no")String list_filter,
		@RequestParam(value="currentpage", defaultValue= "1")int currentpage,
		@RequestParam(value="address", defaultValue="도로명")String address,
		@RequestParam(value="py_m2", defaultValue="m2")String py_m2,
		@RequestParam(value="Nextpage", defaultValue= "0")int Nextpage,
		@RequestParam(value="S_Title", defaultValue="0")int S_Title,
		@RequestParam(value="startpage", defaultValue="1")int startpage,
		@RequestParam(value="state", defaultValue="계약off")String state,
		@RequestParam(value="m_value", defaultValue="address")String m_value,
		@RequestParam(value="C_tel", defaultValue="0")String Tel
		)throws Exception{
		ModelAndView mv = new ModelAndView();
		String kind = "";
		Map map = new HashMap();
	
		   int paging = 0;
		   int endpage = 1;
		   int pagecount = 0;
		   int pagelist = 10;
		
		   startpage = startpage + Nextpage;
		   pagelist = startpage-1 + 10;
		   paging = (currentpage-1)*13;
		   
		   map.put("fileter", filter_param);
		   map.put("form", filter_param.getForm());
		   map.put("floor", filter_param.getFloor());
		   map.put("state", state);
				
		pagecount = boardService.getObfect_filter_Count(map);

			if(pagecount % 13 == 0) {
				
				endpage = pagecount / 13;
			}
			if(pagecount % 13 != 0) {
				endpage = (pagecount / 13)+1;
			}
			
			map.put("paging", paging);
			map.put("countpage", 13);
		
		List<Object_List> filter = boardService.get_filter_List(map);
		List <ob_select_dong_list> dong_list = boardService.dong_list(map);
		
	
		mv.addObject("dong_list", dong_list);
		mv.addObject("state", state);
		mv.addObject("m_value", m_value);
		mv.addObject("kind", filter_param.getKind());
		mv.addObject("form", filter_param.getForm());
		mv.addObject("dong", filter_param.getDong());
		mv.addObject("floor", filter_param.getFloor());
		mv.addObject("m2_min", filter_param.getM2_min());
		mv.addObject("m2_max", filter_param.getM2_max());
		mv.addObject("deposit_min", filter_param.getDeposit_min());
		mv.addObject("deposit_max", filter_param.getDeposit_max());
		mv.addObject("month_min", filter_param.getMonth_min());
		mv.addObject("month_max", filter_param.getMonth_max());
		mv.addObject("premium_min", filter_param.getPremium_min());
		mv.addObject("premium_max", filter_param.getPremium_max());
		mv.addObject("mcost_min", filter_param.getMcost_min());
		mv.addObject("mcost_max", filter_param.getMcost_max());
				
		mv.addObject("currentpage", currentpage);
		mv.addObject("filter_param", filter_param);
		mv.addObject("list_filter", list_filter);
		mv.addObject("pagelist", pagelist);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("address", address);
		mv.addObject("py_m2", py_m2);
		mv.addObject("object_list", filter);
		mv.addObject("S_Title", S_Title);
		mv.addObject("Tel", Tel);
		
		
		if("원룸".equals(filter_param.getKind())) {
			kind = "OneRoom";
		}
		if("2룸".equals(filter_param.getKind())) {
			kind = "TwoRoom";
		}
		if("3룸".equals(filter_param.getKind())) {
			kind = "ThreeRoom";
		}
		if("오피스텔".equals(filter_param.getKind())) {
			kind = "Officetel";
		}
		if("아파트".equals(filter_param.getKind())) {
			kind = "Apartment";
		}
		if("빌라".equals(filter_param.getKind())) {
			kind = "Villa";
		}
		if("상가".equals(filter_param.getKind())) {
			kind = "Shop";
		}
		if("상가+주택".equals(filter_param.getKind())) {
			kind = "Shop_House";
		}
		mv.addObject("ListOption", kind);
		mv.setViewName("sec/object_list");
		
		return mv;
} 


@RequestMapping(value="object_insert")
public ModelAndView listview(
		@ModelAttribute(value="file_LIst")file_LIst files, 
		Object_List_file OLF) 
				throws Exception {
	ModelAndView mv = new ModelAndView();
	Map map = new HashMap();
	
	Object_List_file ob_list = null;
	
	/*	OLF.getObject_List_file().get(0).getOB_B_Address();	*/
	for(int i = 0; i < OLF.getObject_List_file().size(); i++ ) {
	
	ob_list = OLF.getObject_List_file().get(i);	
	map.put("OB_List", ob_list);
			
	Date date = new Date();
	boardService.insert_Object_List(map);
	int OBF_Num;
	int LastNum;
	LastNum = boardService.getObfect_last_List(map);
	
	Iterator<MultipartFile> it = files.getFile_LIst().get(i).getFiles().iterator();
	
	while(it.hasNext()){
		MultipartFile file = it.next();
		currentTime = (int) System.currentTimeMillis();
		filename = file.getOriginalFilename();
		uploadFileName = currentTime + filename; 	
		imgWidth = new ImageIcon(filename).getImage().getWidth(null);
		imgHeight = new ImageIcon(filename).getImage().getHeight(null);
		fileSize = file.getSize();
		OBF_Num = +1;
		
		map.put("filename", filename);
		map.put("uploadFileName", uploadFileName);
		map.put("imgWidth", imgWidth);
		map.put("imgHeight", imgHeight);
		map.put("fileSize", fileSize);
		map.put("LastNum", LastNum);
		map.put("date", date);
		map.put("OBF_Num", OBF_Num);
		
		
		if(filename != "") {
		boardService.insert_Obfiles(map);
		}
		File uploadfile = new File(servletContext.getRealPath("/") + SAVE_PATH +uploadFileName);
		
		try {
			if(filename.length()>0)
				
				file.transferTo(uploadfile);
		
	} catch (Exception e) {
		e.printStackTrace();
	}		
		cont +=1;
	}
	
	}
	
	mv.addObject("view", "object_write");
	mv.setViewName("popup/success");
	
	
	return mv;
}



@RequestMapping(value="object_view_data")
@ResponseBody 
public Map<String, Object> object_view_data_t(
		@RequestParam(value="ob_Num")String ob_num,
		@RequestParam(value="ob_kind")String ob_kind,
		@RequestParam(value="ob_type", defaultValue="No_Type")String ob_type,
		@RequestParam(value="ob_b_addr", defaultValue="0")String ob_b_addr,
		@RequestParam(value="ob_s_addr", defaultValue="0")String ob_s_addr
		)throws Exception{

	String AC_Name = "ob_view";
	String file_k = "ob";
	List<file_path> ob_file = null;
	Map map = new HashMap();
	if(ob_type == "") {ob_type = "No_Type";}
	
	map.put("OB_Num", ob_num);
	map.put("ob_type", ob_type);
	map.put("AC_Name", AC_Name);
	map.put("ob_b_addr", ob_b_addr);
	map.put("ob_s_addr", ob_s_addr);

	ob_file = boardService.getFile_List(map);
	int ob_size = ob_file.size();

	if(ob_size == 0){
		String bl_num = BuildingService.select_bl_num_img(map);
		map.put("BL_Num", bl_num);
		ob_file = BuildingService.get_bl_file_img(map);		
	}
	HashMap<String, Object> result = new HashMap<String, Object>();
	result.put("ob_file", ob_file);
	return result;
}




@RequestMapping(value="delete_object")
@ResponseBody 
public String Delete_object_list(
		@RequestParam(value="test", defaultValue="0")String test[]
		)throws Exception{
		
		Map map = new HashMap();
	
		for(int i = 0; i < test.length; i++) {
			map.put("OB_Num", test[i]);
			boardService.delete_object(map);
			
			map.put("kind", "object");
			map.put("del_num", test[i]);
			stroageService.delete_Storage(map);
			CustomerService.delete_customer_storage(map);
			
		}
	
	
	return "ok";
}

@RequestMapping(value="update_state", method=RequestMethod.GET)
@ResponseBody
public String update_state(
		@RequestParam(value="test", defaultValue="0")String test[],
		@RequestParam(value="State", defaultValue="0")String State
		)throws Exception{
	
		Map map = new HashMap();
	

		for(int i = 0; i < test.length; i++) {
			map.put("State", State);
			map.put("OB_Num", test[i]);
			boardService.update_ob_state(map);
/*			stroageService.update_S_State(map);
			CustomerService.update_CS_State(map);*/
		}
		
	
	
		return "ok";
	}


	@RequestMapping(value="object_update", method=RequestMethod.GET)
	public ModelAndView object_update(
			Object_List object
			)throws Exception{
		Map map = new HashMap();
		ModelAndView mv = new ModelAndView();
		int OB_Num = object.getOB_Num();

		
		map.put("object", object);
		map.put("OB_Num", OB_Num);
		boardService.update_object(map);
/*		stroageService.update_object(map);
		CustomerService.update_c_object(map);*/
	
		
		mv.addObject("view", "object_update");
		mv.setViewName("popup/success");
		
		return mv;
	}
	
	
	@RequestMapping(value="update_form", method=RequestMethod.GET)
	@ResponseBody 
	public Map<String, Object> update_form(
			@RequestParam(value="Ob_num", defaultValue="0")int Ob_num
			)throws Exception{
		
		Map map = new HashMap();
		HashMap<String, Object> result = new HashMap<String, Object>();
		map.put("OB_Num", Ob_num);
		map.put("AC_Name", "ob_view");
		Object_List object = boardService.getbo_View(map);
		
		result.put("object", object);
		
		return result;
	}
	
	@RequestMapping(value="view_form", method=RequestMethod.GET) 
	public ModelAndView view_form(
			@RequestParam(value="Ob_num", defaultValue="0")int Ob_num
			)throws Exception{
		ModelAndView mv = new ModelAndView();

		Map map = new HashMap();
		map.put("OB_Num", Ob_num);
		map.put("AC_Name", "ob_view");
		Object_List object = boardService.getbo_View(map);
		
		
		mv.addObject("object", object);
		mv.setViewName("popup/object_view");
		
		return mv;
	}
	
	
	@RequestMapping(value="ob_img_add", method=RequestMethod.POST)
	public ModelAndView ob_img_add(
			@RequestParam(value="files")List<MultipartFile> files,
			@RequestParam(value="ob_num", defaultValue="0")int OB_Num
			) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap();

		
		
		String uploadFileName = "";
		String filename = "";
		long fileSize = 0;
		int imgWidth = 0;
		int imgHeight = 0;
		int fileindex = 0;
		int currentTime = 0;
		int OBF_Num;
		int cont = 0;
		map.put("ob_num", OB_Num);
		try {
			OBF_Num = boardService.get_obf_num(map);
			System.out.println("num:"+OBF_Num);
		} catch (NullPointerException e) {
			OBF_Num = 0;
		}
			
		
		Date date = new Date();

		
	/*	Iterator<MultipartFile> it = OLF.getObject_List_file().get(i).getfilename().iterator();*/
		Iterator<MultipartFile> it = files.iterator();
			
		while(it.hasNext()) {
			MultipartFile file = it.next();
			currentTime = (int) System.currentTimeMillis();
			filename = file.getOriginalFilename();
			uploadFileName = currentTime + filename; 	
			imgWidth = new ImageIcon(filename).getImage().getWidth(null);
			imgHeight = new ImageIcon(filename).getImage().getHeight(null);
			fileSize = file.getSize();
			OBF_Num +=1;
			
			
			map.put("filename", filename);
			map.put("uploadFileName", uploadFileName);
			map.put("imgWidth", imgWidth);
			map.put("imgHeight", imgHeight);
			map.put("fileSize", fileSize);

			map.put("LastNum", OB_Num);
			map.put("date", date);

			map.put("OBF_Num", OBF_Num);
			

			boardService.insert_Obfiles(map);
			
			File uploadfile = new File(servletContext.getRealPath("/") + SAVE_PATH +uploadFileName);
			
			try {
				if(filename.length()>0)
					
					file.transferTo(uploadfile);
			
		} catch (Exception e) {
			e.printStackTrace();
		}		
			cont +=1;
		}
		
		mv.addObject("view", "add_img");
		mv.addObject("ob_num", OB_Num);
		mv.setViewName("popup/success");
	
		return mv;
	}
	

	
	@RequestMapping(value="add_img")
	public ModelAndView object_add_img_form(
			@RequestParam(value="ob_num") int ob_num
			) throws Exception {
		
		ModelAndView mv = new ModelAndView();
		

		mv.setViewName("popup/object_img_add");
		mv.addObject("ob_num", ob_num);
		
		return mv;
	}

}

	