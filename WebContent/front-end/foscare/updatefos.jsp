<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="BIG5"%>
<%@ page import="com.foscare.model.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.pet.model.*"%>
<!DOCTYPE html>
<html lang="zxx">
<head>
<meta charset="UTF-8">
<meta name="description" content="Fashi Template">
<meta name="keywords" content="Fashi, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>GGYY</title>

</head>
<body>
	<%@ include file="/front-end/Header/header.jsp" %>
	<%
	
	  FosterService fosSvc = new FosterService();
	  String memNo = memVO.getMemNo();
	  FosterVO fosterVO = (FosterVO)request.getAttribute("fosterVO");
		String fosType = "1";
		String fosSize = "1";
		String fosnrun = "1";
	  if(fosterVO != null){
			fosType = (fosterVO.getFosType()==null)?"1":fosterVO.getFosType();
			fosSize = (fosterVO.getFosSize()==null)?"1":fosterVO.getFosSize();
			fosnrun = (fosterVO.getFosnrun()==null)?"1":fosterVO.getFosnrun();
		}
	%>
	<input type="hidden" id="isSuccess" value="${isSuccess}">
	<input type="hidden" id="successVal" value="${successVal}">
	<section class="blog-section spad" id="foshometop">
		<div class="container">
			<div class="row" id="foshomepho">
				<div class="col-lg-2 col-md-6 col-sm-8 order-2 order-lg-1">
					<div class="blog-sidebar">
						<div class="blog-catagory">
							<div>
								<h4>寄養專區</h4>
								<ul>
									<li><a href="addfos.jsp">填寫寄養單</a></li>
									<li><a href="readfos.jsp">查看寄養單</a></li>
									<li><a href="serchfosm.jsp">搜尋保母</a></li>
								</ul>
							</div>
							<div class="sub-catagory">
								<a href="fosmHome.jsp">保母專區</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-10 order-1 order-lg-2">
					<div class="row">
						<div class="col-lg-12 col-sm-6">
							<form action="fos.do" class="checkout-form" method="post" id="theform">
								<input  type="hidden"  name="url" value="<%= request.getContextPath()%>/front-end/foscare/readfos.jsp">
								<div class="row">
									<div class="col-lg-12" id="addfos">
										<h4>寄養單 - ${fosterVO.fosNo}
										<input type="hidden" name="fosNo" value="${fosterVO.fosNo}">
										</h4>
										<div class="row">
											<div class="col-lg-1"></div>
											<div class="col-lg-11">
												<%-- 錯誤表列 --%>
												<c:if test="${not empty errorMsgs}">
													<font style="color:red">請修正以下錯誤:</font>
													<ul>
														<c:forEach var="message" items="${errorMsgs}">
															<li style="color:red">${message}</li>
														</c:forEach>
													</ul>
												</c:if>
											</div>
											<div class="col-lg-3">
												<label for="fir">會員姓名<span>*</span></label>
												<input type="text" id="fir" value="${LoginMem.memName}" disabled> 
												<input type="hidden"  name="memNo" value="${LoginMem.memNo}">
												<input type="hidden"  id="status" name="fosStatus" value="${fosterVO.fosStatus}">
