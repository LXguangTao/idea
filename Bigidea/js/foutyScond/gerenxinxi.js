Vue.component("component-mfxz", {
    template: `<div>
    <h2>完善个人信息即可免费下载</h2>
    <br/>
    <span style="font-weight:bold;font-size:18px">Download Free Magazine Now</span>
    <form class="layui-form" id="subForm">
        <div class ="layui-form-item">
        <br/>
            <label for="L_username" class="layui-form-label">
                <span class="x-red">*</span>用户名
            </label>
            <div class="layui-input-inline">
                <input  type="text" id="R_username" v-model="yhm"  required="" name="User" required=""
                autocomplete="off" class ="layui-input ">
                       <span v-bind:style="yh">用户名不能为空</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_email" class="layui-form-label">
                <span class="x-red">*</span>邮箱
            </label>
            <div class="layui-input-inline">
                <input type="email" id="L_email" v-model="yx" name="email" required="" lay-verify="email"
                       autocomplete="off" class ="layui-input ">
                       <span v-bind:style="ema"> 请输入正确邮箱</span>
            </div>
        </div>
        <div class="layui-form-item">
            <label for="L_username" class="layui-form-label">
                <span class="x-red">*</span>公司
            </label>
            <div class="layui-input-inline">
                <input type="text" id="L_username" v-model="gs" name="username" required="" lay-verify="nikename"
                       autocomplete="off" class ="layui-input ">
                       <span v-bind:style="js"> 请输入公司名称</span>
            </div>
        </div>
    </form>
    <div style="font-weight:bold;font-size:18px;" v-on: click="mf"><a style="text-decoration:none;" href="#" id="cb">免费下载</a></div>
</div>`,
    data: function () {
        return {
            yhm: '',
            yx: '',
            gs: '',
            yh: {
                color: '',
                display:'none'
            },
            ema: {
                color: '',
                display:'none'
            },
            js: {
                color: '',
                display:'none'
            }
        }
    },
    methods: {
        mf: function () {
           
            if (this.yhm == "" || this.yx == "" || this.gs == "") {
                this.yh.color = "red";
                this.yh.display = "block";
                this.ema.color = "red";
                this.ema.display = "block";
                this.js.color = "red";
                this.js.display = "block";
            } else {
                $("#cb").attr({ href: "/downLoad/42/42-1st issue-Combo MKT.pdf", download: "内容" });
                this.yh.display = "none";
                this.ema.display = "none";
                this.js.display = "none";
            }

        }
    }
     

    
})
