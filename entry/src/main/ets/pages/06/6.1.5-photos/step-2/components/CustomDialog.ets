@CustomDialog
struct MyDialog {
  controller:CustomDialogController
  build() {
    Column() {
      Text('默认内容')
    }
    .width('100%')
    .padding(20)
    .backgroundColor('#fff')
  }
}

export { MyDialog }