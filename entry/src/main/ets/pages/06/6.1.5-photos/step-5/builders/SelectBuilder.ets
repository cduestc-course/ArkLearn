@Builder
export function SelectImageIcon() {
  Row() {
    SymbolGlyph($r('sys.symbol.plus')).fontSize(50)
  }
  .justifyContent(FlexAlign.Center)
  .width('100%')
  .height('100%')
  .padding(20)
  .backgroundColor('#f5f7f8')
  .border({
    width: 1,
    color: Color.Gray,
    style: BorderStyle.Dashed
  })
}