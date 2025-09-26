//代码块
@Entry
@Component
struct Index {
  build() {
    Column() {
      Text('大王叫我来巡山')
        .fontWeight(700)
        .margin({
          top: 10,
          bottom: 40
        })
        .border({
          width:1,
          color:Color.Red,
          style:BorderStyle.Dotted
        })
      Text('大王叫我来巡山')
        .fontWeight(700)
        .margin({
          top: 10,
          bottom: 40
        })
        .border({ //JSON
          width:{left:3,right:1},
          color:{left:Color.Red,right:Color.Green},
          style:{
            left: BorderStyle.Solid,
            right:BorderStyle.Dashed
          }
        })
    }

    .width('100%')
    .padding(30)
  }
}