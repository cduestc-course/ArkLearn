import HmLoading from './prac2-comp';

@Entry
@Component
struct LoadingCase {
  @State showLoading: boolean = false;

  // 页面刚进入 应该去获取数据  等待的过程中 显示进度 数据获取完 进度消失
  // 钩子函数
  aboutToAppear(): void {
    // 请求数据
    // setTimeout/setInterval
    this.showLoading = true
    setTimeout(() => {
      this.showLoading = false
    },5000)
  }
  build() {
    Row() {
      Column() {
        if(this.showLoading) {
          HmLoading()
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}