@Entry
@Component
struct ConditionCase {
  @State isShow: boolean = false;

  build() {
    Row() {
      Column() {
        Toggle({
          type: ToggleType.Switch,
          isOn: $$this.isShow
        })
        // 1.控制是否渲染
        if(this.isShow){
          Image($r('app.media.profile')).width(100)
        }else{
        Image($r('app.media.m_user')).width(100)
        }
        // 2.控制是否展示
        // Image($r('app.media.profile')).width(100)// 展示
        // // .visibility(Visibility.Visible)
        // // 隐藏（不显示也会占位置,不影响其他元素排列的话优先使用这个，性能高）
        // .visibility(this.isShow?Visibility.Visible:Visibility.Hidden)
        // // 隐藏（不显示就不占位置，和if else一样）
        // //   .visibility(this.isShow ? Visibility.Visible : Visibility.None)
      }
      .width('100%')
    }
    .height('100%')
  }
}