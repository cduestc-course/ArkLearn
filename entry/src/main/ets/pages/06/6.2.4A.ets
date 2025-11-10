//EntryAbility
@Entry
@Component
struct AppStorageCase01 {
  @State
  username: string = ''
  @State
  age: string = ''
  build() {
    Row() {
      Column({ space: 20 }) {
        TextInput({ placeholder: '请输入姓名', text: $$this.username })
        TextInput({ placeholder: '请输入年龄', text: $$this.age })
        Button("登录")
          .width('100%')
      }
      .padding(20)
      .width('100%')
    }
  }
}
