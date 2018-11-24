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
                $("."+selector).append("<option value='-1'>--请选择"+item+"--</option>");
                $.each(data, function (index, item) {
                    var id = data[index].id;
                    var value = data[index].value;
                    $("."+selector).append("<option value='"+id+"'>"+value+"</option>");
                });
            }
        });
    });
};