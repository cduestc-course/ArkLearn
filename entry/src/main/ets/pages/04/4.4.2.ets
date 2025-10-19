@Entry
@Component
struct RelativeCase {
  build() {
    RelativeContainer() {
      RelativeContainer() {
        Row(){}
        .width('33%')
        .aspectRatio(1) // ratio = width/height
        .alignRules({
          top: { anchor: '__container__', align: VerticalAlign.Top },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
          // top: { anchor: 'blue', align: VerticalAlign.Top },
          // right: { anchor: 'blue', align: HorizontalAlign.Start }
        })
        .backgroundColor(Color.Red)

        Row(){}
        .width('33%')
        .aspectRatio(1)
        .alignRules({
          bottom: { anchor: '__container__', align: VerticalAlign.Bottom },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .backgroundColor(Color.Yellow)

        Row(){}
        .width('33%')
        .aspectRatio(1)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          left: { anchor: '__container__', align: HorizontalAlign.Start }
        })
        .backgroundColor(Color.Blue)
        // .id('blue')

        Row(){}
        .width('33%')
        .aspectRatio(1)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          right: { anchor: '__container__', align: HorizontalAlign.End }
        })
        .backgroundColor(Color.Green)

      }
      .width('60%')
      .aspectRatio(1) // aspectRatio = width/height
      .backgroundColor(Color.Pink)
      .alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center },
        middle: { anchor: '__container__', align: HorizontalAlign.Center }
      })
    }
    .width('100%')
    .aspectRatio(1)
    .backgroundColor(Color.Gray)
  }
}