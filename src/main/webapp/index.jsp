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

    <div class='container'>
        <div class='row'>
            <div class='col-md-12'>
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <div class='row'>
            <div class="col-md-4 offset-md-8">
                <button type="button" class="btn btn-primary">新增</button>
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

        getEmps(1);

        function getEmps(pn){
            $.ajax({
                url:"emps",
                data:"pn="+pn,
                type:"GET",
                success:function(result){
                    console.log(result);
                    $("#emps_table tbody").html("");
                    $("#page_info_area").html("");
                    $("#page_nav_area").html("");
                    build_emps_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            })
        }


        function build_page_nav(result){
            var cur_page = result.data.pageInfo.pageNum;
            var page_total = result.data.pageInfo.pages;
            var page_ul = $("<ul></ul>").addClass("pagination");
            var firstPageLi = $("<li></li>").addClass("page-item").append($("<a></a>").append("首页").addClass("page-link").attr("onClick","getEmps(1)"));
            var prevPageLi = $("<li></li>").addClass("page-item").append($("<a></a>").append("&laquo;").addClass("page-link").attr("onClick","getEmps("+(cur_page-1)+")"));
            var nextPageLi = $("<li></li>").addClass("page-item").append($("<a></a>").append("&raquo;").addClass("page-link").attr("onClick","getEmps("+(cur_page+1)+")"));
            var lastPageLi = $("<li></li>").addClass("page-item").append($("<a></a>").append("末页").addClass("page-link").attr("onClick","getEmps("+page_total+")"));
            if(result.data.pageInfo.isFirstPage != true){
                page_ul.append(firstPageLi);
                page_ul.append(prevPageLi);
            }
            $.each(result.data.pageInfo.navigatepageNums, function(index, item){
                if(result.data.pageInfo.pageNum == item)
                    page_ul.append($("<li></li>").addClass("page-item active").append($("<a></a>").append(item).addClass("page-link").attr("onClick","getEmps("+item+")")));
                else
                    page_ul.append($("<li></li>").addClass("page-item").append($("<a></a>").append(item).addClass("page-link").attr("onClick","getEmps("+item+")")));
            })
            page_ul.append(nextPageLi);
            page_ul.append(lastPageLi);
            $("#page_nav_area").append($("<nav></nav>").append(page_ul))
        }

        function build_page_info(result){
            var cur_page = result.data.pageInfo.pageNum;
            var page_size = result.data.pageInfo.pageSize;
            var page_total = result.data.pageInfo.pages;
            var row_total = result.data.pageInfo.total;
            $("#page_info_area").append("当前第"+cur_page+"页码一共"+page_total+"页,共"+row_total+"条记录");
        }


        function build_emps_table(result){
            var emps = result.data.pageInfo.list;
            $.each(emps,function(index, item){
                var empIdTd = $("<td></td>").append(item.id)
                var empNameTd = $("<td></td>").append(item.empName)
                var empGenderTd = $("<td></td>").append(item.gender)
                var empEmailTd = $("<td></td>").append(item.email)
                var empDeptTd = $("<td></td>").append(item.department.dptName)
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm").append("更改")
                var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm").append("删除")
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
    </script>
</body>
</html>
