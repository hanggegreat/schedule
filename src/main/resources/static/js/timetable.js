// csrf头部信息
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

/**
 *用于弹出模态框
 * @param bodyData 模态框主体内容，包含html元素
 * @param type 弹框类型，根据类型判断要执行的具体内容
 * @param value 传入的数据，用于接下来的操作
 */
var myAlert = function (bodyData, type, value) {
    var modal = $('#modal');
    modal.find('.modal-body').html('');
    modal.find('.modal-footer').html('');

    var body = modal.find('.modal-body');
    var foot = modal.find('.modal-footer');
    var footData = '<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>';

    if (type === 'make') {
        footData = '<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">取消</button>' +
            '<button type="button" class="btn btn-primary" onclick="make();" data-dismiss="modal">确定</button>';
    }

    body.html(bodyData);
    foot.html(footData);
    modal.modal({show: true, backdrop: 'static'});
};

var addClass = function (enrollYear) {
    var classSelector = $('#classNo');
    $('#teachInfo').html('');
    $('#timetable').attr("style", "display:none;");
    $('#teach').removeAttr("style");
    $('#teach_className').attr("style", "display:none;");
    $(classSelector).html('<option value="">请选择班级</option>');

    if (!/^\d{4}$/.test(enrollYear)) {
        return;
    }

    $.ajax({
        url: "/class/listByEnrollYear/" + enrollYear,
        type: 'POST',
        dataType: 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                classSelector.append('<option value="' + data[i].classNo + '">' + data[i].className + '</option>');
            }
        }
    });
};

var list = function (classNo, year) {
    var teach_className = $('#teach_className');
    var teachInfo = $('#teachInfo');
    teach_className.text('');
    teachInfo.html('');

    if (!/^\d{6}$/.test(classNo) || !/^\d{4}$/.test(year)) {
        return;
    }

    $.ajax({
        url: "/teacher/academic/timetable/listInMake/" + classNo + "/" + year,
        type: 'POST',
        dataType: 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (data) {
            if (data.type === "teaches") {
                $('#teach_className').removeAttr("style");
                teach_className.html(' —— ' + $('#classNo').find(":selected").text() + '<button onclick="myAlert(\'<h4>系统将会为' + $('#classNo').find(":selected").text() + '自动排课</h4>\', \'make\');" style="margin-left: 75px;" class="btn btn-large btn-success">一键排课</button>');
                $("#timetable").attr("style", "display:none");
                $("#teach").removeAttr("style");
                for (var i = 0; i < data.info.length; i++) {
                    teachInfo.append('<tr id="' + data.info[i].id + '">' +
                        '<td>' + data.info[i].teachNo + '</td>' +
                        '<td>' + data.info[i].teacher.teacherName + '</td>' +
                        '<td>' + data.info[i].tClass.className + '</td>' +
                        '<td>' + data.info[i].program.id + '</td>' +
                        '<td>' + data.info[i].program.subject.subName + '</td>' +
                        '<td>' + data.info[i].program.amount + '</td>' +
                        '<td>' + data.info[i].program.name + '</td>' +
                        '</tr>');
                }
            } else {
                $("#teach").attr("style", "display:none");
                $("#timetable").removeAttr("style");
                for (var i = 0; i < data.info.length; i++) {
                    var td = $('[num=' + data.info[i].time + ']');
                    td.html(data.info[i].teach.program.subject.subName + "<br>" + data.info[i].teach.teacher.teacherName + "<br>" + data.info[i].room.block.blockName + data.info[i].room.roomNo);
                }
            }
        }
    });
};

var make = function () {
    var year = $('#year').text();
    var classNo = $('#classNo').val();
    if (!/^\d{4}$/.test(year) || !/^\d{6}$/.test(classNo)) {
        return;
    }
    $.ajax({
        url: "/teacher/academic/timetable/make/" + year + "/" + classNo,
        type: 'POST',
        dataType: 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
            $("#teach").attr("style", "display:none");
            $('#wait').removeAttr("style");
        },
        complete: function () {
            $('#wait').attr("style", "display:none;");
        },
        success: function (data) {
            $("#timetable").removeAttr("style");
            for (var i = 0; i < data.length; i++) {
                var td = $('[num=' + data[i].time + ']');
                td.html(data[i].teach.program.subject.subName + "<br>" + data[i].teach.teacher.teacherName + "<br>" + data[i].room.block.blockName + data[i].room.roomNo);
            }
        }
    });
};