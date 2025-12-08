import { taskpool } from '@kit.ArkTS'
import { emitter } from '@kit.BasicServicesKit'

// 1.创建任务
@Concurrent
async function getData(params1: string, params2: string) {
  await new Promise<boolean>((resolve) => {
    setTimeout(() => {
      return resolve(true)
    }, 1000)
  })
  // 线程内无法通信，会阻塞await
  // getContext().eventHub.emit('taskpool')
  // 跨线程通信可以成功
  emitter.emit('taskpool')
  return params1 + params2 + Math.random().toFixed(2)
}

@Entry
@Component
struct TaskPoolCase {
  @State
  addTaskResult: string = ''
  @State
  createTaskResult: string = ''
  @State
  taskGroup: string[] = []
  @State
  taskPriority: string[] = []
  @State
  emitNum: number = 0
  taskArray:taskpool.Task[] = []

  aboutToAppear(): void {
    // 线程内无法订阅到
    // getContext().eventHub.on('taskpool', () => {
    //   this.emitNum++
    // })
    // 线程间可以
    emitter.on('taskpool', () => {
      this.emitNum++
    })
  }

  async addTask() {
    //2.将Concurrent函数添加至队列
    const result = await taskpool.execute(getData, 'addTask', '-')
    // 3.等待处理结果
    this.addTaskResult = result.toString()
  }

  async createTask() {
    //2.创建task任务
    const task = new taskpool.Task(getData, 'createTask', '-')
    const result = await taskpool.execute(task, taskpool.Priority.LOW)
    // 3.等待处理结果
    this.createTaskResult = result.toString()
  }

  async createTaskGroup() {
    //2.将task任务添加至队列（自动分配）
    const group = new taskpool.TaskGroup()
    group.addTask(getData, 'createTaskGroup4', '-')
    group.addTask(getData, 'createTaskGroup1', '-')
    group.addTask(getData, 'createTaskGroup2', '-')
    group.addTask(getData, 'createTaskGroup3', '-')
    const result = await taskpool.execute(group, taskpool.Priority.LOW)
    this.taskGroup = result.map((item: Object) => item.toString())
  }

  async checkPriority() {
    let taskArray: Array<taskpool.Task> = [];
    // 创建100个任务并添加至taskArray
    for (let i: number = 0; i < 20; i++) {
      let task: taskpool.Task = new taskpool.Task(getData, 'task', i + ':');
      taskArray.push(task);
    }
    this.taskArray = taskArray
    for (let i: number = 0; i < taskArray.length; i += 4) { // 4: 每次执行4个任务，循环取任务时需后移4项，确保执行的是不同的任务
      taskpool.execute(taskArray[i], taskpool.Priority.HIGH).then(res => {
        this.taskPriority.push(res.toString());
      })
      taskpool.execute(taskArray[i+1], taskpool.Priority.MEDIUM).then(res => {
        this.taskPriority.push(res.toString());
      })
      taskpool.execute(taskArray[i+2], taskpool.Priority.LOW).then(res => {
        this.taskPriority.push(res.toString());
      })
      taskpool.execute(taskArray[i+3], taskpool.Priority.IDLE).then(res => {
        this.taskPriority.push(res.toString());
      })
    }
  }

  build() {
    Column() {
      Text('emit次数：' + this.emitNum)
      Text('addTask任务结果：' + this.addTaskResult)
      Button('添加Task任务')
        .onClick(() => {
          this.addTask()
        })
      Text('createTask任务结果：' + this.createTaskResult)
      Button('创建Task任务')
        .onClick(() => {
          this.createTask()
        })
      Text('Task任务组结果：')
      ForEach(this.taskGroup, (item: string) => {
        Text(item)
      })
      Button('创建Task任务组')
        .onClick(() => {
          this.createTaskGroup()
        })
      Text('Task任务Priority结果：' + this.taskPriority.length)
      List() {
        ForEach(this.taskPriority, (item: string) => {
          ListItem() {
            Text(item)
          }
        })
      }.layoutWeight(1)

      Button('检测Priority')
        .onClick(() => {
          this.checkPriority()
        })
      Button('取消任务11')
        .onClick(()=>{
          taskpool.cancel(this.taskArray[11])
        })
    }
    .height('100%')
    .width('100%')
  }
}