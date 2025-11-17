import { FoodItem } from '../models'
import MTAddCut from './MTAddCut'

@Preview
@Component
struct MTFoodItem {
  food:FoodItem = new FoodItem()
  build() {
    Row() {
      Image(this.food.picture)
        .width(90)
        .aspectRatio(1)
      Column({ space: 5 }) {
        Text(this.food.name)
          .textOverflow({
            overflow: TextOverflow.Ellipsis,
          })
          .maxLines(2)
          .fontWeight(600)
        Text(this.food.description)
          .textOverflow({
            overflow: TextOverflow.Ellipsis,
          })
          .maxLines(1)
          .fontSize(12)
          .fontColor($r("app.color.food_item_second_color"))
        Text(this.food.tag)
          .fontSize(10)
          .backgroundColor($r("app.color.food_item_label_color"))
          .fontColor($r("app.color.font_main_color"))
          .padding({ top: 2, bottom: 2, right: 5, left: 5 })
          .borderRadius(2)
        Text() {
          Span('月销售'+this.food.month_saled)
          Span(' ')
          Span(`好评度${this.food.like_ratio_desc}%`)
        }
        .fontSize(12)
        .fontColor($r("app.color.black"))

        Row() {
          Text() {
            Span('¥ ')
              .fontColor($r("app.color.font_main_color"))
              .fontSize(10)
            Span(this.food.price.toString())
              .fontColor($r("app.color.font_main_color"))
              .fontWeight(FontWeight.Bold)
          }
          MTAddCut({
            food:this.food
          })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 10, right: 10 })
    }
    .padding(10)
    .alignItems(VerticalAlign.Top)
  }
}
export default MTFoodItem