<!-- 													<input type="text" id="fir" name="memNo"> -->
											</div>
											<div class="col-lg-3">
												<span>寵物名字*</span>
												<div class="changeable">
													<select class="sorting" name="petNo">
														<c:forEach var="petVO" items="<%= fosSvc.getPetNames(memNo) %>">
		    												<option value="${petVO.petNo}" ${(petVO.petNo==fosterVO.petNo)?'selected':''}>${petVO.petName}
		    											</c:forEach>
													</select>
												</div>
											</div>
											<div class="col-lg-2">
												<span>寵物類型*</span>
												<div class="changeable">
													<select class="sorting" name="fosType">
														<!--去框-->
														<option value="貓" <%= (fosType.equals("貓"))?"selected":""%>>貓</option>
														<option value="狗" <%= (fosType.equals("狗"))?"selected":""%>>狗</option>
														<option value="其他" <%= (fosType.equals("其他"))?"selected":""%>>其他</option>
													</select>
												</div>
											</div>
											<div class="col-lg-2">
												<span>寵物體型大小*</span>
												<div class="changeable">
													<select class="sorting" name="fosSize">
														<!--去框-->
														<option value="小型" <%= (fosSize.equals("小型"))?"selected":""%>>小型</option>
														<option value="中型" <%= (fosSize.equals("中型"))?"selected":""%>>中型</option>
														<option value="大型" <%= (fosSize.equals("大型"))?"selected":""%>>大型</option>
													</select>
												</div>
											</div>
											<div class="col-lg-2">
												<span>是否要代遛*</span>
												<div class="changeable">
													<select class="sorting" name="fosnrun">
														<!--去框-->
														<option value="是" <%= (fosnrun.equals("是"))?"selected":""%>>是</option>
														<option value="否" <%= (fosnrun.equals("否"))?"selected":""%>>否</option>
													</select>
												</div>
											</div>
											<div class="col-lg-4">
												<label for="fir">開始時間<span>*</span></label> <input
													type="text" id="startTime" name="startTime" class="changeable">
											</div>
											<div class="col-lg-4">
												<label for="last">結束時間<span>*</span></label> <input
													type="text" id="endTime" name="endTime" class="changeable">
											</div>
											<div class="col-lg-4">
												<label for="fir">連絡電話<span>*</span></label> <input
													type="text" value="${LoginMem.memTel}" class="changeable" disabled>
											</div>
											<div class="col-lg-8">
												<label for="last">地址區域<span>*</span></label> <input
													type="text" value="${LoginMem.memAddr}" class="changeable" disabled>
											</div>

											<div class="col-lg-3">
												<label for="money">價格<span>*</span></label> <input
													type="text" id="money" name="fosMoney" class="changeable"  value="${fosterVO.fosMoney}" >
											</div>
											<div class="col-lg-7">
												<textarea placeholder="備註" name="fosRemark" class="changeable">${fosterVO.fosRemark}</textarea>
												<button type="submit" class="site-btn" id="sendUpdate">送出</button>
												<input type="hidden" name="fosStatus" value="${fosterVO.fosStatus}">
												<input type="hidden" name="action" value="update">
											</div>
											<div class="col-lg-3">
												<label for="fir">保母編號<span>*</span></label> 
												<input type="text" name="fosmNo" id="fosmNo" value="${fosterVO.fosmNo}" ${(fosterVO.fosStatus=='F1')?'disabled':''}>
												<input type="hidden" name="fosmNo" value="${fosterVO.fosmNo}">
											</div>
											<div class="col-lg-2">
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<% 
  	java.sql.Date startTime = null;
  	java.sql.Date endTime = null;
  	try {
	    startTime = fosterVO.getFosStartTime();
	    endTime  = fosterVO.getFosEndTime();
   	} catch (Exception e) {
	   startTime = new java.sql.Date(System.currentTimeMillis());
	   endTime = new java.sql.Date(System.currentTimeMillis());
   	}
 	%> 
	
	<%@ include file="/front-end/Footer/footer.jsp" %>
	<c:if test="${LoginMem!=null}">
		<%@ include file="/chatRoom/chatRoom.jsp"%>
	</c:if>
	<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>
	<script>
	$(document).ready(function(){
		let a = $("#status").val();
		if(a != 'F0' && a != 'F1'){
			$(".changeable").prop("disabled",true);
			$(".changeable>select").prop("disabled",true);
		}
		
		let success= $("#isSuccess").val();
		let successVal = $("#successVal").val();
		if(success == "No"){
			swal(successVal, '死囝仔！還敢亂輸入阿!', 'error');
		}
		
		$("#sendUpdate").click(function(e){
			e.preventDefault();
			let receiver = $("#fosmNo").val();
			if( receiver != "" ){
				jsonObj = {
						"type" : "notice",
						"sender" : "${LoginMem.memNo}",
						"receiver" : receiver,
						"contain" : "您收到一筆寄養單確認，請前往查看!!"
					} 
				webSocketN.send(JSON.stringify(jsonObj));
			}
			$("#theform").submit();
		});
	});
$.datetimepicker.setLocale('zh'); // kr ko ja en
$(function(){
	 $('#startTime').datetimepicker({
	  format:'Y-m-d',
	  onShow:function(){
	   this.setOptions({
	    maxDate:$('#endTime').val()?$('#endTime').val():false
	   })
	  },
	  timepicker:false,
	  value: '<%= startTime %>'
	 });
	 
	 $('#endTime').datetimepicker({
	  format:'Y-m-d',
	  onShow:function(){
	   this.setOptions({
	    minDate:$('#startTime').val()?$('#startTime').val():false
	   })
	  },
	  timepicker:false,
	  value: '<%= endTime %>'
	 });
});
</script>
</body>
<% session.removeAttribute("isSuccess"); 
   session.removeAttribute("successVal");
%>
</html>