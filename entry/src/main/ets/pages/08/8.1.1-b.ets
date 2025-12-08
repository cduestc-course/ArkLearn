@Entry
@Component
struct AnimateToCase {
  @State message: string = 'Hello World';
  @State textSize: number = 50
  @State textColor: string = '#000'
  @State textOpacity: number = 1

  build() {
    Row() {
      Column({ space: 20 }) {
        Text(this.message)
          .fontSize(this.textSize)
          .fontWeight(FontWeight.Bold)
          .fontColor(this.textColor)
          .opacity(this.textOpacity)
        Button('隐藏')
          .onClick(() => {
            // this.getUIContext().animateTo({},()=>{})
            animateTo({ duration:500 },()=>{
              this.message = 'World Hello'
              this.textSize = 16
              this.textColor = '#ff4400'
              this.textOpacity = 0
            })
          })
        Button('显示')
          .onClick(() => {
            animateTo({duration:1000},()=>{
              this.message = 'Hello World'
              this.textSize = 50
              this.textColor = '#ff00f0'
              this.textOpacity = 1
            })
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}