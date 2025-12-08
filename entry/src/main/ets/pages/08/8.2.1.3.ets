import { MessageEvent, worker } from '@kit.ArkTS'
import { BusinessError, emitter } from '@kit.BasicServicesKit'
import { promptAction } from '@kit.ArkUI'
import { Context } from '@kit.AbilityKit'

export interface MessageInfo{
  work:string
  params?:Record<string,string>
  context?:Context
}

@Entry
@Component
struct WorkerCase {
  @State
  downloadProgress: string = '0%'

  aboutToAppear(): void {
    emitter.on('worker',(data)=>{
      this.downloadProgress =  data.data!.progress as string
    })
  }
  myWorker?:worker.ThreadWorker
  createWorker() {
    // 1.创建任务
    // 路径规范：{模块}/ets/目录名称/文件名.ets
    const myWorker = new worker.ThreadWorker("entry/ets/workers/Worker.ets")
    this.myWorker = myWorker
    // 2.去worker中设置任务
    // 3.需要发消息通知worker执行任务
    myWorker.postMessage({
      work:'start',
      context:this.getUIContext().getHostContext()//getContext()
    } as MessageInfo)

    // 4.监听响应的结果
    myWorker.onmessage = (e) => {
      this.downloadProgress = e.data.progress as string
    }
  }

  tryWorker(){
    try{
      this.myWorker?.postMessage({
        work:'test'
      } as MessageInfo)
    } catch (err) {
      promptAction.showToast({
        message:JSON.stringify(err)
      })
    }
  }

  build() {
    Column() {
      Text('下载进度：' + this.downloadProgress)
      Button('下载png图片')
        .onClick(() => {
          this.createWorker()
        })
      Button('测试销毁')
        .onClick(()=>{
          this.tryWorker()
        })
    }
    .height('100%')
    .width('100%')
  }
}