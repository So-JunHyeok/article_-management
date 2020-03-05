package com.real_estate.agent.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.real_estate.agent.model.Customer;
import com.real_estate.agent.model.Interest_List;
@Service
public class Customer_ServiceImpl implements Customer_Service {
	
	@Autowired
	private Customer_DaoImpl customerDao;

	@Override
	public List<Customer> getCustomer_List(Map map) throws Exception {
	
		return customerDao.getCustomer_List(map);
	}

	@Override
	public int getCustomer_count(Map map) throws Exception {
	
		return customerDao.getCustomer_count(map);
	}

	@Override
	public void Customer_insert(Map map) throws Exception {
		customerDao.Customer_insert(map);
		
	}

	@Override
	public void Delete_Customer(Map map) throws Exception {
		customerDao.Delete_Customer(map);
		
	}

	@Override
	public List<Customer> getCustomer_Search_List(Map map) throws Exception {
		return customerDao.getCustomer_Search_List(map);
	}

	@Override
	public void insert_Customer_Storage(Map map) throws Exception {
		customerDao.insert_Customer_Storage(map);
		
	}

	@Override
	public List<Interest_List> get_Customer_Storage(Map map) throws Exception {
		return customerDao.get_Customer_Storage(map);
	}

	@Override
	public void delete_customer_storage(Map map) throws Exception {
		customerDao.delete_customer_storage(map);
		
	}

	@Override
	public void update_CS_State(Map map) throws Exception {
		customerDao.update_CS_State(map);
		
	}

	@Override
	public void update_c_object(Map map) throws Exception {
		customerDao.update_c_object(map);
		
	}

	@Override
	public void update_customer(Map map) throws Exception {
		customerDao.update_customer(map);
		
	}

	@Override
	public List<Customer> select_Customer(Map map) throws Exception {
		return customerDao.select_Customer(map);
	}
}
