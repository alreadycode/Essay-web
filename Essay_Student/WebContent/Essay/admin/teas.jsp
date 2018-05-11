<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>显示所有学生 </title>
		<link rel="stylesheet" type="text/css"
			href="../bootstrap/css/bootstrap.min.css" />
			<style type="text/css">
				*{
				font-size: 14px!important;
			}
			body{
				background:url(../img/BG.jpg) repeat;
			}

			</style>
	</head>
	<body>
		<div>
			<table class="table table-bordered table-hover">
				<thred>
					<tr>
						<th>工号</th>
						<th>姓名</th>
						<th>密码</th>
						<th>操作</th>
					</tr>
				</thred>
		        <tbody>
		        <c:forEach var="item" items="${sessionScope.teas }">
		        	<tr>
			
			    	<td>${item.tea_no }</td>
			    	<td>${item.tea_name }</td>
			    	<td>${item.tea_pwd }</td>
			    	<td>
			    		<a href="#" onclick="showDelete('${item.tea_no }')">删除 </a>
			    		<a href="#"onclick="showUpdate('${item.tea_name }','${item.tea_no }','${item.tea_pwd }')">修改 </a>
			    	</td>
			    	</tr>
		        </c:forEach>
			    
			</tbody>
		</table>
	</div>
		<!-- 删除操作的模态框，对话框 -->
	<form action="/Essay_Student/TeacherDeleteServlet" method="post" class="form-horizontal">
		<input type="hidden" name="user_no" id="user_no">
		<div class="modal" id="modal_delete">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1>提示</h1>
					</div>
					<div class="modal-body">
						您确定要删除[<span id="u_name"></span>]吗?
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-sm btn-danger">确定</button>
						<button type="reset" class="btn btn-sm btn-default"
							data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
	</form>
       <form action="/Essay_Student/TeacherUpdateServlet"method="post"class="form-horizontal">
        <div class="modal"id="modal_update">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			<div class="modal-header">
        				<h1>编辑</h1>
        			</div>
        			<div class="modal-body">
        				<div class="form-group ">
        					<label class="control-label col-sm-2">工号</label>
        					<div class="col-sm-6">
        						<input type="text"class="form-control"
        							id="tea_no" name="tea_no" />
        					</div>
        				</div>
        				<div class="form-group ">
        					<label class="control-label col-sm-2">姓名</label>
        					<div class="col-sm-6">
        						<input type="text"class="form-control"
        							id="tea_name" name="tea_name"/>
        					</div>
        				</div>
        				<div class="form-group ">
        					<label class="control-label col-sm-2">密码</label>
        					<div class="col-sm-6">
        						<input type="password"class="form-control"
        							id="tea_pwd" name="tea_pwd"/>
        					</div>
        				</div>
        			</div>
        			<div class="modal-footer">
        				<button type="submit"class="btn btn-sm btn-danger">修改</button>
        				<button type="reset"class="btn btn-sm btn-default"
        					data-dismiss = "modal">取消</button>
        			</div>
        		</div>
        	</div>
        </div>
       </form>
	</body>
	<script src="../js/jquery-3.2.1.min.js"type="text/javascript"charset="UTF-8"></script>
	<script src="../bootstrap/js/bootstrap.min.js"type="text/javascript"charset="UTF-8"></script>
	<script type="text/javascript">
		function showDelete(n)
		{
			jQuery("#u_name").html(n);
			jQuery("#modal_delete").modal();
			jQuery("#user_no").val(n);
		}
		function showUpdate(name,no,pwd)
		{//在jquery中所有的表单控件通过val()方法赋值和取值
			//在jquery中除了form表单控件以外的控件 使用html()方法赋值和取值因为他们没有value属性对应的innerhtml
			jQuery("#tea_no").val(no);
			jQuery("#tea_name").val(name);
			jQuery("#tea_pwd").val(pwd);
			jQuery("#modal_update").modal();	
		}
	</script>
</html>