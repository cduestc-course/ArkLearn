@Entry
@Component
struct RefreshCase {
  @State
  refreshing: boolean = false
  @State
  list: number[] = Array(20).fill(Date.now())

  // @Builder
  // refreshContent() {
  //   Text('正在加载中...')
  //     .width('100%')
  //     .textAlign(TextAlign.Center)
  //     .backgroundColor(Color.Pink)
  // }

  build() {
    Column() {
      Refresh({ refreshing: $$this.refreshing, /*builder: this.refreshContent()*/}) {
        List() {
          ForEach(this.list, (item: number) => {
            ListItem() {
              Row() {
                Text(item.toString())
              }.width('100%').padding(20).border({
                width: {
                  bottom: 1
                },
                color: Color.Gray,

              })
            }
          })
        }

      }.onRefreshing(() => {
        setTimeout(() => {
          // this.getUIContext().getPromptAction().showToast({message: ''+this.refreshing})
          this.list = Array(20).fill(Date.now())
          this.refreshing = false
        }, 1000)
      })
    }
    .height('100%')
    .width('100%')
  }
}