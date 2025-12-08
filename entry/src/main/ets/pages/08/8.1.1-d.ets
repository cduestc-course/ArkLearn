@AnimatableExtend(Row)
function rotateExtend(angle: number) {
  .rotate({
    angle,
    centerX: 0,
    centerY: 0
  })
}

@Entry
@Component
struct AnimatableExtendCase {
  @State
  angle: number = 0
  @State
  bgColor: ResourceColor = '#ff00ff'

  aboutToAppear(): void {
  }

  build() {
    Column() {
      Row() {
        // 边
        Row()
          .width(140)
          .height(60)

          .position({
            left: '50%',
            top: '50%'
          })
          .rotateExtend(this.angle)
          .backgroundColor(this.bgColor)
          .animation({
            duration: 1000,
            iterations: -1,
            curve:Curve.Linear
          })
        // 内容
        Row() {
          Button('旋转')
            .onClick(() => {
              this.angle = 360
            })
            .backgroundColor(Color.Blue)
        }
        .width(200)
        .height(80)
        .backgroundColor(Color.Blue)
        .justifyContent(FlexAlign.Center)
      }
      .width(204)
      .height(84)
      .backgroundColor(Color.Transparent)
      .justifyContent(FlexAlign.Center)
      .clip(true)

    }
    .height('100%')
    .width('100%')
  }
}