@CustomDialog
struct MyDialog {
  controller:CustomDialogController
  @Prop
  selectedList:ResourceStr[] = []
  @State
  selectIndex:number = 0
  build() {
    Column() {
      Swiper(){
        ForEach(this.selectedList,(item:ResourceStr)=>{
          Image(item)
            .objectFit(ImageFit.Contain)
        })
      }.index($$this.selectIndex)
      .layoutWeight(1)
      Text(`${this.selectIndex+1}/${this.selectedList.length}`)
        .fontColor('#fff')
        .margin(20)
        .height(100)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#000')
    .justifyContent(FlexAlign.Center)
    .onClick(()=>{
      this.controller.close()
    })
  }
}

export { MyDialog }

