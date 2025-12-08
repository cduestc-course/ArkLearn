@Entry
@Component
struct SharedElementCase02 {
  @State message: string = 'SharedElementCase02';

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
      Image($r('app.media.profile'))
        .width(50)
        .position({
          x: 20,
          y: 20
        })
        .sharedTransition('sharedId', {
          duration: 2*1000
        })

    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}