// csrf头部信息
var header = $("meta[name='_csrf_header']").attr("content");
var token = $("meta[name='_csrf']").attr("content");
// 模态窗口
var modal = $('#modal');

/**
 *用于弹出模态框
 * @param body 模态框主体内容，包含html元素
 * @param type 弹框类型，根据类型判断要执行的具体内容
 * @param info 传入的数据，用于接下来的操作
 */
var myAlert = function (body, type, info) {
    modal.find('.modal-body').html(body);
    var foot = modal.find('.modal-footer');
    var footData = '<button type="button" class="btn btn-primary" data-dismiss="modal">确定</button>';

    if (type !== undefined) {
        if (type === 'remove') {
            footData = '<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">取消</button>' +
                '<button type="button" class="btn btn-primary" onclick="remove(' + info + ');" data-dismiss="modal">确定</button>';
        } else if (type === 'update') { //更新操作
            $.ajax({
                url: "/teacher/academic/program/show/" + info,
                type: 'POST',
                dataType: 'json',
                data: {
                    'id': info
                },
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function (data) {
                    var grade = data.gradeNo;
                    if (grade === '7') {
                        grade = '七年级'
                    } else {
                        grade = grade === '8' ? '八年级' : '九年级';
                    }

                    var examInput1 = '<input type="radio" value="1" id="exam3" name="exam1" class="custom-control-input">';
                    var examInput2 = '<input type="radio" value="0" id="exam4" name="exam1" class="custom-control-input">';
                    if (data.exam === '1') {
                        examInput1 = '<input type="radio" value="1" id="exam3" name="exam1" class="custom-control-input" checked>';
                    } else {
                        examInput2 = '<input type="radio" value="0" id="exam4" name="exam1" class="custom-control-input" checked>';
                    }

                    modal.find('.modal-body').html('<form>' +
                        '<label>编号：</label>' +
                        '<span>' + data.id + '</span><br>' +
                        '<label>学年：</label>' +
                        '<span>' + data.year + '</span><br>' +
                        '<label>年级：</label>' +
                        '<span>' + grade + '</span><br>' +
                        '<label>学科：</label>' +
                        '<span>' + data.subject.subName + '</span><br>' +
                        '<form class="form-group">' +
                        '<div class="form-group">' +
                        '<label for="name1" class="col-form-label">课程名称:</label>' +
                        '<input type="text" class="form-control" value="' + data.name + '" id="name1" name="name1"' +
                        '</div>' +
                        '<div class="form-group">' +
                        '<label for="amount1" class="col-form-label">学时:</label>' +
                        '<input type="number" class="form-control" value="' + data.amount + '" id="amount1" name="amount1">' +
                        '</div>' +
                        '<div class="form-group row">' +
                        '<label class="col-form-label col-sm-4 pt-0">考查方式</label>' +
                        '<div class="col-sm-8" id="exam1Div">' +
                        '<div class="custom-control custom-radio custom-control-inline">' +
                        examInput1 +
                        '<label class="custom-control-label" for="exam3">考试</label>' +
                        '</div>' +
                        '<div class="custom-control custom-radio custom-control-inline">' +
                        examInput2 +
                        '<label class="custom-control-label" for="exam4">考查</label>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</form>');

                    footData = '<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">取消</button>' +
                        '<button type="button" class="btn btn-primary" onclick="update(' + info + ');" data-dismiss="modal">保存</button>';

                    foot.html(footData);
                },
                error: function () {
                    myAlert('修改失败！');
                }
            });
        } else if (type === 'publish') {
            footData = '<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">取消</button>' +
                '<button type="button" class="btn btn-primary" onclick="changeStatus(\'2\');" data-dismiss="modal">确定</button>';
        } else if (type === 'pass') {
            footData = '<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">取消</button>' +
                '<button type="button" class="btn btn-primary" onclick="changeStatus(\'1\');" data-dismiss="modal">确定</button>';
        } else if (type === 'refuse') {
            footData = '<button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close">取消</button>' +
                '<button type="button" class="btn btn-primary" onclick="changeStatus(\'3\');" data-dismiss="modal">确定</button>';
        } else if (type === 'redirect') {
            footData = '<button type="button" onclick="window.location = ' + info + ';" class="btn btn-primary" data-dismiss="modal">确定</button>';
        }
    }
    foot.html(footData);
    modal.modal({show: true, backdrop: 'static'});
};

var insert = function () {
    var enrollYear = $("#enrollYear").val();
    var gradeNo = $("#gradeNo").val();
    var subNo = $("#subNo").val();
    var exam = $('input:radio:checked').val();
    var name = $("input[name='name']").val();
    var amount = $("input[name='amount']").val();
    if (name === '' || !/^\d{1,2}$/.test(amount)) {
        return;
    }

    $.ajax({
        url: "/teacher/academic/program/make",
        type: 'POST',
        dataType: 'json',
        data: {
            'grade.enrollYear': enrollYear,
            'name': name,
            'amount': amount,
            'exam': exam,
            'gradeNo': gradeNo,
            'subject.subNo': subNo
        },
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (data) {
            var tbody = $(".table-content");
            var exam = data.exam === '1' ? '考试' : '考查';
            var grade = data.gradeNo;
            if (grade === '7') {
                grade = '七年级'
            } else {
                grade = grade === '8' ? '八年级' : '九年级';
            }
            tbody.append('<tr id="' + data.id + '">' +
                '<td>' + data.id + '</td>' +
                '<td>' + data.year + '</td>' +
                '<td>' + data.name + '</td>' +
                '<td>' + data.amount + '</td>' +
                '<td name="' + data.exam + '">' + exam + '</td>' +
                '<td name="' + data.gradeNo + '">' + grade + '</td>' +
                '<td name="' + data.subject.subNo + '">' + data.subject.subName + '</td>' +
                '<td>' + '<button class="btn btn-sm btn-danger" onclick="myAlert(\'您确定要删除该条数据吗？\', \'remove\', ' + data.id + ')">删除</button>' + '</td>' +
                '<td>' + '<button class="btn btn-sm btn-primary" onclick="myAlert(\'\', \'update\', ' + data.id + ')">修改</button>' + '</td>' +
                '</tr>');
            myAlert('添加成功！');
        },
        error: function () {
            myAlert('添加失败！');
        }
    });
};

