@Entry
@Component
struct Layout {

  build() {
    Column() {
      RowCase()
      ColumnCase()
    }.height('100%').backgroundColor(Color.Grey)
  }
}

@Component
struct RowCase {
  build() {
    Row() {
      Column().height(150).width(100).backgroundColor(Color.Pink)
      Column().height(150).width(100).backgroundColor(Color.Red)
      Column().height(150).width(100).backgroundColor(Color.Blue)
    }
    .width('100%')
    .alignItems(VerticalAlign.Top)
    .justifyContent(FlexAlign.SpaceAround)
  }
}

@Component
struct ColumnCase {
  build() {
    Column() {
      Column().height(100).width(150).backgroundColor(Color.Pink)
      Column().height(100).width(150).backgroundColor(Color.Red)
      Column().height(100).width(150).backgroundColor(Color.Blue)
    }.height(400).width('100%').justifyContent(FlexAlign.SpaceEvenly)
  }
}