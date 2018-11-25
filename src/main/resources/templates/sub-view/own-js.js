/**
 *@Param: string url_table, int width
 *@Return: void
 **/
make_table = function (url_table,width) {
    $.get(url_table).done(function(data){
    var rowCount = data.rows.length;
    var cellCount = data.columns.length;

    var colHeader = $("<col>");
    colHeader.appendTo($(".table-col"));
    for (var j = 0; j < cellCount; j++) {
        var col = $("<col width='"+width+"'>");
        col.appendTo(colHeader);
    }

    var trHeader = $("<tr></tr>");
    trHeader.appendTo($(".table-title"));
    for (var j = 0; j < cellCount; j++) {
        var td = $("<th>" + data.columns[j].title + "</th>");
        td.appendTo(trHeader);
    }

    for (var m = 0; m < rowCount; m++) {
        var tr = $("<tr></tr>");
        tr.appendTo($(".table-content"));
        for (var n = 0; n < cellCount; n++) {
            var field = data.columns[n].field;
            var val="";
            if (data.rows[m][field] != null)
            {
                val = data.rows[m][field];
            }

            var td = $("<td>" + val + "</td>");
            td.appendTo(tr);
        }
    }

    });
};

/**
 *@Param: string url_at, string selector, string item
 *@Return: void
**/
make_select =function (url_selector,selector,item) {
    $(function () {
        $(selector).empty();
        $.ajax({
            url: url_selector,
            type: 'GET',
            dataType: 'json',
            success:function(data){
                console.log(data);
                $("#"+selector).append("<option value='-1'>--请选择"+item+"--</option>");
                $.each(data, function (index, item) {
                    var id = data[index].id;
                    var value = data[index].value;
                    $("#"+selector).append("<option value='"+id+"'>"+value+"</option>");
                });
            }
        });
    });
};

get_string=function(e){
    var tr= $(e).parent().parent();
    // var new_ID = tr.find("td:nth-child(2)").val().toString()+
    //              tr.find("td:nth-child(6)").val().toString()+
    //              tr.find("td:nth-child(7)").val().toString();
    return '2017803';
}
get_form = function () {
        var yearNo=$("#year-selector").val();
        var gradeNo=$("#grade-selector").val();
        var subjectNo=$("#subject-selector").val();
        var id=yearNo.toString()+gradeNo.toString()+subjectNo.toString();
        var year=$("#year-selector").find("option:selected").text();
        var grade=$("#grade-selector").find("option:selected").text();
        var subject=$("#subject-selector").find("option:selected").text();
        var exam=$('input:radio:checked').val();
        var name=$("input[name='name'] ").val();
        var amount=$("input[name='amount']").val();
        exam=(exam=='01')?'是':'否';
        var array=[ id,year,name,amount,exam,grade,subject];
        var tr = $("<tr></tr>");
        tr.appendTo($(".table-content"));
        for (var n = 0; n < 7; n++) {
            var td = $("<td>" + array[n] + "</td>");
            td.appendTo(tr);
        }
        var button = $("<td><button class='layui-btn layui-btn-normal layui-btn-small' onclick='toggle(this)'>修改</button>" +
            "<button class='layui-btn layui-btn-normal layui-btn-small' onclick='delTr(this)'><i class='layui-icon'>&#xe640;</i></button></td>");
            button.appendTo(tr);
        return false;
};

delTr= function(e){
        $(e).parent().parent().remove();
};

toggle = function(e){
    var str = $(e).text();
    var tds = $(e).parent().parent().find("td:nth-child(n+2):nth-child(-n+7)");
    if(str=='修改'){
        $(e).text('确定');
        edit(tds);
    }else if(str=='确定'){
        $(e).text('修改');
        var ID_td =$(e).parent().parent().find("td:first-child");
        console.log('修改');
        console.log(get_string(e));
        ID_td.html(get_string(e));
    }
};

edit = function(tds){
        //给所有的td添加点击事件
        tds.click(function () {
            //获得当前点击的对象
            var td = $(this);
            //取出当前td的文本内容保存起来
            var oldText = td.text();
            //建立一个文本框，设置文本框的值为保存的值
            var input = $("<input type='text' value='" + oldText + "'/>");
            //将当前td对象内容设置为input
            td.html(input);
            //设置文本框的点击事件失效
            input.click(function () {
                return false;
            });
            //设置文本框的样式
            input.css("border-width", "0");
            input.css("font-size", "14px");
            input.css("text-align", "center");
            input.css("width", "60px");
            //当文本框得到焦点时触发全选事件
            input.trigger("focus").trigger("select");
            //当文本框失去焦点时重新变为文本
            input.blur(function () {
                var input_blur = $(this);
                //保存当前文本框的内容
                var newText = input_blur.val();
                td.html(newText);
            });
            //响应键盘事件
            input.keyup(function (event) {
                // 获取键值
                var keyEvent = event || window.event;
                var key = keyEvent.keyCode;
                //获得当前对象
                var input_blur = $(this);
                switch (key) {
                    case 13://按下回车键，保存当前文本框的内容
                        var newText = input_blur.val();
                        td.html(newText);
                        break;

                    case 27://按下esc键，取消修改，把文本框变成文本
                        td.html(oldText);
                        break;
                }
            });
        });
};