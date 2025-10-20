@Preview // 表示该组件可预览 Preview只能看效果 没有交互
@Component
struct HmLoading {
  @State value: number = 0
  @State timer: number = -1  // 显示声明

  aboutToAppear(): void {
    this.timer = setInterval(() => {
      if(this.value === 100) {
        this.value = 0
      }
      this.value++
    }, 10)
  }
  aboutToDisappear(): void {
    clearInterval(this.timer)
  }

  build() {
    Progress({
      total: 100,
      value: this.value,
      type: ProgressType.Ring
    })
  }
}

// 默认导出
export default HmLoading  // 一个文件只能有一个默认导出
// 按需导出
// export { HmLoading, HmLoading1, HmLoading3 }

