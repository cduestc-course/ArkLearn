interface IAddress {
  province: string
  city: string
  area: string
}
interface IPerson {
  name: string
  age: number
  sex: "男" | "女"
  address: IAddress
}

@Entry
@Component
struct StateCase {
  @State
  p: IPerson = {
    name: '小张',
    age: 20,
    sex: "女",
    address: {
      province: '四川',
      city: '成都',
      area: '郫都区'
    }
  }

  build() {
    Column({ space: 10 }) {
      Text(JSON.stringify(this.p))
      Row({ space: 15 }) {
        Text("姓名：")
        TextInput({ text: $$this.p.name }).layoutWeight(1)
          // .onChange(value => {
          //   this.p.name = value
          // })
      }.padding(10)
      Row({ space: 15 }) {
        Text("年龄：")
        TextInput({ text: this.p.age.toString() }).layoutWeight(1)
          .onChange(value => {
            this.p.age = parseInt(value)
          })
      }.padding(10)
      Row({ space: 15 }) {
        Text("性别：")
        Select([{ value: '男' }, { value: '女' }])
          .layoutWeight(1)
          .value(this.p.sex)
          .onSelect((index: number, value: string) => {
            this.p.sex = value as "男" | "女"
          })
      }.padding(10)
      Row({ space: 15 }) {
        Text("地址：")
        TextInput({ text: this.p.address.province }).layoutWeight(1)
          .onChange((value) => {
            this.p.address.province = value
          })
        TextInput({ text: this.p.address.city }).layoutWeight(1)
          .onChange((value) => {
            this.p.address.city = value
          })
        TextInput({ text: this.p.address.area }).layoutWeight(1)
          .onChange((value) => {
            this.p.address.area = value
          })
      }.padding(10)

      // 放置按钮
      Row({ space: 10 }) {
        Button("修改姓名")
          .onClick(() => {
            this.p.name = "老张"
          })
        Button("修改年龄")
          .onClick(() => {
            this.p.age++
          })
        Button("修改性别")
          .onClick(() => {
            this.p.sex = this.p.sex === "男" ? "女" : "男"
          })
      }
      .padding({
        left: 10,
        right: 10
      })
      .width("100%")

      Row({ space: 10 }) {
        Button("修改地址")
          .onClick(() => {
            this.p.address.province = "山东"
            this.p.address.city = "威海"
            this.p.address.area = "文登区"
            // 1
            // this.p.age++
            // 2
            this.p.address = {
              province: this.p.address.province,
              city: this.p.address.city,
              area:this.p.address.area
            }
          })

      }
      .padding({
        left: 10,
        right: 10
      })
      .width("100%")
    }
  }
}