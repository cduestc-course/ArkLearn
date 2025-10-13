@Entry
@Component
struct ScrollCase {
  build() {
    Column() {
      Row()
        .width('100%')
        .height(50)
        .backgroundColor(Color.Red)
      Scroll(){
        Column() {
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
          ScrollItem()
        }
        .width('100%')
        .backgroundColor(Color.Orange)
      }
      .layoutWeight(1)
      Row()
        .width('100%')
        .height(50)
        .backgroundColor(Color.Blue)
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .width('100%')
    .height('100%')
  }
}
@Component
struct ScrollItem {
  build() {
    Row() {
      Text("滚动区域内容")
    }
    .width('100%')
    .height(80)
    .backgroundColor(Color.Pink)
    .borderRadius(8)
    .margin({
      top: 20,
      bottom: 10
    })
    .justifyContent(FlexAlign.Center)
  }
}