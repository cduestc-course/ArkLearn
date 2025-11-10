@Entry
@Component
  // 顶级组件
struct ParentIndex{
  @State shakenX:number = 0
  @State shakenY:number = 0
  @State defShakenX:number = 0
  @State defShakenY:number = 0

  @Provide('newNum')
  @Watch('update')
  count:number = 0

  timer:number = 0
  update() {
    if(this.count != 0) {
      this.timer = setInterval(()=>{
        this.shakenX = Math.random()*2*this.count
        this.shakenY = Math.random()*2*this.count
        this.defShakenX = Math.random()*2*this.count
        this.defShakenY = Math.random()*2*this.count
      }, 100)
    }
    else {
      clearInterval(this.timer)
    }
  }

  build() {
    Column() {
      Stack() {
        Text('抖音')
          .fontSize(60)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ff2d83b3')
          .translate({
            x:this.shakenX,
            y:this.shakenY
          })
          .zIndex(1)
        Text('抖音')
          .fontSize(60)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ffe31fa9')
          .translate({
            x:this.shakenY,
            y:this.shakenX
          })
          .zIndex(2)
        Text('抖音')
          .fontSize(60)
          .fontWeight(FontWeight.Bold)
          .fontColor('#ff030000')
          .translate({
            x:this.defShakenX,
            y:this.defShakenY
          })
          .zIndex(3)
      }
      SonComponent({
        count:this.count
      })
    }
    .padding(10)
    .height('100%')
    .backgroundColor('#eee')
    .width('100%')
    .alignItems(HorizontalAlign.Center)
    .padding({ top: 40 })
  }
}


@Component
  // 二级组件
struct SonComponent {
  @Link count:number
  build() {
    Column({ space: 10}) {
      Text('操作台')
        .fontSize(22)
        .fontWeight(900)
      Text(this.count.toString())
        .fontSize(32)
      SonSonComponent()
    }
    .backgroundColor('#a6c398')
    .alignItems(HorizontalAlign.Center)
    .width('90%')
    .margin({ top: 40 })
    .padding(10)
    .borderRadius(10)

  }
}

@Component
  // 内层组件
struct SonSonComponent {
  @Consume('newNum')
  count:number
  build() {
    Row({ space: 20 }) {
      Button('减少抖动')
        .onClick(()=>{
          if(this.count != 0)
            this.count--
        })
        .height(30)
      Button('增加抖动')
        .onClick(()=>{
          if(this.count != 5)
            this.count++
        })
        .height(30)
    }
    .justifyContent(FlexAlign.SpaceEvenly)
    .backgroundColor('#ffb9dbad')
    .width('100%')
    .padding(10)
    .borderRadius(10)

  }
}