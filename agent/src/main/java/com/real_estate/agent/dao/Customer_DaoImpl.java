package com.real_estate.agent.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.real_estate.agent.model.Customer;
import com.real_estate.agent.model.Interest_List;

@Repository
public class Customer_DaoImpl {
	
	@Autowired	
	private SqlSessionTemplate sqlSession;
	
	
	

	public List<Customer> getCustomer_List(Map map) throws Exception {
			
		return sqlSession.selectList("getCustomer_List", map);
	}


	public int getCustomer_count(Map map) throws Exception {

		return sqlSession.selectOne("getCustomer_List_Count", map);
	}
	
	public void Customer_insert(Map map) throws Exception {
		sqlSession.insert("insert_Customer", map);
		
	}
	
	public void Delete_Customer(Map map) throws Exception{
		sqlSession.delete("delete_Customer", map);
	}
	
	public List<Customer> getCustomer_Search_List(Map map) throws Exception{
		return sqlSession.selectList("search_Customer", map);
	}

	public void insert_Customer_Storage(Map map) throws Exception{
			sqlSession.insert("insert_Customer_Storage", map);
	}
	
	public List<Interest_List>get_Customer_Storage(Map map) throws Exception{
		return sqlSession.selectList("get_Customer_Storage", map);
	}
	
	public void delete_customer_storage(Map map) throws Exception{
		 sqlSession.delete("delete_customer_storage", map);
	}
	public void update_CS_State(Map map) throws Exception{
		sqlSession.update("update_CS_State", map);
	}
	
	public void update_c_object(Map map) throws Exception{
		sqlSession.update("update_c_object", map);
	}
	
	public void update_customer(Map map) throws Exception{
		sqlSession.update("update_customer", map);
	}
	
	public List<Customer>select_Customer(Map map) throws Exception{
		return sqlSession.selectList("select_Form", map);
	}
	
	
}
