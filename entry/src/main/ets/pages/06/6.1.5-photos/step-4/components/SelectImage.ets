@Component
struct SelectImage {
  @Prop
  imageList:ResourceStr[] = []
  @State
  selectList: ResourceStr[] = []

  @Link
  selectedList: ResourceStr[]
  @Link
  showDialog: boolean

  maxNum: number = 3

  build() {
    Column() {
      Row() {
        Text('取消')
          .onClick(()=>{
            this.showDialog = false
          })
        Text(`已选中${this.selectList.length}/${this.maxNum} 张`)
          .layoutWeight(1)
          .textAlign(TextAlign.Center)
        Text('确定')
          .onClick(()=>{
            if(this.selectList.length === 0) AlertDialog.show({
              message: '还没有选择图片。'
            })
            else {
              this.selectedList.splice(0, this.selectedList.length)
              this.selectedList.push(...this.selectList)
              this.showDialog = false
            }
          })
      }.width('100%').padding(20)
      Grid() {
        ForEach(this.imageList, (item: ResourceStr) => {
          GridItem() {
            Stack({alignContent:Alignment.BottomEnd}) {
              Image(item)
              if (this.selectList.includes(item)) {
                SymbolGlyph($r('sys.symbol.checkmark_circle'))
                  .fontSize(28)
                  .fontWeight(700)
                  .fontColor(['#ff92f351'])
                  .aspectRatio(1)
                  .margin(4)
              }
            }
          }
          .aspectRatio(1)
          .onClick(() => {
            if(this.selectList.includes(item)) {
              this.selectList = this.selectList.filter((filterItem) => {
                return filterItem !== item
              })
            }
            else {
              if(this.selectList.length === this.maxNum) {
                AlertDialog.show({
                  message:'已达最大选取张数！'
                })
                return
              }
              else this.selectList.push(item)
            }
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