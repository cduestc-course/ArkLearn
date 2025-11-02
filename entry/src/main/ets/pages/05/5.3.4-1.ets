// 自定义组件
// 1. 创建一个自定义组件实例, 测试使用
// 2. 自定义组件传递参数 →  可以设置状态初始值
@Component
struct MyComponent {
  // count:number = 1
  @State count: number = 1

  sayHello = () => {
    console.log('Hello!')
  }

  sayHi () {
    console.log('Hi!')
  }

  build() {
    Row() {
      Text('自定义组件' + this.count)
      Button('按钮').onClick(() => {
        this.count++
      })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(10)
    .border({ width: 1 })
    .width('100%')
  }
}

@Entry
@Component
struct Index {
  build() {
    Column() {
      MyComponent()
      MyComponent({ count: 10, sayHello: ()=>{

      }})
      MyComponent()
    }
    .padding(20)
  }
}

