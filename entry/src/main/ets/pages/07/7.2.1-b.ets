import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
struct RouterCase02 {
  @State message: string = 'RouterCase02';

  aboutToAppear(): void {
    promptAction.showToast({
      message: `页面数量:${router.getLength()}
      路由参数:${JSON.stringify(router.getParams())}
      页面状态:${JSON.stringify(router.getState())}`
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
            router.pushUrl({
              url: 'pages/07/7.2.1-a'
            },router.RouterMode.Single)
          })
        Button('replace跳转02')
          .onClick(() => {
            router.replaceUrl({
              url: 'pages/07/7.2.1-a'
            })
          })
        Button('clear清除记录')
          .onClick(() => {
            router.clear()
            promptAction.showToast({
              message: '清空记录'
            })
          })
        Button('back返回')
          .onClick(() => {
            router.back()
          })
        Button('携带参数跳转')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/07/7.2.1-a',
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