@Entry
@Component
struct Index {
  build() {
    Column(){
      Text('文本内间距')
        .backgroundColor(Color.Orange)
        .padding({
          left:20,
          top:20,
          right:5,
          bottom:50
        })
      Text('文本外间距')
        .backgroundColor(Color.Pink)
        .margin({
          left:10,
          top:10,
          right:10,
          bottom:10
        })
        .padding({left:50})
    }
  }
}