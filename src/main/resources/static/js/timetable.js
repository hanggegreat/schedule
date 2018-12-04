// csrf头部信息
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");
var firstTimetable;
var secondTimetable;
var exchangeBtn;
var cancelBtn;
$(function () {
    exchangeBtn = $("#exchangeBtn");
    cancelBtn = $("#cancelBtn");
});

/**
 *用于弹出模态框
 * @param bodyData 模态框主体内容，包含html元素
 * @param type 弹框类型，根据类型判断要执行的具体内容
 * @param value 传入的数据，用于接下来的操作
 */
var myAlert = function (bodyData, type, value) {
    var modal = $('#modal');
    var enrollYear = $("#enrollYear").val();
    modal.find('.modal-body').html('');
    modal.find('.modal-footer').html('');

    var body = modal.find('.modal-body');
    var foot = modal.find('.modal-footer');
    var footData = '<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>';

    if (type === 'make') {
        footData = '<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">取消</button>' +
            '<button type="button" class="btn btn-primary" onclick="make();" data-dismiss="modal">确定</button>';
    } else if (type === 'exchange') {
        footData = '<button type="button" onclick="cancel();" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">取消</button>' +
            '<button type="button" class="btn btn-primary" onclick="exchange(firstTimetable, secondTimetable);" data-dismiss="modal">确定</button>';
    } else if (type === 'publish') {
        if (enrollYear === '') {
            bodyData = "对不起，您还未选择要发布课表信息的年级！";
        } else {
            footData = '<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">取消</button>' +
                '<button type="button" class="btn btn-primary" onclick="changeStatus(\'2\')" data-dismiss="modal">确定</button>';
        }
    } else if (type === 'pass') {
        if (enrollYear === '') {
            bodyData = "对不起，您还未选择要通过课表审核的年级！";
        } else {
            footData = '<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">取消</button>' +
                '<button type="button" class="btn btn-primary" onclick="changeStatus(\'1\');" data-dismiss="modal">确定</button>';
        }
    } else if (type === 'refuse') {
        if (enrollYear === '') {
            bodyData = "对不起，您还未选择要驳回课表信息的年级！";
        } else {
            footData = '<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">取消</button>' +
                '<button type="button" class="btn btn-primary" onclick="changeStatus(\'3\');" data-dismiss="modal">确定</button>';
        }
    } else if (type === 'redirect') {
        footData = '<button type="button" onclick="window.location = \'' + value + '\';" class="btn btn-primary" data-dismiss="modal">确定</button>';
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
    classSelector.html('<option value="">请选择班级</option>');

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

    var status = $("#status").text();
    var url = "/teacher/academic/timetable/listInMake/" + classNo + "/" + year;
    if (status) {
        url = "/teacher/academic/timetable/list/" + classNo + "/" + year + "/" + status;
    }

    $.ajax({
        url: url,
        type: 'POST',
        dataType: 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (data) {
            if (status) {
                if (data.length === 0) {
                    myAlert("暂无该年级该状态的课表信息！");
                } else {
                    $("#timetable").removeAttr("style");
                    for (var i = 0; i < data.length; i++) {
                        var td = $('[num=' + data[i].time + ']');
                        td.html(data[i].teach.program.subject.subName + "<br>" + data[i].teach.teacher.teacherName + "<br>" + data[i].room.block.blockName + data[i].room.roomNo);
                    }
                }
            } else {
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
                    if (data.info[0].status !== 0) {
                        myAlert("本学年该年级课表已发布，请选择其他年级！");
                        return;
                    }
                    $("#teach").attr("style", "display:none");
                    $("#timetable").removeAttr("style");
                    for (var i = 0; i < data.info.length; i++) {
                        var td = $('[num=' + data.info[i].time + ']');
                        td.html(data.info[i].teach.program.subject.subName + "<br>" + data.info[i].teach.teacher.teacherName + "<br>" + data.info[i].room.block.blockName + data.info[i].room.roomNo);
                    }
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

var preExchange = function () {
    var year = $('#year').text();
    var classNo = $('#classNo').val();
    var timetableTds = $("#timetable [num]");
    exchangeBtn.attr("style", "display: none;");
    cancelBtn.removeAttr("style");

    timetableTds.attr("style", "background: #3CA9C4; cursor:pointer;");
    timetableTds.bind("click", function () {
        $(this).attr("style", "background: #33CC8F;");
        firstTimetable = $(this).attr("num");
        $(this).unbind();
        $.ajax({
            url: "/teacher/academic/timetable/preExchange/" + classNo + "/" + year + "/" + $("[num=" + firstTimetable + "]").attr("num"),
            type: 'POST',
            dataType: 'json',
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
                timetableTds.removeAttr("style");
                $("[num=" + firstTimetable + "]").attr("style", "background: #33CC8F;");
                timetableTds.unbind();
            },
            success: function (data) {
                if (data.length === 0) {
                    myAlert("对不起，您所选的课程无法与其他课程进行调换！");
                }
                for (var i = 0; i < data.length; i++) {
                    var timetable = data[i];
                    var num = timetable.time;
                    var td = $("[num=" + num + "]");
                    td.attr("style", "background: #3CA9C4; cursor:pointer;");
                    td.bind("click", function () {
                        secondTimetable = $(this).attr("num");
                        myAlert("您确定要讲选择的两节课进行调换吗？", "exchange");
                    });
                }
            }
        });
    });
};

var cancel = function () {
    exchangeBtn.removeAttr("style");
    cancelBtn.attr("style", "display: none;");
    var timetableTds = $("#timetable [num]");
    timetableTds.unbind();
    timetableTds.removeAttr("style");
};

var exchange = function (firstTimetable, secondTimetable) {
    $.ajax({
        url: "/teacher/academic/timetable/exchange/" + $('#year').text() + "/" + $('#classNo').val() + "/" + firstTimetable + "/" + secondTimetable,
        type: 'POST',
        dataType: 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
            $("[num=" + firstTimetable + "]").attr("style", "background: #33CC8F;");
            $("[num=" + secondTimetable + "]").attr("style", "background: #33CC8F;");
            var timetableTds = $("#timetable [num]");
            timetableTds.removeAttr("style");
            timetableTds.unbind();
        },
        success: function () {
            exchangeBtn.removeAttr("style");
            cancelBtn.attr("style", "display: none;");
            var firstTd = $("[num=" + firstTimetable + "]");
            var secondTd = $("[num=" + secondTimetable + "]");
            var firstData = firstTd.html();
            firstTd.html(secondTd.html());
            secondTd.html(firstData);
        }
    });
};

var changeStatus = function (status) {
    var enrollYear = $("#enrollYear").val();
    var year = $("#year").text();
    $.ajax({
        url: "/teacher/academic/timetable/changeStatus/" + year + "/" + enrollYear + "/" + status,
        type: 'POST',
        contentType: "application/json",
        dataType: 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (data) {
            if (data) {
                myAlert("操作成功！", 'redirect', "/teacher/academic/timetable/list/" + year + "/" + status);
            } else {
                myAlert("操作失败！");
            }
        }
    });
};