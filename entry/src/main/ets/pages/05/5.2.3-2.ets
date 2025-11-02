@Entry
@Component
struct RefreshCase {
  @State
  refreshing: boolean = false
  scroller:Scroller = new Scroller()
  @State
  list: number[] = Array(20).fill(Date.now())
  @State
  isEnd: boolean = false

  build() {
    RelativeContainer() {
      Refresh({ refreshing: $$this.refreshing }) {
        List({ scroller:this.scroller }) {
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
        .onScrollStart(() => {
          this.isEnd = false
        })
        .onScrollStop(() => {
          if(this.isEnd){
            setTimeout(()=>{
              this.list.push(...Array(5).fill('+'+Date.now()))
              this.getUIContext().getPromptAction().showToast({
                message: '已添加5条数据'
              })
              this.scroller.scrollEdge(Edge.Bottom)
            },1000)
          }
        })
        .onReachEnd(() => {
          this.isEnd = true
        })
      }.onRefreshing(() => {
        setTimeout(() => {
          this.list = Array(20).fill(Date.now())
          this.refreshing = false
        }, 1000)
      })
    }
    .height('100%')
    .width('100%')
  }
}