import { FoodItem } from '../models'
import MTAddCut from './MTAddCut'

@Component
struct MTCartItem {
  item:FoodItem = new FoodItem()
  build() {
    Row() {
      Image(this.item.picture)
        .width(60)
        .aspectRatio(1)
        .borderRadius(8)
      Column({ space: 5 }) {
        Text(this.item.name)
          .fontSize(14)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
          .maxLines(2)
        Row() {
          Text() {
            Span('¥ ')
              .fontColor($r("app.color.font_main_color"))
              .fontSize(10)
            Span(this.item.price.toString())
              .fontColor($r("app.color.font_main_color"))
              .fontWeight(FontWeight.Bold)
          }
          MTAddCut({
            food:this.item
          })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 10, right: 10 })
    }
    .alignItems(VerticalAlign.Top)
  }
}
export default MTCartItem