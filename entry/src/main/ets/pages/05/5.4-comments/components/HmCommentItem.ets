import { ReplyItem, ReplyItemModel } from '../models'

@Preview
@Component
struct HmCommentItem {
  // 接收渲染的选项
  @Prop item: ReplyItemModel = new ReplyItemModel({} as ReplyItem) // 初始值 只是为了语法不报错

  changeLike: () => void = () => {} // 初始值 只是为了语法不报错

  build() {
    Row({ space: 10 }) {
      // Image($r("app.media.profile"))
      Image(this.item.avatar)
        .width(40)
        .height(40)
        .borderRadius(20)

      Column({ space: 10 }) {
        // Text("DogeDan")
        Text(this.item.author)
          .fontColor("#303a43")
          .fontSize(18)
          .fontWeight(FontWeight.Bold)

        // Text("HarmonyOS是面向全场景、以分布式技术实现万物互联和无缝协同体验的新一代操作系统。")
        Text(this.item.content)
          .fontColor("#2f3642")
          .lineHeight(22)
        Row() {
          // Text("10-21 .IP属地成都")
          Text(`${this.item.time} .IP属地${this.item.area}`)
            .fontColor("#cacaca")
            .fontSize(12)

          Row({ space: 4 }) {
            Image($r("app.media.ic_like"))
              .width(12)
              .height(12)
              .fillColor(this.item.likeFlag ? Color.Red : "#cacaca")
            //Text("100")
            Text(this.item.likeNum.toString())
              .fontColor(this.item.likeFlag ? Color.Red :"#cacaca")
              .fontSize(12)
          }
          .onClick(() => {
            this.changeLike()
          })
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

    }
    .alignItems(VerticalAlign.Top)
    .padding(20)
    .width('100%')
  }
}
export { HmCommentItem }