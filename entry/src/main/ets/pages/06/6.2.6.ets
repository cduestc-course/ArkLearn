//PreferencesClass
import { Context } from '@kit.AbilityKit'
import { preferences } from '@kit.ArkData'
// 两种方式引入的是同一个东西
// import preferences from '@ohos.data.preferences'

export class PreferencesClass {
  // static代表的是静态，可以直接通过类访问
  // store名称
  static defaultStore: string = 'DEFAULT_STORE'
  static firstStore: string = 'FIRST_STORE'

  // 字段名称，一个字段配2个方法，读取和写入
  static tokenKey:string = 'TOKEN_KEY'
  //   仓库中存储字段
  static setToken(content:Context, token:string, storeName:string=PreferencesClass.defaultStore){
    const store = preferences.getPreferencesSync(content, {name:storeName})
    store.putSync(PreferencesClass.tokenKey, token)
    store.flush()
  }
  //   读取仓库中字段
  static getToken(content:Context, storeName:string=PreferencesClass.defaultStore){
    const store = preferences.getPreferencesSync(content,{name:storeName})
    return store.getSync(PreferencesClass.tokenKey,'')
  }

  static delToken(content:Context, storeName:string=PreferencesClass.defaultStore) {
    const store = preferences.getPreferencesSync(content,{name:storeName})
    store.deleteSync(PreferencesClass.tokenKey)
  }
}
