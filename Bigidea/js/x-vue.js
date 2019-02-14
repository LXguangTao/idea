
Vue.component("component-header", {
    template: `<header id="header">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <ul class="list-inline" style="margin-left:0px">
                        <li><a href="Shouye.html"><img src="/images/head-1.png" /></a></li>
                        <li><a href="ZuiXinAnLi.html">每日最新案例</a></li>
                        <li><a href="案例研究所.html">案例研究所</a></li>
                        <li><a href="资源下载.html">资源下载</a></li>
                        <li><a href="42.html"><img src="/images/head-2.png" /></a></li>
                        <li><a href="Bigbang.html">BigBang思享会</a></li>
                        <li class="header-right1"><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
                        <li class="header-right1"><a href="#">|</a></li>
                        <li class="header-right1" v-show="noLogin"><a href="注册.html">注册</a></li>
                        <li class ="header-right1" v-show="noLogin">/</li>
                        <li class ="header-right1" v-show="noLogin"><a href="登录.html">登录</a></li>
                        <li class ="dropdown" v-show="isshow">
                            <a href="" class ="dropdown-toggle" data-toggle="dropdown">
                                <img :src="'/'+touXiang" class ="img-circle" style="border: 2px solid #A9B7B7;" width="35px" alt="">
                                <span v-text="userName"></span>
                            </a>
                            <ul class ="dropdown-menu ">
                                <li><a href="个人主页.html">个人主页 </a></li>
                                <li><a href="javascript:;" v-on:click="SignOut">退出登录</a></li>                                
                            </ul>                            
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </header>`,
    data:function(){
        return {
            touXiang:'',
            userName: '',
            isshow: false,
            noLogin:true
        }
    },
    beforeCreate: function () {
        _this = this;
    },
    created: function () {
        $.post("/user/loginUser", {  }, function (res) {
            if (res.success) {
                if (res.data.UserName != "") {
                    _this.isshow = true;
                    _this.noLogin = false;
                } else {
                    return;
                }
                _this.userName = res.data.UserName;
                _this.touXiang = res.data.HeadPicUrl;
            }
            
        }, "json");        
    },
    methods: {
        SignOut: function () {
            $.post("/User/SignOut", function (res) {
                if (res.success) {
                    window.location.href = "登录.html";
                }
            }, "json");
        }
    }
});

Vue.component("component-footer", {
    template: `<footer id="footer">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div id="footer-top"><img src="/images/foot.png" /></div>
                    <div id="footer-middle">关于我们 ABOUT US | 联系我们 CONTACT | 加入我们 JOIN US | 广告服务 ADVERTISE | 免责声明 PRIVACY</div>
                    <div id="footer-bottom">京ICP备15006447号/京ICP证号 | Copyright 2015-2018 www.pitchina.com.cn</div>
                </div>
            </div>
        </div>
    </footer>`,
});