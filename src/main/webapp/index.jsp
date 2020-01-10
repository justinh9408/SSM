<%@ page language="java"%>
<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script
  src="https://code.jquery.com/jquery-2.2.4.js"
  integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
  crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<title>hello</title>
</head>
<body>

    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">修改员工</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label">姓名</label>
                <div class="col-sm-10">
                  <p class="form-control-static" id="empName_update_static">
                  <div class="invalid-feedback">
                  </div>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="update_email_input" name="email">
                  <div class="invalid-feedback">
                  </div>
                </div>
              </div>
                <div class="form-group row">

                  <label for="inputPassword" class="col-sm-2 col-form-label">性别</label>

                  <div class="col-sm-10">
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="gender" id="update_gender_inlineRadio1" value="M">
                          <label class="form-check-label" for="gender_inlineRadio1">男</label>
                        </div>
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="gender" id="update_gender_inlineRadio2" value="F">
                          <label class="form-check-label" for="gender_inlineRadio2">女</label>
                        </div>
                  </div>
                </div>

                <div class="form-group row">
                  <label for="inputPassword" class="col-sm-2 col-form-label">部门</label>
                  <div class="col-sm-4">
                    <select id="update_dept_select" class="form-control" name="dId">
                    </select>
                  </div>
                </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" id="update_Emp_saveBtn">修改</button>
          </div>
        </div>
      </div>
    </div>

    <div class="modal fade" id="insertModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">新增员工</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group row">
                <label for="staticEmail" class="col-sm-2 col-form-label">姓名</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="empName_input" name="empName">
                  <div class="invalid-feedback">
                  </div>
                </div>
              </div>
              <div class="form-group row">
                <label for="inputPassword" class="col-sm-2 col-form-label">Email</label>
                <div class="col-sm-10">
                  <input type="text" class="form-control" id="email_input" name="email">
                  <div class="invalid-feedback">
                  </div>
                </div>
              </div>
                <div class="form-group row">

                  <label for="inputPassword" class="col-sm-2 col-form-label">性别</label>

                  <div class="col-sm-10">
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="gender" id="gender_inlineRadio1" value="M">
                          <label class="form-check-label" for="gender_inlineRadio1">男</label>
                        </div>
                        <div class="form-check form-check-inline">
                          <input class="form-check-input" type="radio" name="gender" id="gender_inlineRadio2" value="F">
                          <label class="form-check-label" for="gender_inlineRadio2">女</label>
                        </div>
                  </div>
                </div>

                <div class="form-group row">
                  <label for="inputPassword" class="col-sm-2 col-form-label">部门</label>
                  <div class="col-sm-4">
                    <select id="dept_select" class="form-control" name="dId">
                    </select>
                  </div>
                </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
            <button type="button" class="btn btn-primary" id="addEmp_saveBtn">保存</button>
          </div>
        </div>
      </div>
    </div>

    <div class='container'>
        <div class='row'>
            <div class='col-md-12'>
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <div class='row'>
            <div class="col-md-4 offset-md-8">
                <button type="button" class="btn btn-primary" id="add_modal_btn">新增</button>
                <button type="button" class="btn btn-danger">删除</button>
            </div>
        </div>
        <div class='row'>
            <div class='col-md-12'>
                <table class='table table-hover' id="emps_table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>empName</th>
                            <th>gender</th>
                            <th>email</th>
                            <th>department</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>

        <div class='row'>
            <div class='col-md-6' id='page_info_area'>
            </div>

            <div class='col-md-6' id="page_nav_area">

            </div>
        </div>
    </div>

    <script text='type/javascript'>

        var totalRecord = 0, curPage = 0;
        var ajax_validate = "false";

        $(function(){
            getEmps(1);
        })

        function getEmps(pn){
            $.ajax({
                url:"emps",
                data:"pn="+pn,
                type:"GET",
                success:function(result){
                    console.log(result);
                    build_emps_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            })
        }


        function build_page_nav(result){
            $("#page_nav_area").html("");
            var cur_page = result.data.pageInfo.pageNum;
            var page_total = result.data.pageInfo.pages;
            var page_ul = $("<ul></ul>").addClass("pagination");
            var firstPageLi = $("<li></li>").addClass("page-item").append($("<a></a>").append("首页").addClass("page-link").attr("onClick","getEmps(1)"));
            var prevPageLi = $("<li></li>").addClass("page-item").append($("<a></a>").append("&laquo;").addClass("page-link").attr("onClick","getEmps("+(cur_page-1)+")"));
            var nextPageLi = $("<li></li>").addClass("page-item").append($("<a></a>").append("&raquo;").addClass("page-link").attr("onClick","getEmps("+(cur_page+1)+")"));
            var lastPageLi = $("<li></li>").addClass("page-item").append($("<a></a>").append("末页").addClass("page-link").attr("onClick","getEmps("+page_total+")"));
            page_ul.append(firstPageLi);
            page_ul.append(prevPageLi);
            if(result.data.pageInfo.isFirstPage == true){
                firstPageLi.addClass("disabled");
                prevPageLi.addClass("disabled");
            }
            $.each(result.data.pageInfo.navigatepageNums, function(index, item){
                if(result.data.pageInfo.pageNum == item)
                    page_ul.append($("<li></li>").addClass("page-item active").append($("<a></a>").append(item).addClass("page-link").attr("onClick","getEmps("+item+")")));
                else
                    page_ul.append($("<li></li>").addClass("page-item").append($("<a></a>").append(item).addClass("page-link").attr("onClick","getEmps("+item+")")));
            })
            page_ul.append(nextPageLi);
            page_ul.append(lastPageLi);
            if(result.data.pageInfo.isLastPage == true){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }
            $("#page_nav_area").append($("<nav></nav>").append(page_ul))
        }

        function build_page_info(result){
            $("#page_info_area").html("");
            var cur_page = result.data.pageInfo.pageNum;
            var page_size = result.data.pageInfo.pageSize;
            var page_total = result.data.pageInfo.pages;
            var row_total = result.data.pageInfo.total;
            $("#page_info_area").append("当前第"+cur_page+"页码一共"+page_total+"页,共"+row_total+"条记录");
            totalRecord = row_total;
            curPage = cur_page;
        }


        function build_emps_table(result){
            $("#emps_table tbody").html("");
            var emps = result.data.pageInfo.list;
            $.each(emps,function(index, item){
                var empIdTd = $("<td></td>").append(item.id)
                var empNameTd = $("<td></td>").append(item.empName)
                var empGenderTd = $("<td></td>").append(item.gender)
                var empEmailTd = $("<td></td>").append(item.email)
                var empDeptTd = $("<td></td>").append(item.department.dptName)
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_Emp_Btn").append("更改").attr("edit-id",item.id)
                var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_Emp_Btn").append("删除")
                var btnsTd = $("<td></td>").append(editBtn).append(" ").append(deleteBtn)
                $("<tr></tr>").append(empIdTd)
                    .append(empIdTd)
                    .append(empNameTd)
                    .append(empGenderTd)
                    .append(empEmailTd)
                    .append(empDeptTd)
                    .append(btnsTd)
                    .appendTo($("#emps_table tbody"))
            })
        }

        $("#add_modal_btn").click(function(){
            $("#insertModal form")[0].reset()
            $.each($("#insertModal form input"), function(index, item){
                $(item).removeClass("is-invalid is-valid")
            })
            getDepts("#dept_select");
            $("#insertModal").modal();
        })

        function getDepts(ele){
            $(ele).empty();
            $.ajax({
                url:"depts",
                type:"GET",
                success:function(result){
                    $("#dept_select").html("")
                    $.each(result.data.depts,function(index, item){
                        var deptOption = $("<option></option>").append(item.dptName).attr("value",item.id);
                        deptOption.appendTo($(ele));
                    })
                }
            })
        }

        function validate_add_form(){
            var empName = $("#empName_input").val();
            var email = $("#email_input").val();
            var regName = /^[a-zA-Z][a-zA-Z0-9_-]{3,15}$/;
            var regEmail = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
            if(!regName.test(empName)){
                show_validate_msg("#empName_input","fail","姓名错误");
                return false;
            }else{
                show_validate_msg("#empName_input","success","");
            }
            if(!regEmail.test(email)){
                show_validate_msg("#email_input","fail","邮件格式错误");
                return false;
            }else{
                show_validate_msg("#email_input","success","");
            }
            return true;
        }

        function show_validate_msg(ele, status, msg){
            $(ele).removeClass("is-invalid is-valid")
            if(status == "success"){
                $(ele).addClass("is-valid");
            }else{
                $(ele).addClass("is-invalid");
                $(ele).next("div").html(msg)
            }
        }

        $("#empName_input").change(function(){
            var name = $(this).val()
            $.ajax({
                url:"checkEmpName",
                type:"GET",
                data:"empName="+name,
                success:function(result){
                    if(result.code == 100){
                        show_validate_msg("#empName_input","success","")
                        ajax_validate = "true";
                    }else{
                        show_validate_msg("#empName_input","fail","用户名不可用")
                        ajax_validate = "false";
                    }
                }
            })
        })

        $("#addEmp_saveBtn").click(function(){
            if(!validate_add_form()){
                console.log("invalid");
                return;
            }
            if(ajax_validate == "false")
                result;

            $.ajax({
                url:"emps",
                type:"POST",
                data:$("#insertModal form").serialize(),
                success:function(result){
                    $("#insertModal").modal("hide");
                    getEmps(totalRecord);
                }
            })
        })

        $( document ).on( "click", ".edit_Emp_Btn", function(){
            getDepts("#updateModal select");
            getEmpById($(this).attr("edit-id"));
            $("#update_Emp_saveBtn").attr("edit-id",$(this).attr("edit-id"));
            $("#updateModal").modal();
        } );

        function getEmpById(id){
            console.log("get emp by id")
            $.ajax({
                url:"emp/"+id,
                type:"GET",
                success:function(result){
                    var empData = result.data.emp;
                    console.log(empData)
                    $("#empName_update_static").html(empData.empName)
                    $("#update_email_input").val(empData.email)
                    $("#updateModal input[name=gender]").val([empData.gender]);
                    $("#update_dept_select").val([empData.dId]);
                }
            })
        }

        $("#update_Emp_saveBtn").click(function(){
            $.ajax({
                url:"emp/"+$(this).attr("edit-id"),
                type:"PUT",
                data:$("#updateModal form").serialize(),
                success:function(){
                    alert("update success!");
                    $("#updateModal").modal("hide");
                    getEmps(curPage);
                }
            })
        })
    </script>
</body>
</html>
