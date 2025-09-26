@Entry
@Component
struct Index {
  build() {
    Column() {
      Text()
        .width(200).height(100)
        .backgroundColor(Color.Pink)
        .border({ width: 2 })
      Text()
        .width(200).height(100)
        .backgroundColor(Color.Pink)
        .border({ width: 2 })
        .margin({ top: 5, bottom: 5 })
      Text()
        .width(200).height(100)
        .backgroundColor(Color.Pink)
        .border({ width: 2 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ccc')
    //.justifyContent(FlexAlign.Center)
    //.justifyContent(FlexAlign.SpaceBetween)
    //.justifyContent(FlexAlign.SpaceAround)
    //.justifyContent(FlexAlign.SpaceEvenly)
    //.alignItems(HorizontalAlign.Start)
    //.alignItems(HorizontalAlign.Center)
    //.alignItems(HorizontalAlign.End)
  }
}