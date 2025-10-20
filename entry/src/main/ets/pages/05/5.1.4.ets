@Entry
@Component
struct MvvmCase {
  @State inputText: string = 'hello'
  @State isChecked: boolean = false
  @State myDate: Date = new Date('2025-10-20')
  @State myRatio: boolean = true
  @State mySearch: string = ''
  @State myToggle: boolean = false
  @State mySelect: string = '请选择'

  build() {
    Column({ space: 12 }) {
      Row() {
        Column() {
          Text('TextInput双向绑定')
          TextInput({text:$$this.inputText}).height(28).fontSize(12)
          Text('' + this.inputText)
        }.layoutWeight(1).padding({left:20})

        Column() {
          Text('Checkbox双向绑定')
          Checkbox().select($$this.isChecked)
          Text('' + this.isChecked)
        }.layoutWeight(1)
      }

      MyDivider()
      Column() {
        Text('DatePicker双向绑定')
        DatePicker({
          selected: $$this.myDate
        })
        Text('' + this.myDate)
      }

      MyDivider()
      Column() {
        Text('Radio双向绑定')
        Row(){
          Radio({ value: 'radio1', group: 'radioSelect' }).checked($$this.myRatio)
          Radio({ value: 'radio2', group: 'radioSelect' })
          Radio({ value: 'radio3', group: 'radioSelect' })
        }
        Text('' + this.myRatio)
      }

      MyDivider()
      Column() {
        Text('Search双向绑定')
        Search({value:$$this.mySearch})
        Text('' + this.mySearch)
      }
      MyDivider()
      Column() {
        Text('Toggle双向绑定')
        Toggle({ type: ToggleType.Switch,isOn:$$this.myToggle})
        Text('' + this.myToggle)
      }
      MyDivider()
      Column() {
        Text('Select双向绑定')
        Select([{ value: 'aaa' },
          { value: 'bbb'},
          { value: 'ccc'},
          { value: 'ddd'}])
          .value($$this.mySelect)
        Text('' + this.mySelect)
      }
    }
    .width("100%")
    .height("100%")
  }
}

@Component
struct MyDivider {
  build() {
    Divider().height(5).backgroundColor(Color.Pink)
  }
}
