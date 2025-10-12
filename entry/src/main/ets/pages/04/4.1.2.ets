@Entry
@Component
struct ComponentCase {
  @State message: string = 'Hello World'

  build() {
    Column({ space: 10 }) {
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

      Column({ space: 15 }) {
        Column()
          .width(200)
          .height(100)
          .backgroundColor(Color.Pink)
        Column()
          .width(200)
          .height(100)
          .backgroundColor(Color.Red)
        Column()
          .width(200)
          .height(100)
          .backgroundColor(Color.Blue)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)

    }
    .width('100%')
    .height('100%')
  }
}