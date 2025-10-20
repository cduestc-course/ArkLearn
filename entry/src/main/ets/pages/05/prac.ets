@Entry
@Component
struct EventCase {
  username: string = ""
  password: string = ""
  build() {
    Row() {
      Column({ space: 20 }) {
        TextInput({ placeholder: '请输入用户名', text: this.username })
          .height(40)
        TextInput({ placeholder: '请输入密码', text: this.password })
          .height(40)
          .type(InputType.Password)
        Button("登录")
          .width('100%')
      }
      .padding({
        left: 20,
        right: 20
      })
      .width('100%')
    }
    .height('100%')
  }
}