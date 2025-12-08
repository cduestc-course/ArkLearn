@Entry
@Component
struct ImageAnimatorCase {

  build() {
    Row() {
      Column() {
        ImageAnimator()
          .images(Array.from(Array(37),(item:string,index:number)=>{
            // 图片路径不能含中文
            return {src:`/assets/JDLoading/loading_${index}.png`} as ImageFrameInfo
          }))
          .duration(3000)
          .state(AnimationStatus.Running)
          .fillMode(FillMode.None)
          .iterations(-1)
          // 必须有宽高
          .width(340)
          .aspectRatio(1)
      }
      .width('30%')
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
  }
}