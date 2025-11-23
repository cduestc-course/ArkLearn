@Entry
@Component
struct IndexComponent {
  @State textColor: Color = Color.Black;

  aboutToAppear() {
    console.log("页面初始化")
  }
  onPageShow() {
    console.log("页面显示")
  }
  onPageHide() {
    console.log("页面隐藏")
  }
  aboutToDisAppear() {
    // 清理定时器
    console.log("页面销毁")
  }
  onBackPress() {
    console.log("后退键")
    this.getUIContext().getPromptAction().showDialog({
      message: '确定要退出吗',
      buttons: [{
        text: '取消',
        color: "black"
      },{
        text: '确定',
        color: "black"
      }],
    })
      .then((result) => {
        if(result.index === 1) {
          this.getUIContext().getRouter().back()
        }

      })
    return true
  }
  onWillApplyTheme(theme:Theme){
    // 读取主题色并设置(可以在ability中自定义主题色)
    console.log("设置颜色")
  }

  build() {
    Column() {
      Text('Hello World')
        .fontColor(this.textColor)
        .fontSize(30)
        .margin(30)
    }.width('100%')
  }
}