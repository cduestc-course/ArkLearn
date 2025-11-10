// WantAbility
@Entry
@Component
struct AppStorageCase02 {
  build() {
    Column() {
      Row({ space: 20 }) {
        Image($r('app.media.user'))
          .width(60)
          .aspectRatio(1)
          .borderRadius(30)
        Column({ space: 10 }) {
          Text('姓名：小明')
          Text(`年龄：18岁`)
        }
      }
      .alignItems(VerticalAlign.Center)
      .padding(20)
      .width('100%')

      Button("加载")
    }
    .width('100%')
    .height('100%')
  }
}