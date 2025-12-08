@Entry
@Component
struct ShowOrHideCase {
  @State message: string = 'Hello World';
  @State
  showMessage: boolean = false
  build() {
    Row() {
      Column() {
        Column() {
          if(this.showMessage) {
            Text(this.message)
              .fontSize(50)
              .fontWeight(FontWeight.Bold)
          }
        }
        .height(50)

        Button("显示/隐藏")
          .onClick(() => {
            animateTo({ duration: 1000 },  () => {
              this.showMessage = !this.showMessage
            })
          })

      }
      .width('100%')
    }
    .height('100%')
  }
}