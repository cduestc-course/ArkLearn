import { router } from '@kit.ArkUI';

@Entry
@Component
struct SharedElementCase01 {
  @State message: string = 'SharedElementCase01';

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Image($r('app.media.profile'))
        .width(200)
        .sharedTransition('sharedId')
      Button('登录')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/08/8.1.3-aB'
          })
        })
    }
    .width('100%')
    .height('100%')
  }
}