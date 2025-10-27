import {HmCommentItem, HmNavBar, HmReplyInput} from './components'
import {ReplyItem, ReplyItemModel} from './models'

@Entry
@Component
struct Comments {
  @State commentList: ReplyItemModel[] = [
    new ReplyItemModel({
      id: 1,
      avatar: 'https://picx.zhimg.com/027729d02bdf060e24973c3726fea9da_l.jpg?source=06d4cd63',
      author: '技术爱好者-阿杰',
      content: '鸿蒙系统的“超级终端”功能确实好用，设备之间一碰即连，文件流转非常方便，这才是真正的分布式体验。',
      time: '10-25',
      area: '深圳',
      likeNum: 158,
      likeFlag: true
    }) ,
    new ReplyItemModel({
      id: 2,
      avatar: 'https://pic1.zhimg.com/v2-5a3f5190369ae59c12bee33abfe0c5cc_xl.jpg?source=32738c0c',
      author: 'App开发者老王',
      content: 'ArkTS开发体验提升了很多，特别是跨设备部署的效率很高，能节约不少人力。生态正在快速完善中，潜力巨大。',
      time: '10-25',
      area: '北京',
      likeNum: 92,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 3,
      avatar: 'https://picx.zhimg.com/v2-e6f4605c16e4378572a96dad7eaaf2b0_l.jpg?source=06d4cd63',
      author: 'Mate用户小李',
      content: '鸿蒙6的流畅度确实有提升，配合方舟引擎，感觉比上一版本更丝滑了。期待更多应用支持“实况窗”功能。',
      time: '10-24',
      area: '上海',
      likeNum: 75,
      likeFlag: true
    }),
    new ReplyItemModel({
      id: 4,
      avatar: 'https://picx.zhimg.com/v2-53e7cf84228e26f419d924c2bf8d5d70_l.jpg?source=06d4cd63',
      author: '隐私保护关注者',
      content: 'AI防窥和更严格的权限管理是亮点，主动安全防护让人更放心，希望未来能继续加强这方面的投入。',
      time: '10-23',
      area: '广州',
      likeNum: 139,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 5,
      avatar: 'https://pic1.zhimg.com/v2-eeddfaae049df2a407ff37540894c8ce_l.jpg?source=06d4cd63',
      author: '智能家居迷',
      content: '我家里的智能设备基本都接入了鸿蒙智联，统一管理和控制非常方便，真正实现了设备间的互联互通。',
      time: '10-23',
      area: '旧金山',
      likeNum: 61,
      likeFlag: false
    }),
    new ReplyItemModel({
      id: 6,
      avatar: 'https://picx.zhimg.com/v2-fab3da929232ae911e92bf8137d11f3a_l.jpg?source=06d4cd63',
      author: '学生小张',
      content: '元服务非常好用，不用下载App就能完成很多轻量级操作，节省了手机空间，找服务更直接。',
      time: '10-22',
      area: '武汉',
      likeNum: 100,
      likeFlag: true
    })
  ]

  @State showTop: boolean = true
  @State currentComment: ReplyItemModel = new ReplyItemModel({
    id: 999,
    author: 'DogeDan',
    avatar: $r("app.media.profile"),
    likeNum: 10,
    likeFlag: false,
    time: '10-21',
    area: '成都',
    content: 'HarmonyOS是面向全场景、以分布式技术实现万物互联和无缝协同体验的新一代操作系统。'
  })

  //创建scroller
  scroller: Scroller = new Scroller()

  changeLike (item: ReplyItemModel, type?: "top" | "bottom") {
    // 需要拿到点击的数据 拿到数据更新数据即可
    // item.likeNum
    // item.likeFlag
    if(item.likeFlag) {
      // 点过赞
      item.likeNum--
    }
    else {
      // 没有点过赞
      item.likeNum++
    }
    item.likeFlag = !item.likeFlag // 取反
    if(type !== "top") {
      // State的修饰符的更新机制
      // 只能监测到第一层
      const index = this.commentList.findIndex(obj => obj.id === item.id)
      //this.commentList[index] = item // 这么写为什么不行 // 引用类型 基础类型
      //  this.commentList[index] = new ReplyItemModel(item)
      this.commentList.splice(index, 1, new ReplyItemModel(item))
    }
    // else {
    //   this.currentComment = new ReplyItemModel(item)
    // }
  }

  addComment(content: string) {
    this.commentList.unshift(new ReplyItemModel({
      id: Math.random() ,
      avatar: $r("app.media.user"),
      author: 'Doge',
      content,
      time: "10-27",
      area: '成都',
      likeNum: 0,
      likeFlag: false
    }))

    // 控制滚动条
    this.scroller.scrollEdge(Edge.Top)
  }

  build() {
    Column() {
      HmNavBar({ title: '评论回复'  })
      if(this.showTop) {
        HmCommentItem({
          item: this.currentComment,
          changeLike: () => {
            this.changeLike(this.currentComment, "top")
            this.showTop = false
            setTimeout(() => {
              this.showTop = true
            }, 100)
          }
        })
      }
      Divider().strokeWidth(6)
      Row() {
        Text(`评论数 ${this.commentList.length}`)
      }
      .width('100%')
      .height(50)
      .padding({
        left: 20
      })
      .border({
        color: '#f3f4f5',
        width: {
          bottom: 1
        }
      })
      // ForEach([1,2,3,4,5,6], () => {
      //   HmCommentItem()
      // })
      List({ scroller: this.scroller }) {
        ForEach(this.commentList, (item: ReplyItemModel) => {
          ListItem() {
            HmCommentItem({
              item,
              changeLike: () => {
                this.changeLike(item)
              }
            })
          }
        })
      }.layoutWeight(1)
      HmReplyInput({
        publishComment: (content: string) => {
          this.addComment(content)
        }
      })
    }
  }
}