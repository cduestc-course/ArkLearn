interface MoneyInfo {
  money: number
  bank: string
}

@Entry
@Component
  // 父组件
struct ParentIndex {
  @State
  dataInfo: MoneyInfo = {
    money: 80000,
    bank: '中国银行'
  }
  build() {
    Column( { space: 5 }) {
      Text('父组件')
        .fontSize(30)
      Text('银行：'+ this.dataInfo.bank + '      余钱：'+this.dataInfo.money)
      Row() {
        Button('存100块')
          .onClick(() => {
            this.dataInfo.money+=100
          })
        Button('转中国银行')
          .onClick(() => {
            this.dataInfo.bank='中国银行'
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      SonComponent({ dataInfo: this.dataInfo })
    }
    .padding(10)
    .height('100%')
    .backgroundColor('#eee')
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .padding({ top: 50 })
  }
}

@Component
  // 子组件
struct SonComponent {
  @Link
  dataInfo: MoneyInfo

  // 编写 UI
  build() {
    Column({ space: 5 }) {
      Text('子组件')
        .fontSize(20)
      Text('余钱：'+this.dataInfo.money)

      Column() {
        Button('花100块')
          .onClick(() => {
            this.dataInfo.money-=100
          })

      }
      SonSonComponent({ bank: this.dataInfo.bank })
    }
    .backgroundColor('#a6c398')
    .alignItems(HorizontalAlign.Center)
    .width('80%')
    .margin({ top: 10 })
    .padding(10)
    .borderRadius(10)

  }
}

@Component
  // 子子组件
struct SonSonComponent {
  @Link bank:string
  // 编写 UI
  build() {
    Column({ space: 5 }) {
      Text('子子组件')
        .fontSize(12)
      Text('银行：' + this.bank)

      Column() {
        Button('转建设银行')
          .onClick(() => {
            this.bank='建设银行'
          })

      }

    }
    .backgroundColor('#ffeca76b')
    .alignItems(HorizontalAlign.Center)
    .width('80%')
    .margin({ top: 10 })
    .padding(10)
    .borderRadius(10)

  }
}