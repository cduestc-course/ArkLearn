@Entry
@Component
struct Index {
  build() {
    Column() {
      Row(){
        Text('左侧')
          .layoutWeight(1)
          .height(40)
          .backgroundColor(Color.Pink)
        Text('中间')
          .layoutWeight(1)
          .height(40)
          .backgroundColor(Color.Orange)
        Text('右侧')
          .width(50)
          // .layoutWeight(1)
          .height(40)
          .backgroundColor(Color.Red)
      }
      .width(300)
      .height(40)

      Row(){

      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Gray)
  }
}