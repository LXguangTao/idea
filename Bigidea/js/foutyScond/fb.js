window.onload = function () {
    var oWrap = document.getElementsByClassName("wrap");
    var oTextarea = document.getElementsByTagName("textarea")[0];
    var oBtn = document.getElementById("fabu");
    var oUl = document.getElementById("pinglun");
    var errMsg = document.getElementsByClassName("errmsg")[0];
    var oA = document.getElementsByTagName("a");
    //console.log(oA);
    var t = new Date();
    var Year = t.getFullYear();
    var Month = t.getMonth() + 1;
    var Day = t.getDate();
    var Hours = t.getHours();
    var Minutes = t.getMinutes();
    var Scondes = t.getSeconds();
    var timers = toString(Year) + "年" + toString(Month) + "月" + toString(Day) + "日" + toString(Hours) + ":" + toString(Minutes) + ":" + toString(Scondes);//将获取到的日期对象拼接。
    //console.log(timers);

    function toString(n)//数字转字符串
    {
        if (n < 9) {
            n = "0" + n;
        }
        else {
            n = "" + n;
        }
        return n;
    };
    
    oBtn.onclick = function () {
        if (oTextarea.value == "") {
            startMove(errMsg, { opacity: 100 });
            //console.log(errMsg.style.opacity)
            oTextarea.select();
        }
        else {
            
            var aUl = document.createElement("ul");
            var aLi1 = document.createElement("li");
            var aLi2 = document.createElement("li");
            var aImg = document.createElement("img");
            var aSpan1 = document.createElement("span");
            var aSpan2 = document.createElement("span");
            aLi2.className = "li";
            $.post("/Combo/GetFile", function (res) {
                for (var i = 0; i < res.data.length; i++) {
                    //console.log(res.data[i].length);
                    console.log(oTextarea.value.indexOf(res.data[i]));
                    if (oTextarea.value.indexOf(res.data[i]) != -1) {

                        var fff = oTextarea.value.substring(oTextarea.value.indexOf(res.data[i]), res.data[i].length);
                        console.log(fff);
                        var reg = "/" + fff + "/g";
                        aLi2.innerHTML = oTextarea.value.replace(eval(reg), "***")
                        console.log(oTextarea.value.replace(eval(reg), "***"));
                    } else {
                        aLi2.innerHTML = oTextarea.value;
                    }

                }
            }, "json");
            aSpan2.innerHTML = "刚刚";
            aSpan2.className = "span";
            $.post("/Combo/createli", function (res) {
                aImg.src = "/" + res.data.HeadPicUrl;
                aImg.className = "img-circle";
                aImg.style = "border: 2px solid #A9B7B7;width:35px";
                aSpan1.innerHTML = res.data.UserName;
                if (oUl.children.length > 0) {
                    oUl.insertBefore(aUl, oUl.children[0]);
                    aUl.appendChild(aLi1);
                    aUl.appendChild(aLi2);
                    aLi1.appendChild(aImg);
                    aLi1.appendChild(aSpan1);
                    aLi2.appendChild(aSpan2);
                    oTextarea.value = "";
                }
                else {
                    oUl.appendChild(aUl);
                    aUl.appendChild(aLi1);
                    aUl.appendChild(aLi2);
                    aLi1.appendChild(aImg);
                    aLi1.appendChild(aSpan1);
                    aLi2.appendChild(aSpan2);
                    oTextarea.value = "";
                };
            }, "json");
            
            var aUlHeight = parseInt(getStyle(aUl, "height"));
            //console.log(aLiHeight);
            aLi1.style.height = "57";
            aLi2.style.height = "57";
            aLi1.style.opacity = "1";
            aLi2.style.opacity = "1";
            aUl.style.opacity = "1";
            startMove(aUl, { height: aUlHeight }, function () {
                startMove(aUl, { opacity: 100 });
            });
            
        }
    };    
};

//运动框架
function startMove(obj, json, endFn) {
    clearInterval(obj.timer);
    obj.timer = setInterval(
        function () {
            var iStop = true;
            for (var curr in json) {
                var oNumber = 0;
                if (curr == "opacity") {
                    oNumber = Math.round(parseFloat(getStyle(obj, curr)) * 100);
                }
                else {
                    oNumber = parseInt(getStyle(obj, curr));
                }
                var speed = (json[curr] - oNumber) / 6;
                speed = speed > 0 ? Math.ceil(speed) : Math.floor(speed);
                if (oNumber != json[curr])
                    iStop = false;
                if (curr == "opacity") {
                    obj.style.filter = "alpha(opacity:" + (oNumber + speed) + ")";
                    obj.style.opacity = (oNumber + speed) / 100;
                }
                else {
                    obj.style[curr] = oNumber + speed + "px";
                }
            };
            if (iStop) {
                clearInterval(obj.timer);
                if (endFn) endFn();
            }
        }, 30);
};

//获取非行间样式
function getStyle(obj, name) {
    if (obj.currentStyle) {
        obj = currentStyle[name];
    }
    else {
        obj = getComputedStyle(obj, false)[name];
    }
    return obj;
};