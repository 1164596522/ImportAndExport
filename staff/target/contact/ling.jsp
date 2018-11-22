<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
</head>
<body>
<script>
    function add(){
        alert("44");
        $.ajax({
            method: 'post',
            url: "https://news-at.zhihu.com/api/4/news/latest",
            dataType:'json',
            headers:{'Content-Type':'application/json'},
            success:function (data) {
                alert(data['stories'][0].images);
                myImg.src = data['stories'][0].images;
            }
        });
    }
</script>
<img src="" id="myImg" />
<button onclick="add()"></button>
</body>
</html>
