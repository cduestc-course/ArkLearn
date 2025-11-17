import { FoodItem } from '../models'
export class CartStore {
  static addCutCart(item: FoodItem, flag: boolean = true) {
    const list = AppStorage.get<FoodItem[]>('cart_list')!
    const index = list.findIndex(listItem => listItem.id === item.id)
    if (flag) {
      if (index < 0) {
        item.count = 1
        //   新增
        list.unshift(item)
      } else {
        list[index].count++
        list.splice(index, 1,list[index])
      }
    } else {
      list[index].count--
      // 如果减到0就删掉
      if (list[index].count === 0){
        list.splice(index, 1)
      }else{
        list.splice(index, 1,list[index])
      }
    }
    AppStorage.setOrCreate('cart_list',list)
  }
  static clearCarts () {
    AppStorage.set<FoodItem[]>("cart_list", [])
  }
}