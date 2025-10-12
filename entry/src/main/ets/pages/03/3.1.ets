@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Text(this.message)
        .fontSize(50)
      Divider()
      Button('Click me')
        .onClick(() => {
          this.message = 'Welcome';
        })
        .height(50)
        .width(100)
        .margin({top: 20})
    }
    .height('100%')
    .width('100%')
  }
}

