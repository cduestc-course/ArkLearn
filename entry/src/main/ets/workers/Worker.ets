import { ErrorEvent, MessageEvents, ThreadWorkerGlobalScope, worker } from '@kit.ArkTS';
import { emitter, request } from '@kit.BasicServicesKit';
import { Context } from '@kit.AbilityKit';
import { MessageInfo } from '../pages/08/8.2.1.3';

const workerPort: ThreadWorkerGlobalScope = worker.workerPort;

/**
 * Defines the event handler to be called when the worker thread receives a message sent by the host thread.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessage = (e: MessageEvents) => {
  console.log('test-progress','onmessage')
  const work = e.data as MessageInfo
  if(work.work==='start'){
    //   2.声明要做的事
    downLoadFile(work.context as Context, (progress) => {
      // 要告诉页面这个下载进度
      workerPort.postMessage({
        progress
      })
    })
  }
}

/**
 * Defines the event handler to be called when the worker receives a message that cannot be deserialized.
 * The event handler is executed in the worker thread.
 *
 * @param e message data
 */
workerPort.onmessageerror = (e: MessageEvents) => {
}

/**
 * Defines the event handler to be called when an exception occurs during worker execution.
 * The event handler is executed in the worker thread.
 *
 * @param e error message
 */
workerPort.onerror = (e: ErrorEvent) => {
}

async function downLoadFile(context: Context, cb: (progress: string) => void) {
  const task = await request.downloadFile(context, {
    url: 'https://developer.huawei.com/allianceCmsResource/resource/HUAWEI_Developer_VUE/images/Ark/overview-pathway/ArkUI-icon-gaoqing.png',
    filePath: context.cacheDir + '/test.png'
  })
  task.on('progress', (current, total) => {
    // cb((current / total * 100).toFixed(2) + '%')
    emitter.emit('worker',{
      data:{
        progress:(current / total * 100).toFixed(2) + '%'
      }
    })
    if(current === total){
      workerPort.close()
    }
  })
}