//代码块
@Entry
@Component
struct Index {
  build() {
    Column({ space: 15 }) {
      TextInput({
        placeholder: '请输入用户名'
      })
      TextInput({
        placeholder: '请输入密码'
      }).type(InputType.Password)
      Button('登录')
        .width(200)
    }
  }
}