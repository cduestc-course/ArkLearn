@Entry
@Component
struct KeyCase {

  build() {
    Column() {
      Row() {
        Text("顶部内容")
      }
      .justifyContent(FlexAlign.Center)
      .height(50)
      .width('100%')
      Column() {
        Text("中间内容")
      }
      .justifyContent(FlexAlign.Center)
      .backgroundColor(Color.Orange)
      .width('100%')
      .layoutWeight(1)
      Row() {
        TextInput({ placeholder: '请输入内容' })
          .width('100%')
      }
      .padding({
        left: 10,
        right: 10
      })
      .justifyContent(FlexAlign.Center)
      .height(50)
      .width('100%')
    }
    .width('100%')
    .height('100%')
  }
}