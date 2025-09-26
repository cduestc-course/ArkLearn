//// 1
console.log('我说', 'Hello World')

//// 2 注释
/*长篇注释*/

//// 3 变量
// let 变量名: 类型 = 值
let title: string = '奥利奥水果捞'
let price: number = 21.8
let isSelect: boolean = true

//// 4 常量
const PI: number = 3.14
console.log('圆周率', PI)

const companyName: string = '华为'
console.log('公司名称', companyName)

//// 5 数组
// let 数组名: 类型[] = [数据1, 数据2,...]
let names: string[] = ['小红', '小明', '大强']
console.log('取出小明', names[1])

//// 6 函数
function fn () {
  console.log('五角星', '☆')
  console.log('五角星', '☆☆')
  console.log('五角星', '☆☆☆')
  console.log('五角星', '☆☆☆☆')
  console.log('五角星', '☆☆☆☆☆')
}
fn() // 第一次输出 5行五角星
fn() // 第二次输出 5行五角星
fn() // 第三次输出 5行五角星

function sum(a: number, b: number) {
  let res: number = a + b
  console.log('加法结果是', res)
  return res
}

sum(1, 2)
sum(10, 20)
sum(100, 200)

//// 7 箭头函数
/*
let 函数名 = (形参1: 类型, 形参2: 类型) => {
  // 函数体
  // 1. 计算过程
  // 2. 返回结果
  return 计算的结果
}
*
函数名(实参1, 实参2)
*/
let buy = (price: number, weight: number = 1) => {
  let result: number = price * weight
  return result
}

let apple: number = buy(2)
console.log('苹果', apple)

let banana: number = buy(4, 4)
console.log('香蕉', banana)

//// 8 对象
// a. 定义接口
interface Person {
  name: string
  age: number
  weight: number
}

// b. 基于接口，定义对象
let ym: Person =  {
  name: '张三',
  age: 18,
  weight: 90
}

console.log('名字', ym.name)
console.log('年龄', ym.age)

let lss: Person =  {
  name: '李四',
  age: 19,
  weight: 88
}

console.log('名字', lss.name)
console.log('年龄', lss.age)

//// 9 对象-方法
interface Person2{
  dance: () => void
  sing: (song: string) => void
}

let zs: Person2 = {
  dance: () => {
    console.log('张三说', '我来跳个舞')
  },
  sing: (song: string) => {
    console.log('张三说', '我来唱首', song)
  }
}
// 对象名.方法名（参数）
zs.dance()
zs.sing('爱的供养')

//// 10 联合类型
// let 变量: 类型1  |  类型2  |  类型3 = 值

let judge: number | string = 100

judge = 'A+'
judge = '优秀'

console.log('年终考试评价', judge)

// 联合类型可以将变量值约定在一组数据范围内进行选择
let gender: 'man' | 'woman' | 'secret' = 'secret'

//// 11 枚举类型
// a. 定义枚举 （定义常量列表）
enum ThemeColor {
  Red = '#ff0f29',
  Orange = '#ff7100',
  Green = '#30b30e',
}
// b. 给变量设定枚举类型
let color: ThemeColor = ThemeColor.Orange
console.log('color', color)


//// 暂时不管
@Entry
@Component
struct Index{
  build(){}
}