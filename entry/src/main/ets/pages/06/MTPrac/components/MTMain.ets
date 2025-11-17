import { Category, FoodItem } from '../models'
import MTFoodItem from './MTFoodItem'

@Component
struct MTMain {
  @Link
  list:Category[]

  @State
  activeIndex:number = 0
  build() {
    Row() {
      Column() {
        ForEach(this.list, (item: Category,index:number) => {
          Text(item.name)
            .width('100%')
            .fontSize(14)
            .textAlign(TextAlign.Center)
            .height(50)
            .backgroundColor(this.activeIndex===index?$r("app.color.white") : $r("app.color.left_back_color"))
            .onClick(() => {
              this.activeIndex = index
            })
        })
      }
      .width(90)
      .height('100%')
      .backgroundColor($r("app.color.left_back_color"))

      //   右侧内容
      List() {
        if(this.list.length>0){
          ForEach(this.list[this.activeIndex].foods, (food:FoodItem) => {
            ListItem() {
              MTFoodItem({
                food:food
              })
            }
          })
        }else{
          ListItem(){
            Text('暂无商品~')
              .width('100%')
              .padding(20)
              .textAlign(TextAlign.Center)
              .fontColor($r('app.color.left_back_color'))
          }
        }
      }
      .layoutWeight(1)
      .backgroundColor('#fff')
      .padding({
        bottom: 80
      })
    }
    .width('100%')
    .layoutWeight(1)
    .alignItems(VerticalAlign.Top)
  }
}

export default MTMain
