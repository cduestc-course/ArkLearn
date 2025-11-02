import { SelectImageIcon } from './builders/SelectBuilder'
@Entry
@Component
struct ImageSelectCase {
  build() {
    Grid() {
      GridItem() {
        SelectImageIcon()
      }.aspectRatio(1)
    }
    .padding(20)
    .width('100%')
    .height('100%')
    .rowsGap(10)
    .columnsGap(10)
    .columnsTemplate('1fr 1fr 1fr')
  }
}
