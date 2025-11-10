// PersistentStorage.persistProp('userInfo', '')
import { PreferencesClass } from './6.2.6'

@Entry
@Component
struct PersistentStorageCase {
  @StorageLink('userInfo')
  userInfo:Record<string,string>= {}

  @State
  username: string = ''
  @State
  age: string = ''

  aboutToAppear(): void {
    this.username = this.userInfo.name
    this.age = this.userInfo.age
  }

  login(){
    const info:Record<string,string> = {
      'name':this.username,
      'age':this.age,
    }

    AppStorage.set<Record<string,string>>('userInfo',info)

    AlertDialog.show({
      message:'成功存储'
    })

    PreferencesClass.setToken(this.getUIContext().getHostContext()!,'yyyytyyy')
  }
  build() {
    Row() {
      Column({ space: 20 }) {
        TextInput({ placeholder: '请输入姓名', text: $$this.username })
        TextInput({ placeholder: '请输入年龄', text: $$this.age })
        Button("登录")
          .width('100%')
          .onClick(()=>{
            this.login()
          })
      }
      .padding(20)
      .width('100%')
    }
    .height('100%')
  }
}
