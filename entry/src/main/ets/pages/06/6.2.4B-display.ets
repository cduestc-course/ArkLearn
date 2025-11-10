@Entry
@Component
struct AppStorageCase02 {
  // 用法1
  // @StorageProp('userInfo')
  // userInfo:Record<string,string> = {}

  // 用法2
  @State
  userInfo:Record<string,string> = {}
  aboutToAppear(): void {
    const userInfo = AppStorage.get<Record<string,string>>('userInfo')
    this.userInfo = userInfo!
  }

  build() {
    Column() {
      Row({ space: 20 }) {
        Image($r('app.media.user'))
          .width(60)
          .aspectRatio(1)
          .borderRadius(30)
        Column({ space: 10 }) {
          Text(`姓名：${this.userInfo.name}`)
          Text(`年龄：${this.userInfo.age}岁`)
        }
      }
      .alignItems(VerticalAlign.Center)
      .padding(20)
      .width('100%')

      Button("退出")
        .onClick(()=>{
          AppStorage.set<Record<string,string>>('userInfo', null)
          this.getUIContext().getRouter().back()
        })
    }
    .width('100%')
    .height('100%')
  }
}