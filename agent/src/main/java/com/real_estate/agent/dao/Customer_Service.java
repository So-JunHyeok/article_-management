package com.real_estate.agent.dao;

import java.util.List;
import java.util.Map;

import com.real_estate.agent.model.Customer;
import com.real_estate.agent.model.Interest_List;

public interface Customer_Service {
	
	public List<Customer> getCustomer_List(Map map)throws Exception;
	public int getCustomer_count(Map map)throws Exception;
	public void Customer_insert(Map map)throws Exception;
	public void Delete_Customer(Map map) throws Exception;
	public List<Customer> getCustomer_Search_List(Map map) throws Exception;
	public void insert_Customer_Storage(Map map) throws Exception;
	public List<Interest_List>get_Customer_Storage(Map map) throws Exception;
	public void delete_customer_storage(Map map) throws Exception;
	public void update_CS_State(Map map) throws Exception;
	public void update_c_object(Map map) throws Exception;
	public void update_customer(Map map) throws Exception;
	public List<Customer>select_Customer(Map map) throws Exception;

}
