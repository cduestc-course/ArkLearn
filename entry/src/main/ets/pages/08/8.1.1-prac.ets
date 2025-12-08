@Entry
@Component
struct HeartBeatAnimation {
  @State sscale: number = 50
  @State color: ResourceColor = Color.Gray
  @State clicked: boolean = false

  build() {
    Column() {
      // 点赞图标
      Row(){
        SymbolGlyph($r('sys.symbol.heart_fill'))
          .fontSize(this.sscale)
          .fontColor([this.color])
          .animation({
            duration: 500,
            iterations: -1,
            // 动画曲线
            curve:Curve.Smooth,
            // 播放模式
            playMode:PlayMode.Alternate
          })
      }

      Row(){
        Button('跳动')
          .onClick(() => {
              this.sscale = 80
              this.color = Color.Red
        })
      }.margin({top:30})
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}