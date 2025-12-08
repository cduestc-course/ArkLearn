@Entry
@Component
struct AnimationCase {
  @State message: string = 'Hello World';

  @State
  textSize :number = 50
  build() {
    Row() {
      Column({space:20}) {
        Text(this.message)
          .fontSize(this.textSize)
          .fontWeight(FontWeight.Bold)
          .animation({
            // 动画时间
            duration:1000,
            // 重复次数，-1代表不重复
            iterations:3,
            // 动画曲线
            curve:Curve.Smooth,
            // 延迟时间
            delay:1000,
            // 播放模式
            playMode:PlayMode.Alternate
          })
        Button('变小')
          .onClick(()=>{
            this.textSize = 16
          })
        Button('变大')
          .onClick(()=>{
            this.textSize = 50
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}