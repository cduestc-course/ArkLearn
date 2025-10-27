@Component
struct HmReplyInput {
  @State content: string = ""

  publishComment: (content: string) => void = () => {}

  build() {
    Row({ space: 10 }) {
      TextInput({ text: $$this.content, placeholder: '～请留下您的神评论' })
        .layoutWeight(1)
        .height(40)
        .onSubmit(() => {
          // 键盘的确定事件
          if(this.content) {
            this.publishComment(this.content)
            this.content = ""
          }
        })
      Button("发布")
        .onClick(() => {
          if(this.content) {
            this.publishComment(this.content)
            this.content = ""
          }
        })
    }
    .padding({ left: 10, right: 10 })
    .width('100%')
    .height(60)
  }
}

export { HmReplyInput }