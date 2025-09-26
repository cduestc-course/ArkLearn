@Entry
@Component
struct Index {
  build() {
    Column(){
      Text('我是圆角')
        .width(100)
        .height(60)
        .backgroundColor(Color.Pink)
        .borderRadius({
          topLeft:10,
          topRight:20,
          bottomLeft:30,
          bottomRight:40
        })
    }
  }
}