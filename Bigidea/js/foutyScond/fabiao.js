Vue.component("component-fb", {
    template: `<div class="wrap">
		<ul id="pinglun">

		</ul>
		<div class="says">
			<h1>Comments(0) </h1>
             <h1 v-show="isshows"><a href="登录.html" class ="dl">登录</a>或者<a href="注册.html" class="dl">注册</a>后发表评论</h1>
			<textarea v-model="cont">评论</textarea><input id="fabu" v-on:click="fb" type="button"  value="发布">
			<div class="errmsg">请填写内容后再发布！</div>
		</div>

	</div>`,
    data:function(){
        return {
            cont: "",
            isshows: true
        }
    },
    beforeCreate: function () {
        _this = this;
    },
    created: function () {
        $.post("/user/loginUser", {}, function (res) {
            if (res.success) {
                if (res.data.UserName != "") {
                    _this.isshow = false;
                } else {
                    return;
                }
                _this.userName = res.data.UserName;
                _this.touXiang = res.data.HeadPicUrl;
            }

        }, "json");
    },
    methods: {
        fb: function () {
            var id = decodeURI(getQueryString("id"));
            id = id == "null" ? "" : id;
            if (_this.cont == "") {
                layer.msg("请输入内容");
            }
            $.post("/Combo/FaBiaos", { cont: _this.cont, id: id }, function (res) {
                if (res.success) {
                    if (res.message == "fang") {
                        layer.confirm("尚未登录，是否登录", function () {
                            window.location.href = "登录.html"
                        });
                        return;
                    }
                    layer.msg("评论成功");
                }
            }, "json");
        }
    }
})