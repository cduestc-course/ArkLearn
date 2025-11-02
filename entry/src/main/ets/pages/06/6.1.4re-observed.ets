interface IPerson {
  id: number
  name: string
  age: number
}

@Observed
class Person {
  id: number
  name: string
  age: number

  constructor(obj: IPerson) {
    this.id = obj.id
    this.name = obj.name
    this.age = obj.age
  }
}

@Entry
@Component
struct ObservedAndLink {
  @State personList: Person[] = [
    new Person({
      id: 1,
      name: '张三',
      age: 18
    }),
    new Person({
      id: 2,
      name: '李四',
      age: 19
    }),
    new Person({
      id: 3,
      name: '王五',
      age: 20
    })
  ]

  build() {
    Column({ space: 20 }) {
      Text('父组件')
        .fontSize(30)

      Text(JSON.stringify(this.personList))

      List({ space: 10 }) {
        ForEach(this.personList, (item: Person, index: number) => {
          ItemCom({
            info: item,
            print: ()=>{
              AlertDialog.show({
               message: JSON.stringify(this.personList)
              })

              // this.personList.splice(index, 1, item)
            }
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
  @ObjectLink info: Person

  print:()=>void = ()=>{

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

            this.print()
          })
      }
      .borderRadius(20)
      .backgroundColor(Color.Pink)
      .padding(10)
      .width('100%')
    }
  }
}
