// 只能手动引入animator
import animator, { AnimatorOptions, AnimatorResult } from '@ohos.animator'

@Entry
@Component
struct AnimatorClass {
  // 1.准备动画参数
  CDAnimatorOption: AnimatorOptions = {
    //设置animator动画时长
    duration: 5 * 1000,
    //设置animator动画插值曲线
    easing: 'linear',
    //设置animator动画播放时延
    delay: 0,
    //设置animator动画填充方式
    fill: "forwards",
    //设置animator动画播放方向
    direction: "normal",
    //设置animator动画播放次数
    iterations: -1,
    // 上面的参数一个不能少
    // 下面的参数是动画的核心
    // 这里的起始只有一个值，但是你可以自己定义这个值用在哪里，比如我们用在旋转角度
    // 那么起始角度是0
    begin: 0,
    // 那么终止角度是360
    end: 360
  }
  // 2.准备动画类
  CDAnimator: AnimatorResult = animator.create(this.CDAnimatorOption)
  //this.getUIContext().createAnimator(this.CDAnimatorOption)

  // 3.监听动画的值，动态改变@State的值引起UI更新从而产生动画
  aboutToAppear(): void {
    this.CDAnimator.onFrame = (value) => {
      this.rotateAngle = value
    }
  }

  @State
  rotateAngle: number = 0
  @State
  isPlay: boolean = false

  build() {
    Row() {
      Column({ space: 20 }) {
        Image($r('app.media.profile'))
          .width(200)
          .aspectRatio(1)
          .borderRadius(100)
          .rotate({
            angle: this.rotateAngle
          })
        Text(`角度：${this.rotateAngle}`)
        Button('播放/暂停')
          .onClick(() => {
            this.isPlay = !this.isPlay
            this.isPlay ? this.CDAnimator.play() : this.CDAnimator.pause()
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}