var listWithEdit = function (status) {
    var tbody = $(".table-content");
    tbody.html('');
    var enrollYear = $('#enrollYear').val();
    if (!/^\d{4}$/.test(enrollYear)) {
        return;
    }

    $.ajax({
        url: "/teacher/academic/program/list/" + status + '/' + enrollYear,
        type: 'POST',
        dataType: 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                var exam = data[i].exam === '1' ? '考试' : '考查';
                var grade = data[i].gradeNo;
                if (grade === '7') {
                    grade = '七年级';
                } else {
                    grade = grade === '8' ? '八年级' : '九年级';
                }
                tbody.append('<tr id="' + data[i].id + '">' +
                    '<td>' + data[i].id + '</td>' +
                    '<td>' + data[i].year + '</td>' +
                    '<td>' + data[i].name + '</td>' +
                    '<td>' + data[i].amount + '</td>' +
                    '<td name="' + data[i].exam + '">' + exam + '</td>' +
                    '<td name="' + data[i].gradeNo + '">' + grade + '</td>' +
                    '<td name="' + data[i].subject.subNo + '">' + data[i].subject.subName + '</td>' +
                    '<td>' + '<button class="btn btn-sm btn-danger" onclick="myAlert(\'您确定要删除该条数据吗？\', \'remove\', ' + data[i]['id'] + ')">删除</button>' + '</td>' +
                    '<td>' + '<button class="btn btn-sm btn-primary" onclick="myAlert(\'\', \'update\', ' + data[i]['id'] + ')">修改</button>' + '</td>' +
                    '</tr>');
            }
        }
    });
};

var list = function (status) {
    var tbody = $(".table-content");
    tbody.html('');
    var enrollYear = $('#enrollYear').val();
    if (!/^\d{4}$/.test(enrollYear)) {
        return;
    }

    $.ajax({
        url: "/teacher/academic/program/list/" + status + '/' + enrollYear,
        type: 'POST',
        dataType: 'json',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (data) {
            for (var i = 0; i < data.length; i++) {
                var exam = data[i].exam === '1' ? '考试' : '考查';
                var grade = data[i].gradeNo;
                if (grade === '7') {
                    grade = '七年级';
                } else {
                    grade = grade === '8' ? '八年级' : '九年级';
                }
                tbody.append('<tr id="' + data[i].id + '">' +
                    '<td>' + data[i].id + '</td>' +
                    '<td>' + data[i].year + '</td>' +
                    '<td>' + data[i].name + '</td>' +
                    '<td>' + data[i].amount + '</td>' +
                    '<td name="' + data[i].exam + '">' + exam + '</td>' +
                    '<td name="' + data[i].gradeNo + '">' + grade + '</td>' +
                    '<td name="' + data[i].subject.subNo + '">' + data[i].subject.subName + '</td>' +
                    '</tr>');
            }
        }
    });
};

var remove = function (id) {
    $.ajax({
        url: "/teacher/academic/program/remove/" + id,
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

var update = function (id) {
    var name = $('#name1').val();
    var examDiv = $('#exam1Div');
    var examRadio = examDiv.find("input[type='radio']:checked");
    var exam = examRadio.val();
    var amount = $('#amount1').val();
    $.ajax({
        url: "/teacher/academic/program/update",
        type: 'POST',
        dataType: 'json',
        data: {
            id: id,
            name: name,
            amount: amount,
            exam: exam
        },
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (data) {
            if (data) {
                var tr = $('#' + id);
                tr.children().eq(2).text(name);
                tr.children().eq(3).text(amount);
                tr.children().eq(4).text(exam === '1' ? '考试' : '考查');
                myAlert("更新成功！");
            } else {
                myAlert("更新失败！");
            }
        }
    });
};

var listByStatus = function (status, isAcademic) {
    if (isAcademic !== 'false' && (status === '0' || status === '3')) {
        listWithEdit(status);
    } else {
        list(status);
    }
};

var changeStatus = function (status) {
    var ids = [];
    var tbody = $('tbody');
    var trs = tbody.find('tr');
    if (trs.length === 0) {
        setTimeout(function () {
            myAlert("还没有任何数据！");
        }, 300);
    } else {
        for (var i = 0; i < trs.length; i++) {
            var tds = $(trs[i]).find('td');
            ids.push($(tds[0]).text());
        }
        $.ajax({
            url: "/teacher/academic/program/changeStatus/" + status,
            type: 'POST',
            contentType: "application/json",
            dataType: 'json',
            data: JSON.stringify(ids),
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function (data) {
                if (data) {
                    myAlert("更新成功！", 'redirect', "/teacher/academic/program/list/" + status);
                } else {
                    myAlert("更新失败！");
                }
            }
        });
    }
};