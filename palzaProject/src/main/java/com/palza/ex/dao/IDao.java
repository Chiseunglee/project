package com.palza.ex.dao;

import java.util.ArrayList;

import com.palza.ex.dto.infoDto;
import com.palza.ex.dto.pageMaker;
import com.palza.ex.dto.productDto;

public interface IDao {
	public void joinDao(String param1, String param2, String param3, String param4, String param5, String param6);

	public String loginDao(String param1);

	public ArrayList<productDto> productList(pageMaker paging);

	public int totalCnt(int cate_id);

	public String findid(String param1, String param2);

	public String findpwd(String param1);

	// public void additemDao(String pd_name, int price,int cate,String
	// pd_desc,String img);

	public void additemDao(productDto dto);

	public int wishCheck(String id, int pd_id);

	public productDto itemView(int pd_id);

	public infoDto customerInfo(String id);

	public infoDto modify(String param1);

	public String address(String param1);

	public void updateinfo(String param1, String param2, String param3, String param4, String param5);

	public void putWish(String name, int pd_id);

	public void backWish(String name, int pd_id);

	public productDto itemView(String id, int pd_id);

	public productDto buyItem(int pd_id);

	public ArrayList<productDto> cartItem(String id);
	
	public ArrayList<productDto> allList();

}
