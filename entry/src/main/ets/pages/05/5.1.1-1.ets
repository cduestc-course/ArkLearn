import { promptAction } from '@kit.ArkUI';
@Entry
@Component
struct Event {
  login(value :string) {
    // 监听系统组件的事件的话, 回调函数的参数都是有具体类型,一般的话不用给类型 (value:string)
    // promptAction.showToast({ message: value })
    this.getUIContext().getPromptAction().showToast({message:value})
  }

  build() {
    Row() {
      Column({ space: 15 }) {
        Row() {
          TextInput({ placeholder: '请输入用户名' })
            .backgroundColor('#f4f5f6')
            .width('100%')
            .onChange((value) => {
              this.login(value)
            })
            .onSubmit(() => {
              // AlertDialog.show({
              //   message:'登录失败'
              // })
              this.getUIContext().showAlertDialog({message:'登录失败'})
            })
        }.padding({
          left: 20,
          right: 20
        })

        Row() {
          Button("登录")
            .width('100%')
            .onClick(() => {
              // promptAction.showDialog({
              //   message: '登录成功'
              // })
              this.getUIContext().getPromptAction().showDialog({message: '登录成功'})
            })

        }.padding({
          left: 20,
          right: 20
        })

      }
      .width('100%')
    }
    .backgroundColor('#ccc')
    .height('100%')
  }
}