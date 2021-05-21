<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%
    pageContext.setAttribute("ctx", request.getContextPath());
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工列表</title>
<script type="text/javascript"
	src="${ctx}/static/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="${ctx}/static/bootstrap/js/bootstrap.js"></script>
<link rel="stylesheet" href="${ctx }/static/bootstrap/css/bootstrap.css">
</head>
<body>

<!-- 员工修改-->
    <div class="modal fade" id="empEditModal" tabindex="-1" role="dialog"
        aria-labelledby="myEditModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myEditModalLabel">员工修改</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label  class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <p class="form-control-static">XXXXX</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email_edit" class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="email_edit" name="email"
                                    placeholder="email">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                  <input type="radio" name="gender" id="gender1" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                  <input type="radio" name="gender" id="gender2" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="dId">
                                </select>
                            </div>
                        </div>
                        <input type="hidden" name="empId" id="empId"/>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="emp_edit_btn">修改</button>
                </div>
            </div>
        </div>
    </div>

	<!-- 员工添加 -->
	<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">员工添加</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="empName_add" class="col-sm-2 control-label">empName</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="empName_add" name="empName"
									placeholder="empName">
								<span class="help-block"></span>
							</div>
						</div>
						<div class="form-group">
							<label for="email_add" class="col-sm-2 control-label">email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="email_add" name="email"
									placeholder="email">
								<span class="help-block"></span>
							</div>
						</div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
								  <input type="radio" name="gender" id="gender1" value="M" checked="checked"> 男
								</label>
								<label class="radio-inline">
								  <input type="radio" name="gender" id="gender2" value="F"> 女
								</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-5">
                                <select class="form-control" name="dId">
								</select>
                            </div>
                        </div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" id="emp_add_btn">Add</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<!-- 标题 -->
		<div class="row">
			<div class="col-md-12">
				<h1>员工列表</h1>
			</div>
		</div>
		<!-- 按钮 -->
		<div class="row">
			<div class="col-md-4">
				<button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
				<button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-hover" id="emp_table">
					<thead>
						<tr>
							<th><input type="checkbox" id="check_all" /></th>
							<th>编号</th>
							<th>姓名</th>
							<th>性别</th>
							<th>邮箱</th>
							<th>部门</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-6 text-left" style="height: 79px; padding: 20px;"
				id="page_info_area"></div>
			<div class="col-md-6" id="page_nav_area"></div>
		</div>
	</div>
	<script type="text/javascript">
    
	     var totalNum;
	     var currentPage ;
		$(function() {
			to_page(1);
		});
		
		function reset_form(ele) {
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}
		//新增页面
		$("#emp_add_modal_btn").click(function() {
			//情况表单样式和内容
			reset_form("#empAddModal form");
			//查询所有部门信息，并赋值select
			get_depts("#empAddModal select");
			$("#empAddModal").modal({
				backdrop:"static"
			});
		});
		
		//弹出修改页面
		$(document).on("click",".edit-btn",function(){
            //alert("edit");
           
            //1、查出部门信息，并显示部门列表
            get_depts("#empEditModal select");
            //2、查出员工信息，显示员工信息
            get_emp($(this).attr("edit-id"));
            
            //3、把员工的id传递给模态框的更新按钮
            $("#emp_edit_btn").attr("edit-id",$(this).attr("edit-id"));
            $("#empEditModal").modal({
                backdrop:"static"
            });
        });
		
		//单个删除
		
		$(document).on("click",".delete-btn",function(){
			var empId = $(this).attr("delete-id");
			var empName = $(this).parents("tr").find("td:eq(2)").text();
			if(confirm("确认要删除"+empName+"吗？")){
				$.ajax({
					url:"${ctx}/emp/"+empId,
					type:"DELETE",
					success: function(result){
						alert(result.msg);
						to_page(currentPage);
					}
				});
			}
		});
		//修改保存请求
		$("#emp_edit_btn").click(function() {
			
			var email = $("#email_edit").val();
            var regexEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/ ;

            if(!regexEmail.test(email)){
                statusSet("#email_edit","error","邮箱格式不正确");
                return false;
            } else {
                statusSet("#email_edit","success","");
            }
			  $.ajax({
				  url:"${ctx}/emp",
	              type:"PUT", 
	              data:$("#empEditModal form").serialize(),
	                success:function (result){
	                    alert(result.msg);
	                    //隐藏模态窗
	                    $("#empEditModal").modal("hide");
	                    //跳转到最后一页查看添加数据
	                    to_page(currentPage);
	                }
			  })
		});

		
        function get_emp(id) {
            $.ajax({
                url:"${ctx}/emp/"+id,
                type:"GET",
                success:function (result){
                	var empData =result.data.emp;
                	$(".form-control-static").text(empData.empName);
                	$("#email_edit").val(empData.email);
                	$("#empEditModal input[name=gender]").val([empData.gender]);
                    $("#empEditModal select").val([empData.dId]);
                    $("#empEditModal input[id=empId]").val(empData.empId);
                }
            });
        }
        
		function get_depts(ele) {
			$.ajax({
				url:"${ctx}/depts",
				type:"GET",
				success:function (result){
					$(ele).empty();
					$.each(result.data.depts,function(){
						$(ele).append($("<option></option>").append(this.deptName).attr("value",this.deptId));
					})
				}
			});
		}
		function to_page(cp) {
			$.ajax({
                url:"${ctx}/emps",
                data:"cp="+cp,
                type:"GET",
                success:function(result){
                    //构建表格数据
                    build_emap_data(result);
                    //构建分页信息
                    build_page_info(result);
                    //分页组件
                    build_page_nav(result);
                }
            });
		}
		function build_page_nav(result) {
			$("#page_nav_area").empty();
			
			var nav = $("<nav></nav>").attr("aria-label","Page navigation");
			var ul = $("<ul></ul>").addClass("pagination").attr("style","margin-left: 30%;");
			//上一页和首页
			//<li><a href="${ctx }/emps?cp=1">首页</a></li>
			var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
			//<li><a href="${ctx }/emps?cp=${page_Num-1}" aria-label="Previous"><span aria-hidden="true">&laquo;</a></li>
			var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
			if(result.data.pageInfo.hasPreviousPage == false){
				firstPageLi.addClass("disabled");
				prePageLi.addClass("disabled");
			} else {
				firstPageLi.click(function () {
					to_page(1);
				});
				prePageLi.click(function() {
					to_page(result.data.pageInfo.pageNum-1);
				});
			}
			//下一页和尾页
            var lastPageLi = $("<li></li>").append($("<a></a>").append("尾页").attr("href","#"));
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            if(result.data.pageInfo.hasNextPage == false){
            	lastPageLi.addClass("disabled");
            	nextPageLi.addClass("disabled");
            } else {
            	lastPageLi.click(function () {
                    to_page(result.data.pageInfo.pages);
                });
            	nextPageLi.click(function() {
                    to_page(result.data.pageInfo.pageNum+1);
                });
            }
           
			//组装
			ul.append(firstPageLi).append(prePageLi);
			//中间部分
			$.each(result.data.pageInfo.navigatepageNums,function(index,item){
				//<li class="active"><a href="#">${page_Num}</a></li>
				var numLi = $("<li></li>").append($("<a></a>").append(item));
				if(result.data.pageInfo.pageNum == item){
					numLi.addClass("active");
				}
				numLi.click(function() {
					to_page(item);
				});
				ul.append(numLi);
			});
			ul.append(nextPageLi).append(lastPageLi);
			nav.append(ul);
			
            $("#page_nav_area").append(nav);
        }
		
		function build_page_info(result) {
			$("#page_info_area").empty();
			$("#page_info_area").append("当前"+result.data.pageInfo.pageNum+"页,总"+
                    result.data.pageInfo.pages+"页,总"+
                    result.data.pageInfo.total+"条记录");
			totalNum = result.data.pageInfo.total;
			currentPage = result.data.pageInfo.pageNum;
		}
		function build_emap_data(result) {
			$("#emp_table tbody").empty();
			var emps = result.data.pageInfo.list;
			$.each(emps,function(index,item){
				var checkBoxTd = $("<td><input type='checkbox' class='check_item'/></td>");
				var empIdTd = $("<td></td>").append(item.empId);
				var empNameTd = $("<td></td>").append(item.empName);
				var genderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
				var emailTd = $("<td></td>").append(item.email);
				var departmentTd = $("<td></td>").append(item.department.deptName);
				var editBtn =  $("<button></button>").addClass("btn btn-primary btn-sm edit-btn")
				                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
				editBtn.attr("edit-id",item.empId);
				
				var delBtn =  $("<button></button>").addClass("btn btn-danger btn-sm delete-btn")
                                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
				delBtn.attr("delete-id",item.empId);
				
				var btnTd=$("<td></td>").append(editBtn).append(" ").append(delBtn).attr("width","150px");
				$("<tr></tr>").append(checkBoxTd).append(empIdTd).append(empNameTd)
				              .append(genderTd).append(emailTd).append(departmentTd)
				              .append(btnTd).appendTo("#emp_table tbody");
				
			});
		}
		
		function statusSet(ele,status,msg) {
			$(ele).parent().removeClass("has-success has-error");
			$(ele).next("span").text("");
			if("success"==status){
				$(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
			} else if("error"==status){
				$(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
			}
		}
		function validateData() {
			var empName = $("#empName_add").val();
            var regexName = /^[a-zA-Z0-9_-]{6,16}$/;
            var email = $("#email_add").val();
            var regexEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/ ;

            if(!regexName.test(empName)){
            	statusSet("#empName_add","error","姓名格式不正确");
                return false;
            } else {
            	statusSet("#empName_add","success","");
            }
            if(!regexEmail.test(email)){
            	statusSet("#email_add","error","邮箱格式不正确");
                return false;
            } else {
            	statusSet("#email_add","success","");
            }
            return true;
		}
		//检查用户是否已经存在
		$("#empName_add").change(function() {
			saveValidate();
		});
		
		
		function saveValidate() {
			var empName = $("#empName_add").val();
		    var flag;
			$.ajax({
                url:"${ctx}/checkuser",
                data:"empName="+empName,
                type:"GET",
                async:false,
                success:function(result){
                    if(result.code==100){
                        statusSet("#empName_add","success",result.data.vaMsg);
                        flag =  true;
                    } else {
                        statusSet("#empName_add","error",result.data.vaMsg);
                        flag =  false;
                    }
                }
            });
			return flag;
		}
		
		$("#emp_add_btn").click( function() {
			
	         //姓名异步交易

            if(!saveValidate()){
                return false;	
            }
			//添加校验
			if(!validateData()){
				return false;
			}

			$.ajax({
				url:"${ctx}/emp",
                type:"POST",
                data:$("#empAddModal form").serialize(),
                success:function (result){
                    alert(result.msg);
                    //隐藏模态窗
                    $("#empAddModal").modal("hide");
                    //跳转到最后一页查看添加数据
                    to_page(totalNum);
                }
			});
		});
		
		
		//全选
		$("#check_all").click(function() {
			$(".check_item").prop("checked",$(this).prop("checked"));
		});
		
		//根据选择数量判断全选按钮是否选中
		$(document).on("click",".check_item",function(){
			var flag = $(".check_item:checked").length==$(".check_item").length;
			$("#check_all").prop("checked",flag);
		})
		
		$("#emp_delete_all_btn").click(function() {
			var del_str ="";
			var empNames ="";
			if($(".check_item:checked").length<1){
				alert("请选择要删除的元素!");
				return false;
			}
			
			$.each($(".check_item:checked"),function(){
				del_str += $(this).parents("tr").find("td:eq(1)").text()+"-";
				empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
			});
			//去除empNames多余的,
            empNames = empNames.substring(0, empNames.length-1);
            //去除删除的id多余的-
            del_str = del_str.substring(0, del_str.length-1);
			if(confirm("确定要删除"+empNames+"吗?")){
				$.ajax({
					url:"${ctx}/emp/"+del_str,
					type:"DELETE",
					success:function(result){
						alert(result.msg);
						$("#check_all").prop("checked",false);
						to_page(currentPage);
					}
				});
			}
			
		})
</script>
</body>
</html>