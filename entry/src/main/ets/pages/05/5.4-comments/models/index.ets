export interface ReplyItem {
  avatar: ResourceStr // 头像
  author: string   // 作者
  id: number  // 评论的id
  content: string // 评论内容
  time: string // 发表时间
  area: string // 地区
  likeNum: number // 点赞数量
  likeFlag: boolean | null // 当前用户是否点过赞
}

export class ReplyItemModel implements ReplyItem {
  id: number = 0
  avatar: string | Resource = ''
  author: string = ''
  content: string = ''
  time: string = ''
  area: string = ''
  likeNum: number = 0
  likeFlag: boolean | null = null

  constructor(model: ReplyItem) {
    this.id = model.id
    this.avatar = model.avatar
    this.author = model.author
    this.content = model.content
    this.time = model.time
    this.area = model.area
    this.likeNum = model.likeNum
    this.likeFlag = model.likeFlag
  }
}
