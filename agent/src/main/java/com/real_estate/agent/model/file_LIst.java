package com.real_estate.agent.model;

import java.text.SimpleDateFormat;



import java.util.List;

import org.springframework.web.multipart.MultipartFile;



public class file_LIst {
		
	private List<file_LIst> file_LIst;
	

	public List<file_LIst> getFile_LIst() {
		return file_LIst;
	}
	public void setFile_LIst(List<file_LIst> file_LIst) {
		this.file_LIst = file_LIst;
	}

	private List<MultipartFile> files;

	public List<MultipartFile> getFiles() {
		return files;
	}

	public void setFiles(List<MultipartFile> files) {
		this.files = files;
	}
	
	

	
	
	
	




}
