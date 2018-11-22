<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    body {
        text-align: center
    }

    select {
        text-align: center;
        text-align-last: center;
    }

    input {
        text-align: center;
    }
</style>
<body>
<script type="text/javascript">
    var i = 1;

    function add() {
        var $tr = $("<tr>").appendTo("#tab1");
        var $select = $("<select name='personnels[" + i + "].sex' class='sex' class='form-control'>");
        $select.append("<option hidden='hidden'>---请选择---</option>");
        $select.append("<option>男</option>");
        $select.append("<option>女</option>");
        var $td = $("<td>").append($select);
        var $select1 = $("<select name='personnels[" + i + "].education' class='education' class='form-control'>");
        $select1.append("<option hidden='hidden'>---请选择---</option>");
        $select1.append("<option>大专</option>");
        $select1.append("<option>本科</option>");
        $select1.append("<option>硕士</option>");
        $select1.append("<option>博士</option>");
        var $td1 = $("<td>").append($select1);
        $tr.append("<td><input type='text' name='personnels[" + i + "].id' class='id' class='form-control'/></td>");
        $tr.append("<td><input type='text' name='personnels[" + i + "].name' class='name' class='form-control'/></td>");
        $tr.append($td);
        $tr.append($td1);
        $tr.append("<td><input type='text' name='personnels[" + i + "].wages' class='salary' class='form-control'/></td>");
        $tr.append("<td><input type='button' value='+' onclick='add()' class='btn btn-default  btn-xs'/></td>");
        $tr.append("<td><input type='button' value='-' onclick='del(this)' class='btn btn-default  btn-xs'/></td>");
        console.log(i);
        i++;
    };

    function del(obj) {
        var trlength = $("#tab1 tr").length;
        if (trlength === 2) {
            alert("你过来啊！");
        } else {
            var tr = obj.parentNode.parentNode.parentNode.lastChild;
            console.log(tr);
            tr.parentNode.removeChild(tr);
            i--;
        }
    };


    function exportTable() {
        window.location.href = "/export";
    }

    function importTable(file) {
        var formData = new FormData();
        formData.append("file",file.files[0]);
        $.ajax({
            method: 'post',
            url: "/import",
            data:formData,
            cache: false,
            contentType: false,
            processData: false,
            success:function (data) {
                location.reload(true);
            }
        })
    }

</script>
<div>
    <form action="/" method="post">
        <table cellspacing="20" align="center" id="tab1" class="table" style="margin-top:25px;border-collapse:collapse;width:890px">
            <tr>
                <td>员工编号</td>
                <td>姓名</td>
                <td>性别</td>
                <td>学历</td>
                <td>月薪</td>
                <td>增加</td>
                <td>移除</td>
            </tr>
            <tr>
                <td><input type="text" name="personnels[0].id" class="id" class="form-control"/></td>
                <td><input type="text" name="personnels[0].name" class="name" class="form-control"/></td>
                <td>
                    <select name="personnels[0].sex" class="sex" class="form-control">
                        <option hidden="hidden">---请选择---</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </td>
                <td>
                    <select name="personnels[0].education" class="education" class="form-control">
                        <option hidden="hidden">---请选择---</option>
                        <option>大专</option>
                        <option>本科</option>
                        <option>硕士</option>
                        <option>博士</option>
                    </select>
                </td>
                <td><input type="text" name="personnels[0].wages" class="salary" class="form-control"/></td>
                <td><input type="button" value="+" onclick="add()" class="btn btn-default  btn-xs" class="form-control"/></td>
                <td><input type="button" value="-" onclick="del(this)" class="btn btn-default  btn-xs" class="form-control"/></td>
            </tr>
        </table>
        <input type="submit" value="批量添加" class="btn btn-primary btn-sm"/>
    </form>

    <table id="tab2" cellspacing="30" align="center"
           style="margin-top:25px;border-collapse:collapse;width:890px" class="table table-striped">
        <tr class="info">
            <td>员工编号</td>
            <td>姓名</td>
            <td>性别</td>
            <td>学历</td>
            <td>月薪</td>
            <td>操作</td>
        </tr>
        <c:forEach items="${mappers}" var="mappers">
            <tr>
                <td>${mappers.id}</td>
                <td>${mappers.name}</td>
                <td>${mappers.sex}</td>
                <td>${mappers.education}</td>
                <td>${mappers.wages}</td>
                <td><a href="/del/${mappers.id}">删除</a></td>
            </tr>
        </c:forEach>
    </table>
    <br>
    <input type="file" id="myExcel" onchange="importTable(this)" style="display: none"/>
    <button onclick="myExcel.click()" class="btn btn-primary btn-sm">导入 Excel 表格</button>
    <button onclick="exportTable()" class="btn btn-primary btn-sm">导出 Excel 表格</button>

</div>
</body>
</html>
