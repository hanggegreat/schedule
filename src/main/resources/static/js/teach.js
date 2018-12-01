// csrf头部信息
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");

/**
 *用于弹出模态框
 * @param body 模态框主体内容，包含html元素
 * @param type 弹框类型，根据类型判断要执行的具体内容
 * @param info 传入的数据，用于接下来的操作
 */
var myAlert = function (body, type, info) {
    // 模态窗口
    var modal = $('#modal');
    modal.find('.modal-body').html(body);
    var foot = modal.find('.modal-footer');
    var footData = '<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>';

    if (type !== undefined) {
        if (type === 'remove') {
            footData = '<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">取消</button>' +
                '<button type="button" class="btn btn-primary" onclick="remove(' + info + ');" data-dismiss="modal">确定</button>';
        } else if (type === 'update') { //更新操作
            $.ajax({
                url: "/teacher/subLeader/teach/show/" + info,
                type: 'POST',
                dataType: 'json',
                data: {
                    'id': info
                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function (data) {
                    var teachNo = data.teachNo;
                    var program = data.program;
                    var subject = program.subject;
                    var subNo = subject.subNo;

                    var bodyData = '<form>' +
                        '<div class="form-group row">' +
                        '<label class="col-form-label col-sm-2 pt-0">教师</label>' +
                        '<select class="custom-select col-sm-6" name="teacherNo1" id="teacherNo1">' +
                        '</select>' +
                        '</div>';

                    modal.find('.modal-body').html(bodyData);

                    addTeacher(teachNo.substring(4, 5), subNo, '#teacherNo1');

                    footData = '<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">取消</button>' +
                        '<button type="button" class="btn btn-primary" onclick="update(' + info + ');" data-dismiss="modal">保存</button>';

                    foot.html(footData);
                },
                error: function () {
                    myAlert('修改失败！');
                }
            });
        }
    }
    foot.html(footData);
    modal.modal({show: true, backdrop: 'static'});
};

var remove = function (id) {
    $.ajax({
        url: "/teacher/subLeader/teach/remove/" + id,
        type: 'POST',
        dataType: 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (data) {
            if (data) {
                myAlert("删除成功！");
                $('#' + id).remove();
            } else {
                myAlert("删除失败！");
            }
        }
    });
};

var insert = function () {
    var classNo = $("#tClass\\.classNo").val();
    var teacherNo = $("#teacher\\.teacherNo").val();
    var year = $("#year").text();

    if (!/^\d{6}$/.test(classNo) || !/^\d{4}$/.test(teacherNo)) {
        return;
    }

    $.ajax({
        url: "/teacher/subLeader/teach/make",
        type: 'POST',
        dataType: 'json',
        data: {
            'classNo': classNo,
            'teacherNo': teacherNo,
            'year': year
        },
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (data) {
            var id = data.id;
            var teachNo = data.teachNo;
            var program = data.program;
            var tClass = data.tClass;
            var className = tClass.className;
            var programId = program.id;
            var programName = program.name;
            var teacher = data.teacher;
            var teacherName = teacher.teacherName;

            var tbody = $(".table-content");
            tbody.append('<tr id="' + id + '">' +
                '<td>' + teachNo + '</td>' +
                '<td>' + className + '</td>' +
                '<td>' + teacherName + '&nbsp;&nbsp;&nbsp;\n' +
                '<button class="btn btn-sm btn-outline-primary" onclick="myAlert(\'\', \'update\', ' + id + ');">更换</button>' +
                '</td>' +
                '<td>' + programId + '</td>' +
                '<td>' + programName + '</td>' +
                '<td>' + '<button class="btn btn-sm btn-outline-danger" onclick="myAlert(\'您确定要删除该条数据吗？\', \'remove\', ' + id + ');">删除</button>' + '</td>' +
                '</tr>');
            myAlert('添加成功！');
        },
        error: function () {
            myAlert('添加失败！');
        }
    });
};

var update = function (id) {
    var teacherNo = $('#teacherNo1').val();
    $.ajax({
        url: "/teacher/subLeader/teach/update",
        type: 'POST',
        dataType: 'json',
        data: {
            id: id,
            teacherNo: teacherNo
        },
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (data) {
            if (data) {
                var tr = $('#' + id);
                tr.children().eq(0).text(data.teachNo);
                var teacherTd = tr.children().eq(2);
                teacherTd.html(data.teacher.teacherName + '&nbsp;&nbsp;&nbsp;&nbsp;<button class="btn btn-sm btn-outline-primary" onclick="myAlert(\'\', \'update\', ' + data.id + ');">更换</button>');
                myAlert("更新成功！");
            } else {
                myAlert("更新失败！");
            }
        }
    });
};


var addTeacher = function (gradeNo, subNo, selectName) {
    var teacherSelect1 = $(selectName);
    teacherSelect1.html('');

    if (!/^\d$/.test(gradeNo) || !/^\d{2}$/.test(subNo)) {
        return;
    }

    $.ajax({
        url: "/teacher/list/" + gradeNo + "/" + subNo,
        type: 'POST',
        dataType: 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                teacherSelect1.append('<option value="' + data[i].teacherNo + '">' + data[i].teacherName + '</option>');
            }
        }
    });
};