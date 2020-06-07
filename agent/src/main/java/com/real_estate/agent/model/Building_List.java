package com.real_estate.agent.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Building_List {
	int rowNum;
	private String BL_Name; /* �ǹ��� */
	private String BL_B_Address; /* ������ */
	private String BL_S_Address; /* ���θ� */
	private String BL_Use; /* �ǹ��뵵 */
	private String BL_Parking; /* ���� */
	private String BL_Violation; /* ���ݰ��๰ */
	private String BL_Land_Purpose; /* ���� */
	private String BL_Use_District; /* �뵵���� */
	private String BL_Specific_Use; /* �뵵���� */
	private String BL_Road; /* �������� */
	private String BL_Content; /* Ư�̻��� */
	private String BL_Tel; /* ��ȭ��ȣ */
	private String BL_Elevator; /* ���������� */
	
	private int BL_Num; /* ��ȣ */
	private String BL_Completion_Year; /* �ذ����� */
	private String BL_Surface; /* ������� */
	private String BL_Floor_Area_Ratio; /* ������ */
	private String BL_Building_Ratio; /* ������ */
	private String BL_Total_Floor; /* ���� */
	private String BL_N_of_H; /* ����� */
	private String BL_Plottage; /* �������� */
	private String BL_Total_area; /* ������ */
	
	private String BL_Remodeling; /* ���𵨸� */
	private String BL_Structure;  /* ���� */
	private String BL_Floor_use; /* �����뵵 */
	private String BL_dong; /* �� */
	private String BL_Climatisation; /* �ó��� */
	private String BL_Subway; /* ����ö�� */
	
	
	public String getBL_Name() {
		return BL_Name;
	}
	public void setBL_Name(String bL_Name) {
		BL_Name = bL_Name;
	}
	public String getBL_B_Address() {
		return BL_B_Address;
	}
	public void setBL_B_Address(String bL_B_Address) {
		BL_B_Address = bL_B_Address;
	}
	public String getBL_S_Address() {
		return BL_S_Address;
	}
	public void setBL_S_Address(String bL_S_Address) {
		BL_S_Address = bL_S_Address;
	}
	public String getBL_Use() {
		return BL_Use;
	}
	public void setBL_Use(String bL_Use) {
		BL_Use = bL_Use;
	}
	public String getBL_Parking() {
		return BL_Parking;
	}
	public void setBL_Parking(String bL_Parking) {
		BL_Parking = bL_Parking;
	}
	public String getBL_Violation() {
		return BL_Violation;
	}
	public void setBL_Violation(String bL_Violation) {
		BL_Violation = bL_Violation;
	}
	public String getBL_Land_Purpose() {
		return BL_Land_Purpose;
	}
	public void setBL_Land_Purpose(String bL_Land_Purpose) {
		BL_Land_Purpose = bL_Land_Purpose;
	}
	public String getBL_Use_District() {
		return BL_Use_District;
	}
	public void setBL_Use_District(String bL_Use_District) {
		BL_Use_District = bL_Use_District;
	}
	public String getBL_Specific_Use() {
		return BL_Specific_Use;
	}
	public void setBL_Specific_Use(String bL_Specific_Use) {
		BL_Specific_Use = bL_Specific_Use;
	}
	public String getBL_Road() {
		return BL_Road;
	}
	public void setBL_Road(String bL_Road) {
		BL_Road = bL_Road;
	}
	public String getBL_Content() {
		return BL_Content;
	}
	public void setBL_Content(String bL_Content) {
		BL_Content = bL_Content;
	}
	public String getBL_Tel() {
		return BL_Tel;
	}
	public void setBL_Tel(String bL_Tel) {
		BL_Tel = bL_Tel;
	}
	public String getBL_Elevator() {
		return BL_Elevator;
	}
	public void setBL_Elevator(String bL_Elevator) {
		BL_Elevator = bL_Elevator;
	}
	public int getBL_Num() {
		return BL_Num;
	}
	public void setBL_Num(int bL_Num) {
		BL_Num = bL_Num;
	}
	public String getBL_Completion_Year() {
		return BL_Completion_Year;
	}
	public void setBL_Completion_Year(String bL_Completion_Year) {
		BL_Completion_Year = bL_Completion_Year;
	}
	public String getBL_Surface() {
		return BL_Surface;
	}
	public void setBL_Surface(String bL_Surface) {
		BL_Surface = bL_Surface;
	}
	public String getBL_Floor_Area_Ratio() {
		return BL_Floor_Area_Ratio;
	}
	public void setBL_Floor_Area_Ratio(String bL_Floor_Area_Ratio) {
		BL_Floor_Area_Ratio = bL_Floor_Area_Ratio;
	}
	public String getBL_Building_Ratio() {
		return BL_Building_Ratio;
	}
	public void setBL_Building_Ratio(String bL_Building_Ratio) {
		BL_Building_Ratio = bL_Building_Ratio;
	}
	public String getBL_Total_Floor() {
		return BL_Total_Floor;
	}
	public void setBL_Total_Floor(String bL_Total_Floor) {
		BL_Total_Floor = bL_Total_Floor;
	}
	public String getBL_N_of_H() {
		return BL_N_of_H;
	}
	public void setBL_N_of_H(String bL_N_of_H) {
		BL_N_of_H = bL_N_of_H;
	}
	public String getBL_Plottage() {
		return BL_Plottage;
	}
	public void setBL_Plottage(String bL_Plottage) {
		BL_Plottage = bL_Plottage;
	}
	public String getBL_Total_area() {
		return BL_Total_area;
	}
	public void setBL_Total_area(String bL_Total_area) {
		BL_Total_area = bL_Total_area;
	}
	public String getBL_Remodeling() {
		return BL_Remodeling;
	}
	public void setBL_Remodeling(String bL_Remodeling) {
		BL_Remodeling = bL_Remodeling;
	}
	public String getBL_Structure() {
		return BL_Structure;
	}
	public void setBL_Structure(String bL_Structure) {
		BL_Structure = bL_Structure;
	}
	public String getBL_Floor_use() {
		return BL_Floor_use;
	}
	public void setBL_Floor_use(String bL_Floor_use) {
		BL_Floor_use = bL_Floor_use;
	}
	public String getBL_dong() {
		return BL_dong;
	}
	public void setBL_dong(String bL_dong) {
		BL_dong = bL_dong;
	}
	public String getBL_Climatisation() {
		return BL_Climatisation;
	}
	public void setBL_Climatisation(String bL_Climatisation) {
		BL_Climatisation = bL_Climatisation;
	}
	public String getBL_Subway() {
		return BL_Subway;
	}
	public void setBL_Subway(String bL_Subway) {
		BL_Subway = bL_Subway;
	}
	public int getRowNum() {
		return rowNum;
	}
	public void setRowNum(int rowNum) {
		this.rowNum = rowNum;
	}
	


	
	
	

	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
}
