import { router } from '@kit.ArkUI'

@Entry({ useSharedStorage: true })
@Component
struct Index4 {
  @LocalStorageLink('avtar')
  avtar: ResourceStr = ''
  @LocalStorageLink('nickName')
  nickName: ResourceStr = ''
  @LocalStorageLink('gender')
  gender: ResourceStr = ''
  @LocalStorageLink('age')
  age: ResourceStr = ''

  // localStorage = this.getUIContext().getSharedLocalStorage()

  build() {
    Column() {
      Row() {
        SymbolGlyph($r('sys.symbol.chevron_left'))
          .fontSize(20)
          .width(20)
          .aspectRatio(1)
          .onClick(() => {
            router.back()
          })
        Text('个人信息')
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text('修改')
          .onClick(() => {
            router.pushUrl({//pushUrl
              url:'pages/06/6.2.3re4-modify'
            })
            // this.getUIContext().getRouter().pushUrl({
            //   url:''
            // })
          })
      }.width('100%')
      .padding(20)
      .alignItems(VerticalAlign.Center)

      Row() {
        Text('头像：')
        Image(this.avtar)
          .width(40)
      }.width('100%')
      .padding(20)
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text('昵称：')
        TextInput({ text: $$this.nickName })
          .textAlign(TextAlign.End)
          .layoutWeight(1)
          .backgroundColor('#fff')
          .padding({
            right: 0
          })
      }.width('100%')
      .padding(20)
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text('性别：')
        TextInput({ text: $$this.gender })
          .textAlign(TextAlign.End)
          .layoutWeight(1)
          .backgroundColor('#fff')
          .padding({
            right: 0
          })
      }.width('100%')
      .padding(20)
      .justifyContent(FlexAlign.SpaceBetween)

      Row() {
        Text('年龄：')
        TextInput({ text: $$this.age })
          .textAlign(TextAlign.End)
          .layoutWeight(1)
          .backgroundColor('#fff')
          .padding({
            right: 0
          })
      }.width('100%')
      .padding(20)
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width('100%')
    .height('100%')
  }
}