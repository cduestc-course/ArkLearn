import common from '@ohos.app.ability.common'

@Entry
@Component
struct PayIndex {

  @StorageProp('order_id')
  orderId: number = 0

  build() {
    Row() {
      Column({ space: 15 }) {
        Text("订单id：" + this.orderId)
          .fontSize(40)
          .fontColor(Color.Red)
        Button("支付")
          .width('100%')
          .onClick(() => {
            const context =  this.getUIContext().getHostContext() as common.UIAbilityContext
            context.terminateSelfWithResult({
              resultCode: 1,
              want: {
                'abilityName': 'EntryAbility',
                'bundleName': 'com.example.arklearn',
                'parameters': {
                  paySuccess: true
                }
              }
            })
          })
      }

    }
    .height('100%')
    .padding(20)
  }
}