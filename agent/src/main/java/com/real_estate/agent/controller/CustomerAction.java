package com.real_estate.agent.controller;

import java.util.Date;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.real_estate.agent.dao.Customer_Service;
import com.real_estate.agent.dao.Object_List_Service;
import com.real_estate.agent.dao.Stroage_Service;
import com.real_estate.agent.model.Building_List;
import com.real_estate.agent.model.Building_file_list;
import com.real_estate.agent.model.Customer;
import com.real_estate.agent.model.Interest_List;
import com.real_estate.agent.model.Object_List;
import com.real_estate.agent.model.Storage_List;

@Controller
public class CustomerAction {
	
@Autowired
private Customer_Service CustomerService;

@Autowired
private Stroage_Service stroageService;	

@Autowired
private Object_List_Service boardService;

Date date = new Date();
	@RequestMapping(value="customer", method=RequestMethod.GET)
	public ModelAndView customer(
			@RequestParam(value="py_m2", defaultValue="m2")String py_m2,
			@RequestParam(value="currentpage", defaultValue= "1")int currentpage,
			@RequestParam(value="Nextpage", defaultValue= "0")int Nextpage,
			@RequestParam(value="modify", defaultValue= "no")String modify
			)throws Exception {
		
		ModelAndView mv = new ModelAndView();
		
		Map map = new HashMap();
		   //페이지 시작
		   int paging = 0;
		   // 페이징 넘버 시작
		   int startpage = 1;
		   //
		  
		   int endpage = 1;
		   
		   // 총 페이지 개수(마지막 페이지 개수) 
		   int pagecount = 0;
		   // 페이지 나를 나는 개수 
		   int pagelist = 10;
		   // 
		   
		   startpage = startpage + Nextpage;
		   pagelist = startpage-1 + 10;
		   paging = (currentpage-1)*13;
		   		
			pagecount = CustomerService.getCustomer_count(map);
			
			if(pagecount % 13 == 0) {
				endpage = pagecount / 13;
			}
			if(pagecount % 13 != 0) {
				endpage = (pagecount / 13)+1;
			}
	
			map.put("paging", paging);
			map.put("countpage", 13);
			List<Customer> object_list = CustomerService.getCustomer_List(map);
			
						
			mv.addObject("pagelist", pagelist);
			mv.addObject("startpage", startpage);
			mv.addObject("endpage", endpage);
			mv.addObject("modify", modify);
			mv.addObject("object_list", object_list);
			mv.setViewName("sec/customer");
			
			
		return mv;
	}	
	
	
	@RequestMapping(value="Insert_customer")
	@ResponseBody
	public String Insert_customer(
		 @ModelAttribute("queryString")Customer CT
			)throws Exception {
		String Tel ="yes";

		Tel = CT.getC_Tel();

				
				
		if(Tel != "") {
		Map map = new HashMap();
		map.put("Customer", CT);
		CustomerService.Customer_insert(map);
/*		System.out.println("성공");*/
		}
		else {
/*			System.out.println("실패");*/
		}
		

	
	return "ok";
	}
	
	
	@RequestMapping(value="update_customer")
	@ResponseBody
	public String update_customer(
		 @ModelAttribute("queryString")Customer CT
			)throws Exception {
		String Tel ="yes";

		Tel = CT.getC_Tel();

		if(Tel != "") {
		Map map = new HashMap();
		map.put("Customer", CT);
		map.put("Tel", Tel);
		CustomerService.update_customer(map);
/*		System.out.println("성공");*/
		}
		else {
		/*	System.out.println("실패");*/
		}
		

	
	return "ok";
	}
	
		
	@RequestMapping(value="delete_customer", method=RequestMethod.GET)
	public String delete_customer(
			@RequestParam(value="C_Num", defaultValue="0")int C_Num
			)throws Exception {
		Map map = new HashMap();
			map.put("C_Num", C_Num);
			CustomerService.Delete_Customer(map);
	
	
	
	
	return "redirect:customer";
	}
	
	
	@RequestMapping(value="search_customer", method=RequestMethod.GET)
	public ModelAndView search_customer(
			@RequestParam(value="search", defaultValue="")String search,
			@RequestParam(value="search_option", defaultValue="")String search_option
			)throws Exception {

		ModelAndView mv = new ModelAndView();
		
		Map map = new HashMap();
	
		map.put("search_option", search_option);
		map.put("search", search);
		List<Customer> object_list = CustomerService.getCustomer_Search_List(map);
		mv.addObject("object_list", object_list);
		mv.setViewName("sec/customer");
		
		return mv;
		
	}
	
