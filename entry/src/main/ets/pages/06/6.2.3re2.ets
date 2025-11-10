let localUserInfo = LocalStorage.getShared()

@Entry(localUserInfo)
@Component
struct Index2 {
  @LocalStorageLink('avtar')
  avtar: ResourceStr = ''
  @LocalStorageLink('nickName')
  nickName: ResourceStr = ''
  @LocalStorageLink('gender')
  gender: ResourceStr = ''
  @LocalStorageLink('age')
  age: ResourceStr = ''

  build() {
    Column() {
      Row() {
        Image($r('sys.media.ohos_ic_back'))
          .width(20)
          .aspectRatio(1)
          .onClick(() => {
          })
        Text('个人信息')
          .fontWeight(FontWeight.Bold)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text('修改')
          .onClick(() => {
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