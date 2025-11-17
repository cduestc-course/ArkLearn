import { Category } from './models'
import MTBottom from './components/MTBottom'
import MTCart from './components/MTCart'
import MTMain from './components/MTMain'
import MTTop from './components/MTTop'
import { getAllData } from './api'

@Entry
@Component
struct MTIndex {
  @Provide showCart: boolean = false
  @State
  list: Category[] = []

  onBackPress(): boolean | void {
    this.showCart = false
  }

  async aboutToAppear() {
    this.list = await getAllData()

  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Column() {
        MTTop()
        MTMain({
          list: this.list
        })
      }
      .height('100%')
      .width('100%')

      if (this.showCart) {
        MTCart()
      }
      MTBottom()
    }
    .width('100%')
    .height('100%')
  }
}