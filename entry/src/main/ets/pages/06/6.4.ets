import {request} from '@kit.BasicServicesKit'

@Entry
@Component
struct DownloadCase {
  @State downloadUrl: string = 'https://developer.huawei.com/allianceCmsResource/resource/HUAWEI_Developer_VUE/images/Ark/overview-pathway/ArkUI-icon-gaoqing.png'
  @State filePath:string = ''
  build() {
    Row() {
      Column({ space: 20 }) {
        Image(this.downloadUrl)
          .width(200)
        Button('下载')
          .onClick(async () => {
            let filepath = this.getUIContext().getHostContext()?.filesDir + '/test3.png'
            const task = await request.downloadFile(
              this.getUIContext().getHostContext()!,
              {
                url: this.downloadUrl,
                filePath: filepath
              }
            )
            task.on('complete', ()=>{
              this.filePath = filepath
              AlertDialog.show({
                message: '下载成功'
              })
            })
          })

        if(this.filePath){
          //读取本地文件
          Image('file://' + this.filePath)
            .width(200)
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}