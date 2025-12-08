@Entry
@Component
struct ComAnCase {
  @State
  showImage: boolean = false

  build() {
    Row() {
      Column({ space: 20 }) {
        Column() {
          if(this.showImage) {
            Image($r("app.media.profile"))
              .width(100)
              .height(100)
              .borderRadius(50)
              .transition(
                TransitionEffect.translate({x:'-200%'}).animation({duration:2000})
                  .combine(TransitionEffect.rotate({angle:360}).animation({duration:1000}))
              )
          }
        }
        .height(100)
        .width('100%')

        Button("显示/隐藏")
          .onClick(() => {
            this.showImage = !this.showImage
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}