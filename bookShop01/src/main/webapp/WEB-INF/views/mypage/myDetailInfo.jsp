<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"
	isELIgnored="false"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html >
<html>
<head>
<meta charset="utf-8">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
 <script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('roadAddress').value = fullRoadAddr;
                document.getElementById('jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }

   
   window.onload=function()
    {
      selectBoxInit();
    }

    function selectBoxInit(){
    
     var tel1='${memberInfo.tel1 }';
     var hp1='${memberInfo.hp1}';
     var selTel1 = document.getElementById('tel1');
     var selHp1 = document.getElementById('hp1');
     var optionTel1 = selTel1.options;
     var optionHp1 = selHp1.options;
     var val;
     for(var i=0; i<optionTel1.length;i++){
       val = optionTel1[i].value;
       if(tel1 == val){
    	   optionTel1[i].selected= true;
        break;
       }
     }  
     
     for(var i=0; i<optionHp1.length;i++){
         val = optionHp1[i].value;
         if(hp1 == val){
        	 optionHp1[i].selected= true;
          break;
         }
       } 
     
   }


function fn_modify_member_info(attribute){
	var value;
	// alert(member_id);
	// alert("mod_type:"+mod_type);
		var frm_mod_member=document.frm_mod_member;
		if(attribute=='member_pw'){
			value=frm_mod_member.member_pw.value;
			//alert("member_pw:"+value);
		}else if(attribute=='member_gender'){
			var member_gender=frm_mod_member.member_gender;
			for(var i=0; member_gender.length;i++){
			 	if(member_gender[i].checked){
					value=member_gender[i].value;
					break;
				} 
			}
			
		}else if(attribute=='member_birth'){
			var member_birth_y=frm_mod_member.member_birth_y;
			var member_birth_m=frm_mod_member.member_birth_m;
			var member_birth_d=frm_mod_member.member_birth_d;
			var member_birth_gn=frm_mod_member.member_birth_gn;
			
			for(var i=0; member_birth_y.length;i++){
			 	if(member_birth_y[i].selected){
					value_y=member_birth_y[i].value;
					break;
				} 
			}
			for(var i=0; member_birth_m.length;i++){
			 	if(member_birth_m[i].selected){
					value_m=member_birth_m[i].value;
					break;
				} 
			}
			
			for(var i=0; member_birth_d.length;i++){
			 	if(member_birth_d[i].selected){
					value_d=member_birth_d[i].value;
					break;
				} 
			}
			
			//alert("수정 년:"+value_y+","+value_m+","+value_d);
			for(var i=0; member_birth_gn.length;i++){
			 	if(member_birth_gn[i].checked){
					value_gn=member_birth_gn[i].value;
					break;
				} 
			}
			//alert("생년 양음년 "+value_gn);
			value=+value_y+","+value_m+","+value_d+","+value_gn;
		}else if(attribute=='tel'){
			var tel1=frm_mod_member.tel1;
			var tel2=frm_mod_member.tel2;
			var tel3=frm_mod_member.tel3;
			
			for(var i=0; tel1.length;i++){
			 	if(tel1[i].selected){
					value_tel1=tel1[i].value;
					break;
				} 
			}
			value_tel2=tel2.value;
			value_tel3=tel3.value;
			value=value_tel1+","+value_tel2+", "+value_tel3;
		}else if(attribute=='hp'){
			var hp1=frm_mod_member.hp1;
			var hp2=frm_mod_member.hp2;
			var hp3=frm_mod_member.hp3;
			var smssts_yn=frm_mod_member.smssts_yn;
			
			for(var i=0; hp1.length;i++){
			 	if(hp1[i].selected){
					value_hp1=hp1[i].value;
					break;
				} 
			}
			value_hp2=hp2.value;
			value_hp3=hp3.value;
			value_smssts_yn=smssts_yn.checked;
			value=value_hp1+","+value_hp2+", "+value_hp3+","+value_smssts_yn;
		}else if(attribute=='email'){
			var email1=frm_mod_member.email1;
			var email2=frm_mod_member.email2;
			var emailsts_yn=frm_mod_member.emailsts_yn;
			
			value_email1=email1.value;
			value_email2=email2.value;
			value_emailsts_yn=emailsts_yn.checked;
			value=value_email1+","+value_email2+","+value_emailsts_yn;
			//alert(value);
		}else if(attribute=='address'){
			var zipcode=frm_mod_member.zipcode;
			var roadAddress=frm_mod_member.roadAddress;
			var jibunAddress=frm_mod_member.jibunAddress;
			var namujiAddress=frm_mod_member.namujiAddress;
			
			value_zipcode=zipcode.value;
			value_roadAddress=roadAddress.value;
			value_jibunAddress=jibunAddress.value;
			value_namujiAddress=namujiAddress.value;
			value=value_zipcode+","+value_roadAddress+","+value_jibunAddress+","+value_namujiAddress;
		}
		console.log(attribute);
	 
		$.ajax({
			type : "post",
			async : false, //false인 경우 동기식으로 처리한다.
			url : "${contextPath}/mypage/modifyMyInfo.do",
			data : {
				attribute:attribute,
				value:value,
			},
			success : function(data, textStatus) {
				if(data.trim()=='mod_success'){
					alert("会員情報を修正しました。");
				}else if(data.trim()=='failed'){
					alert("もう一度試してください。");	
				}
				
			},
			error : function(data, textStatus) {
				alert("エラーが発生しました。"+data);
			},
			complete : function(data, textStatus) {
				//alert("작업을완료 했습니다");
				
			}
		}); //end ajax
}
</script>
</head>

<body>
	<h3>私の詳細情報</h3>
<form name="frm_mod_member">	
	<div id="detail_table">
		<table>
			<tbody>
				<tr class="dot_line">
					<td class="fixed_join">ID</td>
					<td>
					  <input type="text" name="_member_id"  id="_member_id"  size="20" />
					  <input type="hidden" name="member_id"  id="member_id" />
					  
					  <input type="button"  id="btnOverlapped" value="重複チェック" onClick="fn_overlapped()" />
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">パスワード</td>
					<td><input name="member_pw" type="password" size="20" /></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">名前</td>
					<td><input name="member_name" type="text" size="20" /></td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">性別</td>
					<td><input type="radio" name="member_gender" value="102" />
						女性<span style="padding-left:120px"></span>
						 <input type="radio" name="member_gender" value="101" checked />男性
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">生年月日</td>
					<td>
					<select name="member_birth_y">
					 
					     <c:forEach var="year" begin="1" end="100">
					       <c:choose>
					         <c:when test="${year==80}">
							   <option value="${ 1920+year}" selected>${ 1920+year} </option>
							</c:when>
							<c:otherwise>
							  <option value="${ 1920+year}" >${ 1920+year} </option>
							</c:otherwise>
							</c:choose>
					   	</c:forEach> 
							
					</select>年
					 <select name="member_birth_m" >
					   <c:forEach var="month" begin="1" end="12">
					       <c:choose>
					         <c:when test="${month==5 }">
							   <option value="${month }" selected>${month }</option>
							</c:when>
							<c:otherwise>
							  <option value="${month }">${month}</option>
							</c:otherwise>
							</c:choose>
					   	</c:forEach>
					</select>月
					<select name="member_birth_d">
							<c:forEach var="day" begin="1" end="31">
					       <c:choose>
					         <c:when test="${day==10 }">
							   <option value="${day}" selected>${day}</option>
							</c:when>
							<c:otherwise>
							  <option value="${day}">${day}</option>
							</c:otherwise>
							</c:choose>
					   	</c:forEach>
					</select>日 <span style="padding-left:30px"></span>
					  <input type="radio" name="member_birth_gn" value="2" checked />陽暦
						 <span style="padding-left:30px"></span>
						<input type="radio"  name="member_birth_gn" value="1" />陰暦
				  </td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">電話番号</td>
					<td><select  name="tel1">
							<option>なし</option>
							<option value="02">02</option>
							<option value="031">031</option>
							<option value="032">032</option>
							<option value="033">033</option>
							<option value="041">041</option>
							<option value="042">042</option>
							<option value="043">043</option>
							<option value="044">044</option>
							<option value="051">051</option>
							<option value="052">052</option>
							<option value="053">053</option>
							<option value="054">054</option>
							<option value="055">055</option>
							<option value="061">061</option>
							<option value="062">062</option>
							<option value="063">063</option>
							<option value="064">064</option>
							<option value="0502">0502</option>
							<option value="0503">0503</option>
							<option value="0505">0505</option>
							<option value="0506">0506</option>
							<option value="0507">0507</option>
							<option value="0508">0508</option>
							<option value="070">070</option>
					   </select> - <input  size="10px" type="text" name="tel2"> - <input size="10px"  type="text" name="tel3">
					</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">携帯番号</td>
					<td><select  name="hp1">
							<option>なし</option>
							<option selected value="010">010</option>
							<option value="011">011</option>
							<option value="016">016</option>
							<option value="017">017</option>
							<option value="018">018</option>
							<option value="019">019</option>
					</select> - <input size="10px"  type="text" name="hp2"> - <input size="10px"  type="text"name="hp3"><br> <br> 
					<input type="checkbox"	name="smssts_yn" value="Y" checked /> ショッピングモールから発送するSMS消息を受信します。</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">メールアドレス<br>(e-mail)</td>
					<td><input size="10px"   type="text" name="email1" /> @ <input  size="10px"  type="text"name="email2" /> 
						  <select name="email2" onChange=""	title="直接入力">
									<option value="non">直接入力</option>
									<option value="hanmail.net">hanmail.net</option>
									<option value="naver.com">naver.com</option>
									<option value="yahoo.co.kr">yahoo.co.kr</option>
									<option value="hotmail.com">hotmail.com</option>
									<option value="paran.com">paran.com</option>
									<option value="nate.com">nate.com</option>
									<option value="google.com">google.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="empal.com">empal.com</option>
									<option value="korea.com">korea.com</option>
									<option value="freechal.com">freechal.com</option>
							</select><br> <br> <input type="checkbox" name="emailsts_yn" value="Y" checked /> ショッピングモールで発送するe-mailを受信します。</td>
				</tr>
				<tr class="dot_line">
					<td class="fixed_join">住所</td>
					<td>
					   <input type="text" id="zipcode" name="zipcode" size="10" > <a href="javascript:execDaumPostcode()">郵便番号検索</a>
					  <br>
					  <p> 
					  地番住所:<br><input type="text" id="roadAddress"  name="roadAddress" size="50"><br><br>
					  道路名住所: <input type="text" id="jibunAddress" name="jibunAddress" size="50"><br><br>
					  残りの住所: <input type="text"  name="namujiAddress" size="50" />
					   </p>
					</td>
					<td>
					  <input type="button" value="修正する" onClick="fn_modify_member_info('address')" />
					</td>
				</tr>
			</tbody>
		</table>
		</div>
		<div class="clear">
		<br><br>
		<table align=center>
		<tr>
			<td >
				<input type="hidden" name="command"  value="modify_my_info" /> 
				<input name="btn_cancel_member" type="button"  value="修正取り消し">
			</td>
		</tr>
	</table>
	</div>
	<input  type="hidden" name="h_tel1" value="${memberInfo.tel1}" />
	<input  type="hidden" name="h_hp1" value="${memberInfo.hp1}" />		
</form>	
</body>
</html>
