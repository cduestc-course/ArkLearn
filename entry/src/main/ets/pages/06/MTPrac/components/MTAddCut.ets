import { FoodItem } from '../models'
import { CartStore } from '../utils'

@Preview
@Component
struct MTAddCut {
  @StorageLink('cart_list')
  cartList: FoodItem[] = []
  food: FoodItem = new FoodItem()

  getCount(): number {
    const index = this.cartList.findIndex(listItem => listItem.id === this.food.id)
    return index < 0 ? 0 : this.cartList[index].count
  }

  build() {
    Row({ space: 8 }) {
      Row() {
        Image($r('app.media.ic_screenshot_line'))
          .width(10)
          .aspectRatio(1)
      }
      .width(16)
      .aspectRatio(1)
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r("app.color.white"))
      .borderRadius(4)
      .border({ width: 0.5, color: $r("app.color.main_color") })
      .visibility(this.getCount()>0?Visibility.Visible:Visibility.Hidden)
      .onClick(() => {
        CartStore.addCutCart(this.food, false)
      })

      Text(this.getCount().toString()).fontSize(14)
      Row() {
        Image($r('app.media.ic_public_add_filled'))
          .width(10)
          .aspectRatio(1)

      }
      .width(16)
      .aspectRatio(1)
      .justifyContent(FlexAlign.Center)
      .backgroundColor($r("app.color.main_color"))
      .borderRadius(4)
      .onClick(() => {
        CartStore.addCutCart(this.food)
      })
    }
  }
}

export default MTAddCut