@Entry
@Component
struct FunctionCase {
  @State message: string = 'Hello World';
  showThis(){
    this.getUIContext().getPromptAction().showToast({
      message:this.message
    })
  }
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          //报错
          // .onClick(this.showThis)
          //推荐
          .onClick(()=>{
            this.showThis()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}