	@RequestMapping(value="customer_interest", method=RequestMethod.GET)
	public String insert_C_interest(
			@RequestParam(value="tel", defaultValue="010-0000-0000")String tel,
			@RequestParam(value="title", defaultValue="0")int title
		

			)throws Exception{
			Map map = new HashMap();
			
			int count = 0;
			
			map.put("ST_Num", title);
			map.put("CS_Tel", tel);
			
			List<Storage_List> S_List = stroageService.getStorage_List(map);
			count = stroageService.getStorage_List_Count(map);
			String kind = "Storage";
			
			
			map.put("kind", kind);
			
			
			for(int i = 0; i < count; i++) {
			map.put("OB_Num", S_List.get(i).getOB_Num());
/*			map.put("CS_Time", date);*/
			CustomerService.insert_Customer_Storage(map);	
			}
			
			
			map.put("S_Title", title);
			stroageService.delete_Storage(map);

		
			
		return "redirect:customer";
	}
	
	
	
	
	@RequestMapping(value="New_insert_C_interest", method=RequestMethod.GET)
	public @ResponseBody String New_insert_C_interest(Customer customer,
	@RequestParam(value="Title", defaultValue="0")int title

		
			)throws Exception{
	
		int count = 0;
		Map map = new HashMap();
		
		map.put("Customer", customer);
		CustomerService.Customer_insert(map);
		
		
/*		System.out.println(title);*/
		
		map.put("ST_Num", title);
		map.put("CS_Tel", customer.getC_Tel());
		
		List<Storage_List> S_List = stroageService.getStorage_List(map);
/*		System.out.println("1");*/
		count = stroageService.getStorage_List_Count(map);
		String kind = "Storage";
		
		
		
		map.put("kind", kind);
		
		for(int i = 0; i < count; i++) {
		map.put("OB_Num", S_List.get(i).getOB_Num());
	/*	map.put("CS_Time", date);*/
		CustomerService.insert_Customer_Storage(map);	
/*		System.out.println("2");*/
		}
		
		
		map.put("S_Title", title);
		stroageService.delete_Storage(map);
/*		System.out.println("3");*/
		
		
		
		return "redirect:customer";
		
		
	}
	
	@RequestMapping(value="customer_interest_add", method=RequestMethod.GET)
	@ResponseBody
	public String insert_C_add(
			@RequestParam(value="test", defaultValue="0")String test[],
			@RequestParam(value="tel", defaultValue="0")String tel
			)throws Exception{
		String kind = "object";
		Map map = new HashMap();
		List<Object_List> ob_List;
		if(tel != "0") {
			for(int i = 0; i < test.length; i++) {
		
				map.put("OB_Num", test[i]);
				/*ob_List = stroageService.getOb_list_stroage(map);*/

			/*	map.put("S_List", ob_List.get(0));*/
				map.put("CS_Tel", tel);
				map.put("kind", "object");
				CustomerService.insert_Customer_Storage(map);	
			}
		}
		
		return "ok";
	}
	
	
	
	
	
	
	
	@RequestMapping(value="customer_interest_view", method=RequestMethod.GET)
	public ModelAndView insert_C_interest_view(
			@RequestParam(value="C_tel", defaultValue="010-0000-0000")String C_tel
			)throws Exception{
			ModelAndView mv = new ModelAndView();
			String search_option = "tel";
			Map map = new HashMap();
			Customer customer = null;
			map.put("search", C_tel);
			map.put("search_option", search_option);
			List<Customer> object_list = CustomerService.getCustomer_Search_List(map);
			try {
				customer = object_list.get(0);
			} catch (IndexOutOfBoundsException e) {
				customer = null;
			}
			
			List<Interest_List> Interest_list = CustomerService.get_Customer_Storage(map);

			mv.setViewName("sec/Customer_interest");
			mv.addObject("Storage_Top", Interest_list);
			mv.addObject("customer", customer);
			return mv;
	}
	
	
	
	@RequestMapping(value="delete_cs", method=RequestMethod.GET)
	@ResponseBody
	public String delete_customer_storage(
			@RequestParam(value="test", defaultValue="0")String test[],
			@RequestParam(value="Tel", defaultValue="0")String Tel
			)throws Exception{
		
		Map map = new HashMap();
		for(int i = 0; i < test.length; i++) {	
		map.put("del_num", test[i]);
		map.put("kind", "del_num");
		map.put("Tel", Tel);
		CustomerService.delete_customer_storage(map);
		}
		return "ok";
	}
	
	
	@RequestMapping(value="select_form", method=RequestMethod.GET)
	public ModelAndView select_form(
			@RequestParam(value="Form", defaultValue="0")String Form
			)throws Exception{
		
		ModelAndView mv = new ModelAndView();
		Map map = new HashMap();
		map.put("C_Form", Form);
		System.out.println(Form);
		List<Customer>object_list = CustomerService.select_Customer(map);
		
		
		
		mv.addObject("object_list", object_list);
		mv.setViewName("sec/customer");
		return mv;
	}
	

	
	
}
