@Entry
@ComponentV2
  // 父组件
struct ParentIndex {
  @Local count: number = 10

  build() {
    Column( { space: 5 }) {
      Text('父组件')
        .fontSize(30)
      Text(this.count.toString())
      Button('修改数据')
        .onClick(() => {
          this.count++
        })
      SonComponent({
        count:this.count!!
      })
    }
    .padding(10)
    .height('100%')
    .backgroundColor('#eee')
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .padding({ top: 100 })
  }
}


@ComponentV2
  // 子组件
struct SonComponent {
  @Param count:number = -1
  @Event $count: (val:number) => void = (val:number) => {}

  // 编写 UI
  build() {
    Column({ space: 5 }) {
      Text('我是子组件')
        .fontSize(20)
      Text(this.count.toString())

      Column() {
        Button('修改count')
          .onClick(() => {
            this.$count(this.count+1)
          })

      }

    }
    .backgroundColor('#a6c398')
    .alignItems(HorizontalAlign.Center)
    .width('80%')
    .margin({ top: 100 })
    .padding(10)
    .borderRadius(10)

  }
}