@Entry
@Component
struct EventCase {
  @State username: string = ""
  @State password: string = ""

  login() {
    if(this.username == "admin" && this.password == "123456") {
      this.getUIContext().getPromptAction().showDialog({
        message: "登录成功"
      })
    } else {
      this.getUIContext().getPromptAction().showDialog({
        message: "用户名或密码错误"
      })
    }
  }

  isEnabled() {
    return this.username != "" && this.password != ""
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        TextInput({ placeholder: '请输入用户名', text: this.username })
          .height(40)
          .onChange((value)=>{
            this.username = value
          })
        TextInput({ placeholder: '请输入密码', text: this.password })
          .height(40)
          .onChange((value)=>{
            this.password = value
          })
          .type(InputType.Password)
          .onSubmit(()=>{
            this.login()
          })
        Button("登录")
          .width('100%')
          .onClick(()=>{
            this.login()
          })
          .enabled(this.isEnabled())
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