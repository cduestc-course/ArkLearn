@Entry
@Component
struct Index {
  build() {
    Column() {
      Text('aaa')
        .width(80)
        .height(80)
        .backgroundColor(Color.Green)
        // .zIndex(-2)
      Text('bbb')
        .width(80)
        .height(80)
        .backgroundColor(Color.Yellow)
        // .position({
        //   x: 50,
        //   y: 50
        // })
        // translate or offset
        // .zIndex(-1)
      Text('ccc')
        .width(80)
        .height(80)
        .backgroundColor(Color.Orange)
        // .zIndex(0)
    }
    .width(300)
    .height(300)
    .backgroundColor(Color.Pink)
  }
}