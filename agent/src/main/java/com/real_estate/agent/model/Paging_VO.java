package com.real_estate.agent.model;

public class Paging_VO {
	   
	   
	   int currentpage =1; // 현재 페이지
	   int startpage = 1;    // 시작페이지
	   int endpage;         // 마지막 페이지    
	   int total_list;      // 총 매물의 개수 
	   int lastpage;        // 끝 페이지
	   int start;               // DB 접근 매개변수용(시작 Row)
	   int end;                // DB 접근 매개변수용(마지막 Row)
	   int list_number = 13;   // 페이지 당 매물 수
	   int page_list = 10;     // 한 화면에 나타나는 페이지 개수 
	   int Nextpage = 0;
	   
	   public Paging_VO() {
	      super();
	      
	   }
	   
	   public void Paging_P() {
	      setCurrentpage(currentpage);
	      setTotal_list(currentpage);
	      calstart(currentpage);
	      calstart_endpage(startpage, total_list);
	      
	      
	      if(Nextpage > 0) {
	         setStartpage(startpage+Nextpage);
	      }
	      else if(Nextpage < 0) {
	         setStartpage(startpage-Nextpage);
	      }
	      else {
	         setStartpage(startpage);
	      }
	      callastpage(this.startpage);
	      
	   }
	   
	   // mysql에서 찾을 Row데이터의 시작 위치
	   public void calstart(int currentpage) {
	      start = (currentpage-1)*list_number;
	      System.out.println("start실행");
	   }
	   // 현재 위치하고 있는 페이지의 시작과 끝 페이지 넘버 
	   public void calstart_endpage(int startpage, int total_list) {
	      System.out.println("endpage실행");
	      startpage = startpage + page_list;
	      
	      if(total_list % 13 == 0) {                 
	         setEndpage(total_list / 13);             
	      }
	      if(total_list % 13 != 0) {
	         setEndpage((total_list / 13)+1);
	      } 
	      
	   }
	   
	   public void callastpage(int startpage) {
	      System.out.println("last실행");
	      setLastpage(startpage-1 + 10);
	      
	   }
	   
	   
	   public int getCurrentpage() {
	      return currentpage;
	   }
	   public void setCurrentpage(int currentpage) {
	      System.out.println("set_C실행");
	      this.currentpage = currentpage;
	   }
	   public int getStartpage() {
	      return startpage;
	   }
	   public void setStartpage(int startpage) {
	      this.startpage = startpage;
	   }
	   public int getEndpage() {
	      return endpage;
	   }
	   public void setEndpage(int endpage) {
	      this.endpage = endpage;
	   }
	   public int getTotal_list() {
	      return total_list;
	   }
	   public void setTotal_list(int total_list) {
	      System.out.println("total");
	      this.total_list = total_list;
	   }
	   public int getLastpage() {
	      return lastpage;
	   }
	   public void setLastpage(int lastpage) {
	      this.lastpage = lastpage;
	   }
	   public int getStart() {
	      return start;
	   }
	   public void setStart(int start) {
	      this.start = start;
	   }
	   public int getEnd() {
	      return end;
	   }
	   public void setEnd(int end) {
	      this.end = end;
	   }
	   
	   public void setList_number(int list_number) {
	      this.list_number = list_number;
	   }
	   
	   public int getList_number() {
	      return list_number;
	   }
		public int getNextpage() {
			return Nextpage;
		}
		public void setNextpage(int nextpage) {
			Nextpage = nextpage;
		}

	}