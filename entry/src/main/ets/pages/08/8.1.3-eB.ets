import { router } from '@kit.ArkUI';

@Entry
@Component
struct PageTransitionPage2 {
  @State message: string = 'PageTransitionPage2';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(30)
          .fontWeight(FontWeight.Bold)
        Button('push进入1')
          .onClick(()=>{
            router.pushUrl({
              url:'pages/08/8.1.3-eA'
            })
          })
        Button('pop进入1')
          .onClick(()=>{
            router.back()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}