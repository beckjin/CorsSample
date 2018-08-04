<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Web.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

</head>
<body>
    <form id="form1" runat="server">
        <div id="result">
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
    <script>
        function setCookie(name, value) {
            var Days = 30;
            var exp = new Date();
            exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
            document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
        }

        $(function () {

            // get or post
            //$.ajax({
            //    type: 'get',
            //    url: 'http://localhost:5000',
            //    success: function (result) {
            //        $('#result').html(result.data);
            //    }
            //});


            // jsonp
            //$.ajax({
            //    type: 'get',
            //    url: 'http://localhost:5000/home/jsonpTest',
            //    data: {
            //        name: 'beck'
            //    },
            //    dataType: "jsonp",
            //    jsonpCallback: "jsonpCallback",
            //    success: function (result) {
            //        $('#result').html(result.data);
            //    }
            //});

            // cors simple get
            //$.ajax({
            //    type: 'get',
            //    url: 'http://localhost:5000/home/fromQueryTest?name=beck',
            //    success: function (result) {
            //        $('#result').html(result.data);
            //    }
            //});

            // cors simple post
            //$.ajax({
            //    type: 'post',
            //    url: 'http://localhost:5000/home/fromFormTest',
            //    data: {
            //        name: 'beck'
            //    },
            //    success: function (result) {
            //        $('#result').html(result.data);
            //    }
            //});

            // cors complex post
            //$.ajax({
            //    type: 'post',
            //    url: 'http://localhost:5000/home/fromBodyTest',
            //    contentType: 'application/json',
            //    data: JSON.stringify({
            //        name: 'beck'
            //    }),
            //    success: function (result) {
            //        $('#result').html(result.data);
            //    }
            //});

            // cors complex post with cookie
            setCookie('name', 'test');
            $.ajax({
                type: 'post',
                url: 'http://localhost:5000/home/fromBodyTest',
                contentType: 'application/json',
                data: JSON.stringify({
                    name: 'beck'
                }),
                xhrFields: {
                    withCredentials: true
                },
                success: function (result) {
                    $('#result').html(result.data);
                }
            });
        });
    </script>
</body>
</html>
