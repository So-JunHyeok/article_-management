package com.real_estate.agent.model;

public class Paging_VO {
	   
	   
	   int currentpage =1; // ���� ������
	   int startpage = 1;    // ����������
	   int endpage;         // ������ ������    
	   int total_list;      // �� �Ź��� ���� 
	   int lastpage;        // �� ������
	   int start;               // DB ���� �Ű�������(���� Row)
	   int end;                // DB ���� �Ű�������(������ Row)
	   int list_number = 13;   // ������ �� �Ź� ��
	   int page_list = 10;     // �� ȭ�鿡 ��Ÿ���� ������ ���� 
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
	   
	   // mysql���� ã�� Row�������� ���� ��ġ
	   public void calstart(int currentpage) {
	      start = (currentpage-1)*list_number;
	      System.out.println("start����");
	   }
	   // ���� ��ġ�ϰ� �ִ� �������� ���۰� �� ������ �ѹ� 
	   public void calstart_endpage(int startpage, int total_list) {
	      System.out.println("endpage����");
	      startpage = startpage + page_list;
	      
	      if(total_list % 13 == 0) {                 
	         setEndpage(total_list / 13);             
	      }
	      if(total_list % 13 != 0) {
	         setEndpage((total_list / 13)+1);
	      } 
	      
	   }
	   
	   public void callastpage(int startpage) {
	      System.out.println("last����");
	      setLastpage(startpage-1 + 10);
	      
	   }
	   
	   
	   public int getCurrentpage() {
	      return currentpage;
	   }
	   public void setCurrentpage(int currentpage) {
	      System.out.println("set_C����");
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