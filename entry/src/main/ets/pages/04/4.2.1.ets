@Entry
@Component
struct Index {
  build() {
    Flex(
      {
      direction : FlexDirection.Column,
      justifyContent: FlexAlign.SpaceBetween,
      alignItems: ItemAlign.Center,
      wrap: FlexWrap.Wrap
    }
    ) { //默认情况下为Row组件
      Text().width(100).height(100).backgroundColor(Color.Pink).border({width:1})
      Text().width(80).height(80).backgroundColor(Color.Pink).border({width:1})
      Text().width(80).height(80).backgroundColor(Color.Pink).border({width:1})
      Text().width(80).height(80).backgroundColor(Color.Pink).border({width:1})
      Text().width(80).height(80).backgroundColor(Color.Pink).border({width:1})
      Text().width(80).height(80).backgroundColor(Color.Pink).border({width:1})
    }
    .width('100%')
    .height(300)
    .backgroundColor(Color.Gray)
    .padding(20)
  }
}