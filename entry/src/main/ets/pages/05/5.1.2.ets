@Entry
@Component
struct StateCase {
  //1. 数据需要声明后才能使用，声明时需要标注类型
  //2. 数据改变后需要响应式更新到页面上，需要给数据添加@State修饰符
  @State num:number = 0

  build() {
    Row({space:10}) {
      Button('-')
        .onClick(()=>{
          this.num--
        })
      Text(this.num.toString())
      Button('+')
        .onClick(()=>{
          this.num++
        })
    }
    .height('100%')
    .width('100%')
    .justifyContent(FlexAlign.Center)
  }
}