package com.real_estate.agent.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.runners.Parameterized.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.real_estate.agent.dao.Object_List_Service;
import com.real_estate.agent.dao.Stroage_Service;
import com.real_estate.agent.model.Object_List;
import com.real_estate.agent.model.Storage_List;

@Controller
public class StorageAction {

	
	@Autowired
	private Stroage_Service stroageService;	
	
@RequestMapping(value="storage", method=RequestMethod.GET)	
public ModelAndView registerForm(
		@RequestParam(value="Last_Title_Num", defaultValue="0")int Last_Title_Num,
		@RequestParam(value="Move", defaultValue= "none")String move
		
		)throws Exception {
	

ModelAndView mv = new ModelAndView();
int STL_Num = 0;
Map map = new HashMap();
int title_Num1 = 0;
int title_Num2 = 0;
List<Storage_List> ST_List_Top = null;
List<Storage_List> ST_List_Mid = null;
String mess = "tt";
int STL_Num2 = 0;

int STL_Min = 0;
int STL_Max = 0;

try {
STL_Max = stroageService.getStorage_Title_count(map);
System.out.println("STL_Max"+STL_Max);
} catch (NullPointerException e) {
STL_Max = 0;
}
try {
STL_Min = stroageService.getStorage_Title_count_min(map);
} catch (NullPointerException e) {
STL_Min = 0;
}


//파라미터 전송 없이 매핑되었을 떄 


	
if(Last_Title_Num == 0) {
	int i = 0;
	try {
	STL_Num = stroageService.getStorage_Title_count(map);
	} catch (NullPointerException e) {
		STL_Num = 0;
	}
/*	System.out.println("STL_Num"+STL_Num);*/
	
	if(STL_Num != 0) {
		map.put("ST_Num", STL_Num);
		ST_List_Top = stroageService.getStorage_List(map);
		map.put("ST_Num", STL_Num-1);
		title_Num1 = ST_List_Top.get(0).getS_Title();		
			try {
				ST_List_Mid = stroageService.getStorage_List(map);
				title_Num2 = ST_List_Mid.get(0).getS_Title();
				System.out.println(ST_List_Mid);
			}
			catch (IndexOutOfBoundsException e) {
			
				while (mess == "tt") {
					STL_Num--;
					map.put("ST_Num", STL_Num);
					try {
					ST_List_Mid = stroageService.getStorage_List(map);
					title_Num2 = ST_List_Mid.get(0).getS_Title();
					mess = "ff";
					System.out.println(ST_List_Mid);
					}
					catch (IndexOutOfBoundsException e2) {
						mess = "tt";
						if(STL_Num <= 0) {
							mess = "ff";
						}
					}
/*					System.out.println(STL_Num);
					System.out.println(mess);*/
				}
			}
	}

	
}





if(Last_Title_Num != 0) {
	
	int j;
	if("Next".equals(move)) {
	
		
		map.put("ST_Num", Last_Title_Num);
		ST_List_Top = stroageService.getStorage_List(map);

		map.put("ST_Num", Last_Title_Num-1);
		title_Num1 = ST_List_Top.get(0).getS_Title();	

			try {
				ST_List_Mid = stroageService.getStorage_List(map);
				title_Num2 = ST_List_Mid.get(0).getS_Title();
/*				System.out.println(ST_List_Mid);*/
			}
			catch (IndexOutOfBoundsException e) {
				while (mess == "tt") {
					Last_Title_Num--;
					map.put("ST_Num", Last_Title_Num);
					try {
					
					ST_List_Mid = stroageService.getStorage_List(map);
					title_Num2 = ST_List_Mid.get(0).getS_Title();
					mess = "ff";
	/*				System.out.println(ST_List_Mid);*/
					}
					catch (IndexOutOfBoundsException e2) {
						mess = "tt";
					}
/*					System.out.println(Last_Title_Num);
					System.out.println(mess);*/
				}

				
				

			}
		
	}



	if("Prev".equals(move)) {
		
		
		
		
		map.put("ST_Num", Last_Title_Num);
		ST_List_Mid = stroageService.getStorage_List(map);
		map.put("ST_Num", Last_Title_Num+1);
		title_Num2 = ST_List_Mid.get(0).getS_Title();
			try {
				ST_List_Top = stroageService.getStorage_List(map);
				title_Num1 = ST_List_Top.get(0).getS_Title();
			/*	System.out.println(ST_List_Top);*/
			}
			catch (IndexOutOfBoundsException e) {
				while (mess == "tt") {
					Last_Title_Num++;
					map.put("ST_Num", Last_Title_Num);
					try {
					
					ST_List_Top = stroageService.getStorage_List(map);
					title_Num1 = ST_List_Top.get(0).getS_Title();
					mess = "ff";
			/*		System.out.println(ST_List_Top);*/
					}
					catch (IndexOutOfBoundsException e2) {
						mess = "tt";
					}
		/*			System.out.println(Last_Title_Num);
					System.out.println(mess);*/
				}

				


			}
	}



}







mv.addObject("ST_List_Top", ST_List_Top);
mv.addObject("ST_List_Mid", ST_List_Mid);
mv.addObject("title_Num1", title_Num1);
mv.addObject("title_Num2", title_Num2);
mv.addObject("STL_Min", STL_Min);
mv.addObject("STL_Max", STL_Max);



mv.setViewName("sec/interest_object");


return mv;	
	
}
	
@RequestMapping(value="Storage_page", method=RequestMethod.GET) 
@ResponseBody
public String Storage_insert(
		String test[],
		@RequestParam(value="S_Title", defaultValue="0")int S_Title
		)throws Exception {	
	Map map = new HashMap();
	int ST_count = 0;
	List<Object_List> ob_List;
	
	if(S_Title != 0) {
		for(int i = 0; i < test.length; i++) {

			map.put("OB_Num", test[i]);
			/*ob_List = stroageService.getOb_list_stroage(map);*/
			map.put("S_Title", S_Title);
			stroageService.insert_Stroage(map);
		}
	}
	else {
		
	try {
		ST_count = stroageService.getStorage_Title_count(map);

	} catch (NullPointerException e) {
		ST_count = 0;
	}
	
		if(ST_count > 0) {
			ST_count ++;
		}
		else {
			ST_count = 1;
		}
	
	
	for(int i = 0; i < test.length; i++) {
/*		System.out.println("x"+i+":" +test[i]);*/
		map.put("OB_Num", test[i]);
		/*ob_List = stroageService.getOb_list_stroage(map);*/
		map.put("S_Title", ST_count);
	/*	map.put("OB_List", ob_List.get(0));*/
		stroageService.insert_Stroage(map);
	}
		
/*	System.out.println(">>>여기까지는 실행됨");*/
	
	
	}
	
	
		
	return "ok";
	

	
}



@RequestMapping(value="delete_storage", method=RequestMethod.GET)	
public String delete_Storage(
		@RequestParam(value="S_Title", defaultValue="0")int S_Title,
		@RequestParam(value="del_num", defaultValue="0")int del_num
		
		)throws Exception {
	
	Map map = new HashMap();
/*	System.out.println(S_Title);*/
	
	if(del_num == 0) {
		map.put("kind", "Storage");
		map.put("S_Title", S_Title);
		stroageService.delete_Storage(map);
	}
	else {
		map.put("kind", "Del_num");
		map.put("S_Title", S_Title);
		map.put("del_num", del_num);
		stroageService.delete_Storage(map);
	}

	

	return "redirect:storage";
}





@RequestMapping(value="add_storage", method=RequestMethod.GET)	
public String add_Storage(
		@RequestParam(value="S_Title", defaultValue="0")int S_Title
		) throws Exception{
	
		 
	
	return "redirect:list?S_Title="+S_Title;
}















}
