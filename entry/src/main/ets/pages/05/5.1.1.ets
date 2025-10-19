import { promptAction } from '@kit.ArkUI';
@Entry
@Component
struct Event {

  build() {
    Row() {
      Column({ space: 15 }) {
        Row() {
          TextInput({ placeholder: '请输入用户名' })
            .backgroundColor('#f4f5f6')
            .width('100%')
            .onChange((value) => {
              promptAction.showToast({ message: value })
            })
            .onSubmit(() => {
              AlertDialog.show({
                message:'登录失败'
              })
            })
        }.padding({
          left: 20,
          right: 20
        })

        Row() {
          Button("登录")
            .width('100%')
            .onClick(() => {
              promptAction.showDialog({
                message: '登录成功'
              })
            })

        }.padding({
          left: 20,
          right: 20
        })

      }
      .width('100%')
    }
    .height('100%')
  }
}