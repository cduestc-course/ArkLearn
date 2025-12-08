import { util } from '@kit.ArkTS'
import {  deviceInfo } from '@kit.BasicServicesKit'
import { display, promptAction } from '@kit.ArkUI'

@Entry
@Component
struct GestureCase {
  @State
  showVoice: boolean = false
  screenWidth: number = 0
  @State
  currentMode: SelectType = SelectType.NONE
  @Builder
  getContent() {
    Column() {
      Row() {
        Row() {
          Text("删")
            .fontColor(Color.White)
            .fontSize(30)
        }
        .justifyContent(FlexAlign.Center)
        .width(80)
        .height(80)
        .borderRadius(40)
        .backgroundColor(this.currentMode === SelectType.DElETE ? Color.Red  : Color.Gray)
        .rotate({
          angle: -20
        })
        Row() {
          Text("文")
            .fontColor(Color.White)
            .fontSize(30)
        }
        .justifyContent(FlexAlign.Center)
        .width(80)
        .height(80)
        .borderRadius(40)
        .backgroundColor(this.currentMode === SelectType.TEXT ? Color.Green  : Color.Gray)
        .rotate({
          angle: 20
        })
      }
      .translate({y:-20})
      .height(80)
      .width('100%')
      .padding({
        left: 40,
        right: 40
      })
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .justifyContent(FlexAlign.Center)
    .width('100%')
    .height('100%')
    .backgroundColor("rgba(0,0,0,0.4)")
  }

  build() {
    Row() {
      Column() {
        Button("语音")
          .width('100%')
          .type(ButtonType.Normal)
          .gesture(
            GestureGroup(GestureMode.Parallel,
              LongPressGesture()
                .onAction(() => {
                  this.showVoice = true
                })
                .onActionEnd(() => {
                  this.showVoice = false
                }),
              PanGesture()
                .onActionUpdate((event) => {
                  if(event.fingerList[0].globalX < this.screenWidth / 3) {
                    this.currentMode = SelectType.DElETE
                  } else if (event.fingerList[0].globalX > this.screenWidth * 2 / 3) {
                    this.currentMode = SelectType.TEXT
                  } else {
                    this.currentMode = SelectType.NONE
                  }
                })
                .onActionEnd(() => {
                  this.currentMode = SelectType.NONE
                })
            )

          )
      }
      .padding(20)
      .width('100%')
    }
    .width('100%')
    .height('100%')
    .bindContentCover($$this.showVoice, this.getContent,
      {
        modalTransition: ModalTransition.NONE
      })
    .onAreaChange((oldArea: Area, newArea: Area) => {
      this.screenWidth = newArea.width as number
    })
  }
}

enum SelectType {
  DElETE,
  TEXT,
  NONE
}