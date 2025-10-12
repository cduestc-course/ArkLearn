@Entry
@Component
struct ComponentCase {
  @State message: string = 'Hello World'

  build() {
    Column() {
      // css 支持调整布局
      Row({ space: 15 }) {
        Column()
          .width(100)
          .height(200)
          .backgroundColor(Color.Pink)
        Column()
          .width(100)
          .height(200)
          .backgroundColor(Color.Red)
        Column()
          .width(100)
          .height(200)
          .backgroundColor(Color.Blue)
      }
      .width('100%')
      // .justifyContent(FlexAlign.Start)

      .justifyContent(FlexAlign.Center)

      // .justifyContent(FlexAlign.End)
      // .justifyContent(FlexAlign.SpaceBetween)
      // .justifyContent(FlexAlign.SpaceAround)
      // .justifyContent(FlexAlign.SpaceEvenly)
    }
    .width('100%')
    .height('100%')
  }
}