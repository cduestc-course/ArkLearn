import { FoodItem } from '../models'
import MTCartItem from './MTCartItem'

import { CartStore } from '../utils'

@Component
struct MTCart {
  @Consume
  showCart:boolean
  @StorageLink('cart_list')
  cartList:FoodItem[] = []
  build() {
    Column() {
      Blank()
        .backgroundColor('rgba(0,0,0,0.5)')
        .onClick(()=>{
          this.showCart = false
        })
      Column() {
        Row() {
          Text('购物车')
            .fontSize(12)
            .fontWeight(600)
          Text('清空购物车')
            .fontSize(12)
            .fontColor($r("app.color.search_font_color"))
            .onClick(()=>{
              CartStore.clearCarts()
            })
        }
        .width('100%')
        .height(40)
        .justifyContent(FlexAlign.SpaceBetween)
        .border({ width: { bottom: 0.5 }, color: $r("app.color.left_back_color") })
        .margin({ bottom: 10 })
        .padding({ left: 15, right: 15 })

        List({ space: 30 }) {
          ForEach(this.cartList, (item:FoodItem) => {
            ListItem() {
              MTCartItem({
                item:item
              })
            }
          },(item:FoodItem)=>item.id.toString())
        }
        .divider({
          strokeWidth: 0.5,
          color: $r("app.color.left_back_color")
        })
        .padding({ left: 15, right: 15, bottom: 100 })
      }
      .backgroundColor($r("app.color.white"))
      .borderRadius({
        topLeft: 16,
        topRight: 16
      })
    }
    .height('100%')
    .width('100%')
  }
}
export default MTCart