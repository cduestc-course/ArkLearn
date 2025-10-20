interface PayRecord {
  OrderName:string
  OrderDate:Date
  OrderAmount:number
}

@Entry
@Component
struct ForEachCase {
  @State showDialog: boolean = false
  @State PayRecordList: PayRecord[] = [
    {
      OrderName: 'Switch2',
      OrderDate: new Date('2025/05/11'),
      OrderAmount: 2399.00
    },
    {
      OrderName: 'iPhone17',
      OrderDate: new Date('2025/10/20'),
      OrderAmount: 6999.00
    },
    {
      OrderName: 'Macbook Pro M5',
      OrderDate: new Date('2025/11/11'),
      OrderAmount: 9999.00
    }
  ]

  build() {
    Stack() {
      Column() {
        // 标题
        Row() {
          Text('支付记录')
            .layoutWeight(1)
            .textAlign(TextAlign.Center)
            .margin({
              left: 30
            })
        }
        .width('100%')
        .padding(16)
        .border({
          width: {
            bottom: 1
          },
          color: '#f4f5f6'
        })

        // 列表
        Column() {
          // 要循环的结构体
          // Column({ space: 20 }) {
          //   Text('Switch2')
          //     .fontWeight(FontWeight.Bold)
          //     .width('100%')
          //   Row() {
          //     Text('￥43.00').fontColor(Color.Red)
          //     Text('2025/5/11')
          //   }
          //   .width('100%')
          //   .justifyContent(FlexAlign.SpaceBetween)
          // }
          // .width('100%')
          // .padding(20)

          // 使用循环组件，依次生成结构体
          ForEach(this.PayRecordList, (item: PayRecord) => {
            Column({ space: 20 }) {
              Text(item.OrderName)
                .fontWeight(FontWeight.Bold)
                .width('100%')
              Row() {
                Text('￥' + item.OrderAmount.toFixed(2))
                  .fontColor(Color.Red)
                Text(item.OrderDate.toLocaleDateString())
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .width('100%')
            .padding(20)
          })

        }
        .justifyContent(FlexAlign.Start)
        .width('100%')
        .layoutWeight(1)

      }
      .width('100%')
      .height('100%')
    }
  }
}