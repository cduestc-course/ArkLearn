import { FoodItem } from '../models'

@Component
struct MTBottom {
  @Consume
  showCart: boolean
  @StorageLink('cart_list')
  cartList: FoodItem[] = []
  getAllCount () {
    return this.cartList.reduce((preValue, item) => preValue + item.count, 0).toString()
  }
  getAllPrice () {
    return this.cartList.reduce((preValue, item) => preValue + item.count * item.price, 0).toFixed(2)
  }
  build() {
    Row() {
      Row() {
        Badge({
          value: this.getAllCount(),
          position: BadgePosition.Right,
          style: {
            badgeSize: 18
          }
        }) {
          Image($r('app.media.ic_public_cart'))
            .width(48)
            .height(70)
            .position({
              y: -20,
            })
        }
        .margin({
          left:25,
          right:10
        })
        .onClick(() => {
          this.showCart = !this.showCart
        })
        Column() {
          Text(){
            // span imageSpan
            Span("¥")
              .fontSize(12)
            Span(this.getAllPrice())
              .fontSize(24)
          }
          .fontColor($r("app.color.white"))
          Text("预估另需配送费¥5元")
            .fontColor($r("app.color.search_font_color"))
            .fontSize(14)
        }
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)

        Text("去结算")
          .height(50)
          .width(100)
          .backgroundColor($r("app.color.main_color"))
          .textAlign(TextAlign.Center)
          .borderRadius({
            topRight: 25,
            bottomRight: 25
          })
      }
      .height(50)
      .width('100%')
      .backgroundColor($r('app.color.bottom_back'))
      .borderRadius(25)
    }
    .width('100%')
    .padding(20)
  }
}

export default MTBottom
