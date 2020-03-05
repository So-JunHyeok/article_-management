
$(document).on("click","button[name=shop]", function(){
	var val = $("button[name=shop]").attr("value");
	var adddiv = '<div class="object_informatin_123Room" style="width: 100%;">'+
	'<table class="o_info2" style="width: 100%;">'+
		'<h5>- 상가 - </h5>'+
		'<tr>'+
		'<th>형태</th>'+
		'<td>'+
			'<select>'+
				'<option>상가</option>'+
				'<option>사무실</option>'+
				'<option>창고</option>'+
			'</select>'+				
			'<select>'+
				'<option>전세</option>'+
				'<option>월세</option>'+
			'</select>'+							
		'</td>'+	
		'<th>층수</th>'+
		'<td><input type="number" name="m_floor" min="1" max="50"></td>'+	
		'<th>보증금</th>'+
		'<td><input type="number" name="deposit" min="1" max="999999999"></td>'+
		'<th>평수</th>'+
		'<td><input type="number" name="m_space"  min="1" max="1000"></td>'+
		'<th>관리비</th>'+
		'<td><input type="number" name="m_cost" min="1" max="9999999"></td>'+
	'</tr>'+
	
	'<tr>'+
		'<th>부가세</th>'+
		'<td><input type="number" name="m_cost" min="1" max="9999999"></td>'+			
		'<th>호수</th>'+
		'<td><input type="number" name="m_ho"  min="1" max="9999"></td>'+
		'<th>월세</th>'+
		'<td><input type="number" name="monthly_rent" min="1" max="99999999"></td>'+
		'<th>m2</th>'+
		'<td><input type="number" name="m_space"  min="1" max="1000"></td>'+
		'<th>권리금</th>'+
		'<td><input type="number" name="m_cost" min="1" max="9999999"></td>'+
		
	'</tr>'+

'</table>'+	

'<table style="height: 100%;">'+
	'<tr>'+
		'<th>상세내용</th>'+
	'</tr>'+
	'<tr>'+
		'<td><input type="text" name="detail_content"></td>'+
	'</tr>'+
'</table>'+		
'</div>';

	$("#test1").append(adddiv);
});




$(document).on("click","button[name=123vao]", function(){
	
	var val = $(this).attr("value");

	var oneroom = '<select>'+
				'<option>원룸</option>'+
				'<option>1.5룸</option>'+
				'<option>분리형</option>'+
			'</select>';
	
	var ofi = '<select>'+
				'<option>오픈형</option>'+
				'<option>1.5룸</option>'+
				'<option>복층형</option>'+
			    '</select>';
	var tworoom = "2룸";
	var threeroom = "3룸"
	
		
	var artvilla = '<select>'+
	'<option>2룸</option>'+
	'<option>3룸</option>'+
	'<option>4룸</option>'+
    '</select>'; 	
		
	var nem1 = '원룸';
	var nem2 = '2룸';
	var nem3 = '3룸';
	var nem4 = '빌라';
	var nem5 = '아파트';
	var nem6 = '오피스텔';
	var nem7 = '상가';
	
	
	var nem;
	var trs;
	
	if(val == '1room'){
	trs = oneroom;	
	nem = nem1;
	}
	
	if(val == '2room'){
	trs = tworoom;
	nem = nem2;
	}
	if(val == '3room'){
		trs = threeroom;
		nem = nem3;
	}
	if(val == 'officetel'){
		trs = ofi;
		nem = nem6;
	}
	if(val == 'apartment'){
		trs = artvilla;	
		nem = nem5;
	}
	if(val == 'villa'){
		trs = artvilla;	
		nem = nem4;
	}

	
	var adddiv = '<div class="object_informatin_123Room" style="width: 100%;">'+
	'<table class="o_info2" style="width: 100%;">'+
	'<h5>-' +nem+ '-</h5>'+
		'<tr>'+
		'<th>형태</th>'+
		'<td>'+
		 trs+

			
			'<select>'+
				'<option>전세</option>'+
				'<option>월세</option>'+
			'</select>'+							
		'</td>'+	
		'<th>층수</th>'+
		'<td><input type="number" name="m_floor" min="1" max="50"></td>'+	
		'<th>보증금</th>'+
		'<td><input type="number" name="deposit" min="1" max="999999999"></td>'+
		'<th>평수</th>'+
		'<td><input type="number" name="m_space"  min="1" max="1000"></td>'+				

	'</tr>'+
	
	'<tr>'+
		'<th>관리비</th>'+
		'<td><input type="number" name="m_cost" min="1" max="9999999"></td>'+			
		'<th>호수</th>'+
		'<td><input type="number" name="m_ho"  min="1" max="9999"></td>'+
		'<th>월세</th>'+
		'<td><input type="number" name="monthly_rent" min="1" max="99999999"></td>'+
		'<th>m2</th>'+
		'<td><input type="number" name="m_space"  min="1" max="1000"></td>'+												
	'</tr>'+

'</table>'+	

'<table style="height: 100%;">'+
	'<tr>'+
		'<th style="width: 100%;">상세내용</th>'+
	'</tr>'+
	'<tr>'+
		'<td  style="width: 100%;"><input type="text" name="detail_content"></td>'+
	'</tr>'+
'</table>'+		
'</div>';

	$("#test2").append(adddiv);

});




$(document).on("click","button[name=mama]", function(){

	var val = $(this).attr("value");

	
	


	
	var adddiv = '<div class="object_informatin_123Room" style="width: 100%;">'+
	'<table class="o_info2" style="width: 100%;">'+
		'<tr>'+
		'<th>형태</th>'+
		'<td>'+	
			'<select>'+
				'<option>주택</option>'+
				'<option>빌라</option>'+
				'<option>아파트</option>'+
				'<option>오피스텔</option>'+
				'<option>상가</option>'+
				'<option>상가/주택</option>'+
			'</select>'+		

		'</td>'+	
		'<th>층수</th>'+
		'<td><input type="number" name="m_floor" min="1" max="50"></td>'+	
		'<th>보증금</th>'+
		'<td><input type="number" name="deposit" min="1" max="999999999"></td>'+
		'<th>평수</th>'+
		'<td><input type="number" name="m_space"  min="1" max="1000"></td>'+
		'<th>관리비</th>'+
		'<td><input type="number" name="m_cost" min="1" max="9999999"></td>'+

	'</tr>'+
	
	'<tr>'+
		'<th>매-보증</th>'+
		'<td><input type="number" name="m_cost" min="1" max="9999999"></td>'+			
		'<th>호수</th>'+
		'<td><input type="number" name="m_ho"  min="1" max="9999"></td>'+
		'<th>월세</th>'+
		'<td><input type="number" name="monthly_rent" min="1" max="99999999"></td>'+
		'<th>m2</th>'+
		'<td><input type="number" name="m_space"  min="1" max="1000"></td>'+	
		'<th>매매가</th>'+
		'<td><input type="number" name="m_cost" min="1" max="9999999"></td>	'+
		
	'</tr>'+

'</table>'+	

'<table style="height: 100%;">'+
	'<tr>'+
		'<th style="width: 100%;">상세내용</th>'+
	'</tr>'+
	'<tr>'+
		'<td style="width: 100%;"><input type="text" name="detail_content"></td>'+
	'</tr>'+
'</table>'+		
'</div>';

	$("#test3").append(adddiv);

});	
	
