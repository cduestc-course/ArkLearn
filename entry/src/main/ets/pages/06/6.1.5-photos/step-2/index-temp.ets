import { SelectImageIcon } from './builders/SelectBuilder'
import { MyDialog } from './components/CustomDialog'
@Entry
@Component
struct ImageSelectCase {
  myDialogController:CustomDialogController = new CustomDialogController({
    builder:MyDialog(),
    customStyle:true
  })
  build() {
    Grid() {
      GridItem() {
        SelectImageIcon()
      }.aspectRatio(1)
      .onClick(()=>{
        this.myDialogController.open()
      })
    }
    .padding(20)
    .width('100%')
    .height('100%')
    .rowsGap(10)
    .columnsGap(10)
    .columnsTemplate('1fr 1fr 1fr')
  }
}
