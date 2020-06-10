<%@page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>乐购-注册</title>
    <link rel="stylesheet" href="style.css" />
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.5.1/jquery.js"></script>
    <link
      href="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.css"
      rel="stylesheet"
    />
    <script src="https://cdn.bootcdn.net/ajax/libs/twitter-bootstrap/4.5.0/js/bootstrap.js"></script>
  </head>
  <body>
    <div class="page-container">
      <div class="window-box">
        <div class="logo-title-line">
          <img
            class="logo-img"
            src="https://kairz-1258976754.cos.ap-shanghai.myqcloud.com/logo.png"
            alt=""
          />
          <div class="title-text">乐购-用户注册</div>
        </div>
        <div class="form-box">
          <form onsubmit="return false">
            <div class="form-group">
              <label>用户名</label>
              <input
                type="text"
                id="name-input"
                class="form-control"
                placeholder="请输入用户名"
              />
            </div>
            <div class="form-group">
              <label>密码</label>
              <input
                type="password"
                class="form-control"
                id="password-input"
                placeholder="请输入密码"
              />
            </div>
            <div class="btn-box">
              <button class="btn btn-outline-primary">
                <a href="login.jsp">去登录？</a>
              </button>
              <button class="btn btn-outline-primary" onClick="register()">
                注册
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
  <script>
      function register() {
      if ($('#name-input').val() == '') {
        alert('用户名不得为空！')
      } else {
        if ($('#password-input').val() == '') {
          alert('密码不得为空！')
        } else {
          // 发送登录请求
          $.ajax({
            method: 'POST',
            url: 'http://localhost:8080/shopping/user/register',
            data: {
              userName: $('#name-input').val(),
              password: $('#password-input').val(),
            },
            success: function (res) {
              console.log(res)
              if (res == '200') {
                alert('注册成功')
                window.location.href =
                  'http://localhost:8080/shopping/user/login.jsp'
              } else {
                alert('注册失败')
              }
            },
            error: function (err) {
              console.log(err)
              alert('注册失败')
            },
          })
        }
      }
    }
  </script>
</html>
