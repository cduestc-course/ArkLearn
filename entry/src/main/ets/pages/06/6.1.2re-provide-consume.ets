interface Bicycle {
  name: string
  brand: string
}

@Entry
@Component
  // 顶级组件
struct ParentIndex{
  @Provide themeColor:string = '#ffffe64a'
  @Provide bicycle:Bicycle ={
    name:'小黄车',
    brand:'美团'
  }

  build() {
    Column({space: 5}) {
      Text('顶级组件')
        .fontSize(30)
        .fontWeight(900)
      Text(JSON.stringify(this.bicycle))
        .backgroundColor(this.themeColor)
      Button('切换美团共享单车')
        .onClick(()=>{
          this.bicycle.name = '小黄车'
          this.bicycle.brand = '美团'
          this.themeColor = '#ffffe64a'
        })
        .height(30)

      SonComponent()
      SonComponent()
    }
    .padding(10)
    .height('100%')
    .backgroundColor('#eee')
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .padding({ top: 20 })
  }
}


@Component
  // 二级组件
struct SonComponent {
  @Consume themeColor:string

  build() {
    Column({ space: 10 }) {
      Text('我是二级组件')
        .fontSize(22)
        .fontWeight(900)

      SonSonComponent()
    }
    .backgroundColor(this.themeColor)
    .alignItems(HorizontalAlign.Center)
    .width('90%')
    .margin({ top: 10 })
    .padding(10)
    .borderWidth(2)
    .borderRadius(10)

  }
}

@Component
  // 内层组件
struct SonSonComponent {
  @Consume themeColor:string
  @Consume bicycle:Bicycle

  build() {
    Column({ space: 5 }) {
      Text('我是内层组件')
        .fontSize(20)
        .fontWeight(900)
      Text(JSON.stringify(this.bicycle))
        .backgroundColor(this.themeColor)
      Button('切换哈啰共享单车')
        .onClick(()=>{
          this.bicycle.name = '小蓝车'
          this.bicycle.brand = '哈啰'
          this.themeColor = '#ff51a8e7'
        })
        .height(30)
    }
    .backgroundColor('#bf94e4')
    .alignItems(HorizontalAlign.Center)
    .width('90%')
    .margin({ top: 5 })
    .padding(10)
    .borderRadius(10)

  }
}