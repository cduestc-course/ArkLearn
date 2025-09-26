@Entry
@Component
struct Index {
  build() {
    Column() {
      Text('大王叫我来巡山')
        .width('100%')
        .height(200)
        .backgroundColor(Color.Pink)
        .backgroundImage($r('app.media.flower'))
        .backgroundImagePosition({
          x:'100',
          y:'50'
        })
        .fontWeight(700)
        .margin({
          top: 10,
          bottom: 40
        })
        .padding(20)
    }
    .width('100%')
    .height('100%')
    .padding(30)
    .backgroundImage($r('app.media.flowerbg'))
    .backgroundImageSize(ImageSize.Cover)
    .backgroundImagePosition(Alignment.Center)
  }
}