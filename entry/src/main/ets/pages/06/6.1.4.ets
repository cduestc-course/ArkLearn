interface Person {
  id: number
  name: string
  age: number
}


@Entry
@Component
struct ObservedAndLink {
  @State personList: Person[] = [
    {
      id: 1,
      name: '张三',
      age: 18
    },
    {
      id: 2,
      name: '李四',
      age: 19
    },
    {
      id: 3,
      name: '王五',
      age: 20
    }
  ]

  build() {
    Column({ space: 20 }) {
      Text('父组件')
        .fontSize(30)

      Text(JSON.stringify(this.personList))

      List({ space: 10 }) {
        ForEach(this.personList, (item: Person) => {
          ItemCom({
            info: item
          })
        })
      }

    }
    .backgroundColor('#cbe69b')
    .width('100%')
    .height('100%')
    .padding(20)
  }
}

@Component
struct ItemCom {
  @State info: Person = {
    id:0,
    name:'',
    age:-1
  }

  build() {
    ListItem() {
      Row({ space: 10 }) {
        Text('姓名:' + this.info.name)
        Text('年龄:' + this.info.age)
        Blank()
        Button('年龄+1')
          .onClick(() => {
            this.info.age++
          })
      }
      .borderRadius(20)
      .backgroundColor(Color.Pink)
      .padding(10)
      .width('100%')
    }
  }
}
