@Entry
@Component
struct EventCase {
  ifelse() {
    let i = 0
    if(i<0) {
      //xxx
    }
    else if(i>100) {
      //xxx
    }
  }
  // 登录方法
  login() {
    this.getUIContext().getPromptAction().showToast({ message: '登录成功' })
  }
  loginToButton(){
    this.getUIContext().getPromptAction().showToast({ message: '登录失败' })
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Image('https://www.baidu.com/img/PCtm_d9c8750bed0b3c7d089fa7d55720d6cf.png')
          .width(200)
          .onAreaChange((oldValue:Area, newValue:Area)=>{
            this.getUIContext().showAlertDialog({
              message:`oldValue:${JSON.stringify(oldValue)}\n newValue:${JSON.stringify(newValue)}`
            })
          })
        TextInput({ placeholder: '请输入用户名', text:'' })
          .height(40)
          .onChange((value) => {
            this.getUIContext().getPromptAction().showToast({ message: value })
          })
        TextInput({ placeholder: '请输入密码', text: '' })
          .height(40)
          .onChange((value) => {
            this.getUIContext().getPromptAction().showToast({ message: value })
          })
          .type(InputType.Password)
          .onSubmit(() => {
            this.login()
          })
        Button("登录")
          .enabled(false)
          .width('100%')
          .onClick(this.loginToButton)//?
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