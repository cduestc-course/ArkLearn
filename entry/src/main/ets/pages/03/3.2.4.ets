//代码块
@Entry
@Component
struct Index {
  build() {
    Column(){
      //Image
      Image($r('app.media.shoes'))
        .width(200)
      Text('耐克限定款')
        .width(200)
        .height(30)
      Row(){
        //Image
        Image($r('app.media.profile'))
          .width(20)
        Text('用户名称')
      }.width(200)
    }.width('100%')
  }
}