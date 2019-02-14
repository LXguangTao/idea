
//Html编码获取Html转义实体
function htmlEncode(value) {
    return $('<div/>').text(value).html();
}
//Html解码获取Html实体
function htmlDecode(value) {
    return $('<div/>').html(value).text();
}
//根据url查询字符串中的参数获取值
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return (r[2]); return null;
}
//json格式发过来的日期型字符串
String.prototype.toDateTime = function () {
    this.replace(/Date\([\d+]+\)/, function (a) { eval('d = new ' + a) });
    return d;
}
//去除头尾的空格
String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, '');
};
Date.prototype.format = function (format) {
    var o = {
        "M+": this.getMonth() + 1, //month 
        "d+": this.getDate(), //day 
        "h+": this.getHours(), //hour 
        "m+": this.getMinutes(), //minute 
        "s+": this.getSeconds(), //second 
        "q+": Math.floor((this.getMonth() + 3) / 3), //quarter 
        "S": this.getMilliseconds() //millisecond 
    }

    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    }

    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1 ? o[k] : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
}
String.prototype.toDateFromJson = function () {
    this.replace(/Date\([\d+]+\)/, function (a) { eval('d = new ' + a) });
    return d.format("yyyy-MM-dd");
}
String.prototype.toDateTimeFromJson = function () {
    this.replace(/Date\([\d+]+\)/, function (a) { eval('d = new ' + a) });
    return d.format("yyyy-MM-dd hh:mm:ss");
}
Number.prototype.toDateFromJson = function () {
    var d = new Date(this);
    return d.format("yyyy-MM-dd");
}