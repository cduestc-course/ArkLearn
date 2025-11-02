@Component
struct SelectImage {
  @Prop
  imageList: ResourceStr[] = []
  @State
  selectList: ResourceStr[] = []

  build() {
    Column() {
      Row() {
        Text('取消')
        Text(`已选中${this.selectList.length}/9 张`)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text('确定')
      }.width('100%').padding(20)
      Grid() {
        ForEach(this.imageList, (item: ResourceStr) => {
          GridItem() {
            Stack({ alignContent: Alignment.BottomEnd }) {
              Image(item)
              if (this.selectList.includes(item)) {
                Image($r('sys.media.ohos_ic_public_select_all'))
                  .width(30)
                  .aspectRatio(1)
                  .fillColor('#ff397204')
                  .margin(4)
              }
            }
          }
          .aspectRatio(1)
          .onClick(() => {
            this.selectList.push(item)
          })
        })
      }
      .padding(20)
      .layoutWeight(1)
      .rowsGap(10)
      .columnsGap(10)
      .columnsTemplate('1fr 1fr 1fr')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f7f8')
  }
}

export { SelectImage }