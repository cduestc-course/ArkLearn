@Entry
@Component
struct GridCase {
  build() {
    Grid() {
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
      GridItemCase()
    }
    .width("100%")
    .height("100%")
    .columnsTemplate("1fr 1fr")
    .columnsGap(50)
    .rowsGap(10)
    .padding(10)

  }
}

@Component
struct GridItemCase {
  build() {
    GridItem() {
      Row() {
        Column() {
          Text("内容")
        }
        .width('100%')
      }
      .height(200)
      .borderRadius(4)
      .backgroundColor(Color.Pink)
    }

  }
}