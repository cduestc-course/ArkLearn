import { common, Want } from '@kit.AbilityKit'

@Entry
@Component
struct MainPage {

  build() {
    Row() {
      Column({ space: 15 }){
        Text("主Ability")
          .fontSize(50)
        Button("去支付")
          .width('100%')
          .onClick( ()=>{
            let want: Want = {
              'deviceId': '',
              'bundleName': 'com.example.arklearn',
              'abilityName': 'PayAbility',
              'parameters': {
                'order_id': Date.now()
              }
            };

            // 1
            // (this.getUIContext().getHostContext() as common.UIAbilityContext).startAbility(want, (error)=>{
            //   //显式拉起Ability，通过bundleName、abilityName、moduleName可以唯一确定一个Ability
            //   console.log('error.code = '+ error.code)
            // })

            type ResultParams = Record<string, boolean>

            // 2
            // Promise
            // const result = await (this.getUIContext().getHostContext() as common.UIAbilityContext)
            //   .startAbilityForResult(want)
            // const params = result.want?.parameters as ResultParams
            //
            // if(params.paySuccess) {
            //   this.getUIContext().getPromptAction().showToast({ message: '支付成功' })
            // }else {
            //   this.getUIContext().getPromptAction().showToast({ message: '支付失败' })
            // }

            // 3
            (this.getUIContext().getHostContext() as common.UIAbilityContext)
              .startAbilityForResult(want)
              .then( (result) => {
                // this.getUIContext().showAlertDialog({
                //   message: JSON.stringify(result)
                // })
                const params = result.want?.parameters as ResultParams
                if(params.paySuccess) {
                  this.getUIContext().getPromptAction().showToast({ message: '支付成功' })
                } else {
                  this.getUIContext().getPromptAction().showToast({ message: '支付失败' })
                }
              })
              .catch((error: BusinessError<number>) => {
                console.log('error.code = '+ error.code)
            })


          })
      }

    }
    .height('100%')
    .padding(20)
  }
}
