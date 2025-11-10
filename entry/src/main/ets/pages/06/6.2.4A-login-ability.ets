import { common, Want } from '@kit.AbilityKit'

@Entry
@Component
struct AppStorageCase01 {
  @State
  username: string = ''
  @State
  age: string = ''
  login(){
    const userInfo:Record<string,string> = {
      'name':this.username,
      'age':this.age,
    }
    AppStorage.setOrCreate<Record<string,string>>('userInfo',userInfo)

    let want: Want = {
      'deviceId': '', // deviceId为空表示本设备
      'bundleName': 'com.example.arklearn',
      'abilityName': 'WantAbility'
    };
    // getContext()
    (this.getUIContext().getHostContext() as common.UIAbilityContext).startAbility(want)
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
