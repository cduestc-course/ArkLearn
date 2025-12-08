import { router } from '@kit.ArkUI';

@Entry
@Component
struct RouterCase01 {
  @State message: string = 'RouterCase01';

  aboutToAppear(): void {
    this.getUIContext().getPromptAction().showToast({
      message: `页面数量:${this.getUIContext().getRouter().getLength()}
      路由参数:${JSON.stringify(this.getUIContext().getRouter().getParams())}
      页面状态:${JSON.stringify(this.getUIContext().getRouter().getState())}`
    })
  }

  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('push跳转02')
          .onClick(() => {
            // router.pushUrl({url:''})
            this.getUIContext().getRouter().pushUrl({
              url: 'pages/07/7.2.1-b'
            },router.RouterMode.Single)
          })
        Button('replace跳转02')
          .onClick(() => {
            this.getUIContext().getRouter().replaceUrl({
              url: 'pages/07/7.2.1-b'
            })
          })
        Button('clear清除记录')
          .onClick(() => {
            this.getUIContext().getRouter().clear()
            this.getUIContext().getPromptAction().showToast({
              message: '清空记录'
            })
          })
        Button('back返回')
          .onClick(() => {
            this.getUIContext().getRouter().showAlertBeforeBackPage({
              message: '确定要退出吗'
            })
            this.getUIContext().getRouter().back()
          })
        Button('携带参数跳转')
          .onClick(() => {
            this.getUIContext().getRouter().pushUrl({
              url: 'pages/07/7.2.1-b',
              params: {
                id: 1
              }
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}