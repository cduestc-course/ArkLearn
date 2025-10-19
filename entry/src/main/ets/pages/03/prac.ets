@Entry
@Component
struct PersonalHome {
  build() {
    Column(){
      // 标题栏
      Row() {
        Image($r('app.media.ic_arrow_left'))
          .width(30)
        Text('个人中心')
        Image($r('app.media.ic_more'))
          .width(24)
      }
      .padding({
        left:10,
        right:10
      })
      .width('100%')
      .height(40)
      .backgroundColor(Color.White)
      .justifyContent(FlexAlign.SpaceBetween)

      // 内容
      Column(){
        //玩一玩
        Row(){
          Column({space:5}) {
            Text('玩一玩')
              .fontSize(18)
              .fontWeight(700)
            Text('签到兑礼 ｜超多大奖 超好玩')
              .fontSize(12)
              .fontColor('#aaa')
          }
          .alignItems(HorizontalAlign.Start)

          Row({space:5}){
          Image($r('app.media.tree'))
            .width(50)
            .backgroundColor('#eee')
            .borderRadius(5)
          Image($r('app.media.ic_arrow_right'))
            .width(20)
            .fillColor(Color.Grey)
          }
        }
        .height(80)
        .padding({
          left:15,
          right:15
        })
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .borderRadius(6)
        .backgroundColor(Color.White)
      }
      .padding({
        top:10,
        left:10,
        right:10
      })

    }
    .backgroundColor('#ccc')
    .width('100%')
    .height('100%')
  }
}