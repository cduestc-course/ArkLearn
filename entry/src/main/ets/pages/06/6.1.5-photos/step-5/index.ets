import { SelectImageIcon } from './builders/SelectBuilder'
import { SelectImage } from './components/SelectImage'
import { MyDialog } from './components/CustomDialog'

@Entry
@Component
struct ImageSelectCase {
  @State
  showDialog: boolean = false
  @State
  imageList: ResourceStr[] = [
    "assets/1.webp",
    "assets/2.webp",
    "assets/3.webp",
    "assets/4.webp",
    "assets/5.webp",
    "assets/6.webp",
    "assets/7.webp",
    "assets/8.webp",
    "assets/9.webp",
    "assets/10.webp"
  ]

  @State
  selectedList: ResourceStr[] = []

  myDialogController:CustomDialogController = new CustomDialogController({
    builder:MyDialog({
      selectedList:this.selectedList
    }),
    customStyle:true
  })

  @Builder
  ImageListBuilder() {
    SelectImage({
      imageList: this.imageList,
      selectedList: this.selectedList,
      showDialog: this.showDialog
    })
  }

  build() {
    Grid() {
      ForEach(this.selectedList,(item:ResourceStr) => {
        GridItem() {
          Image(item)
        }.aspectRatio(1)
        .onClick(() => {
          this.myDialogController.open()
        })
      })
      GridItem() {
        SelectImageIcon()
      }.aspectRatio(1)
      .onClick(() => {
        this.showDialog = true
      })
    }
    .padding(20)
    .width('100%')
    .height('100%')
    .rowsGap(10)
    .columnsGap(10)
    .columnsTemplate('1fr 1fr 1fr')

    //半模态转场
    .bindSheet($$this.showDialog, this.ImageListBuilder(), { showClose: false, height: '60%' })
  }
}
