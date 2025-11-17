import { http } from '@kit.NetworkKit'
import { Category } from '../models'

// export const  getAllData = async () => {
//   const req = http.createHttp()
//   const res = await  req.request(".../takeaway.json")
//   return JSON.parse(res.result as string) as Category[]
// }

export const  getAllData = async () => {
  return Categories
}


export const Categories: Category[] = [
  {
    tag: "主食",
    name: "🍲 主食精选",
    foods: [
      {
        id: 101, name: "麻婆豆腐饭", like_ratio_desc: "98",
        food_tag_list: ["川菜", "微辣", "热销"], price: 38.00,
        picture: "https://picsum.photos/300/200?random=1", description: "嫩滑豆腐搭配浓郁麻辣酱汁，米饭杀手。",
        tag: "主食", month_saled: 1250, count: 0
      },
      {
        id: 102, name: "香菇滑鸡煲仔饭", like_ratio_desc: "95",
        food_tag_list: ["广式", "鲜香", "经典"], price: 45.00,
        picture: "https://picsum.photos/300/200?random=2", description: "米饭吸收了鸡肉和香菇的精华，底部锅巴焦香。",
        tag: "主食", month_saled: 980, count: 0
      },
      {
        id: 103, name: "黑椒牛肉意面", like_ratio_desc: "93",
        food_tag_list: ["西餐", "浓郁", "人气"], price: 55.00,
        picture: "https://picsum.photos/300/200?random=3", description: "Q弹意面配上黑椒汁和嫩滑牛肉片。",
        tag: "主食", month_saled: 750, count: 0
      },
      {
        id: 104, name: "扬州炒饭", like_ratio_desc: "97",
        food_tag_list: ["家常", "清爽", "传统"], price: 35.00,
        picture: "https://picsum.photos/300/200?random=4", description: "粒粒分明，食材丰富，老少皆宜。",
        tag: "主食", month_saled: 1500, count: 0
      },
      {
        id: 105, name: "红烧肉盖饭", like_ratio_desc: "94",
        food_tag_list: ["本帮菜", "咸甜", "下饭"], price: 42.00,
        picture: "https://picsum.photos/300/200?random=5", description: "肥而不腻，入口即化，经典口味。",
        tag: "主食", month_saled: 680, count: 0
      },
      {
        id: 106, name: "韩式泡菜炒年糕", like_ratio_desc: "90",
        food_tag_list: ["韩式", "酸辣", "QQ弹"], price: 48.00,
        picture: "https://picsum.photos/300/200?random=6", description: "地道韩式风味，Q弹年糕包裹浓郁酱汁。",
        tag: "主食", month_saled: 550, count: 0
      }
    ]
  },
  {
    tag: "汤品",
    name: "🥣 暖胃汤品",
    foods: [
      {
        id: 201, name: "山药排骨汤", like_ratio_desc: "100",
        food_tag_list: ["滋补", "清淡", "养生"], price: 25.00,
        picture: "https://picsum.photos/300/200?random=7", description: "慢火熬制，汤清味甜，滋补佳品。",
        tag: "汤品", month_saled: 620, count: 0
      },
      {
        id: 202, name: "酸辣汤", like_ratio_desc: "92",
        food_tag_list: ["开胃", "酸辣", "传统"], price: 18.00,
        picture: "https://picsum.photos/300/200?random=8", description: "酸辣可口，配料丰富，瞬间打开味蕾。",
        tag: "汤品", month_saled: 750, count: 0
      },
      {
        id: 203, name: "西红柿鸡蛋汤", like_ratio_desc: "99",
        food_tag_list: ["家常", "酸甜", "百搭"], price: 15.00,
        picture: "https://picsum.photos/300/200?random=9", description: "清爽解腻，简单而美味的经典搭配。",
        tag: "汤品", month_saled: 900, count: 0
      },
      {
        id: 204, name: "冬瓜海带排骨汤", like_ratio_desc: "94",
        food_tag_list: ["清热", "粤菜", "解腻"], price: 28.00,
        picture: "https://picsum.photos/300/200?random=10", description: "味道清淡鲜美，夏天必备。",
        tag: "汤品", month_saled: 500, count: 0
      },
      {
        id: 205, name: "玉米浓汤", like_ratio_desc: "96",
        food_tag_list: ["西式", "香浓", "奶油"], price: 22.00,
        picture: "https://picsum.photos/300/200?random=11", description: "口感顺滑，奶味和玉米的香甜完美结合。",
        tag: "汤品", month_saled: 450, count: 0
      },
      {
        id: 206, name: "菌菇鸡汤", like_ratio_desc: "98",
        food_tag_list: ["滋补", "鲜美", "养生"], price: 32.00,
        picture: "https://picsum.photos/300/200?random=12", description: "多种菌菇搭配土鸡熬制，营养丰富。",
        tag: "汤品", month_saled: 580, count: 0
      }
    ]
  },
  {
    tag: "小吃",
    name: "🥢 经典小吃",
    foods: [
      {
        id: 401, name: "蒜蓉烤生蚝 (半打)", like_ratio_desc: "97",
        food_tag_list: ["海鲜", "烧烤", "招牌"], price: 68.00,
        picture: "https://picsum.photos/300/200?random=13", description: "新鲜生蚝，搭配秘制蒜蓉酱，碳烤至香。",
        tag: "小吃", month_saled: 1100, count: 0
      },
      {
        id: 402, name: "炸鸡块", like_ratio_desc: "95",
        food_tag_list: ["美式", "酥脆", "儿童最爱"], price: 30.00,
        picture: "https://picsum.photos/300/200?random=14", description: "外酥里嫩，搭配番茄酱或甜辣酱。",
        tag: "小吃", month_saled: 850, count: 0
      },
      {
        id: 403, name: "葱油拌面 (小份)", like_ratio_desc: "96",
        food_tag_list: ["本帮", "清香", "面食"], price: 18.00,
        picture: "https://picsum.photos/300/200?random=15", description: "简单朴实，葱香浓郁，经典上海小吃。",
        tag: "小吃", month_saled: 950, count: 0
      },
      {
        id: 404, name: "麻辣烫", like_ratio_desc: "91",
        food_tag_list: ["街边", "麻辣", "自选"], price: 25.00,
        picture: "https://picsum.photos/300/200?random=16", description: "多种食材自选，热气腾腾，麻辣鲜香。",
        tag: "小吃", month_saled: 780, count: 0
      },
      {
        id: 405, name: "红油抄手 (6个)", like_ratio_desc: "93",
        food_tag_list: ["川味", "微辣", "馄饨"], price: 20.00,
        picture: "https://picsum.photos/300/200?random=17", description: "皮薄馅大，红油淋漓，香气扑鼻。",
        tag: "小吃", month_saled: 650, count: 0
      },
      {
        id: 406, name: "烤冷面", like_ratio_desc: "98",
        food_tag_list: ["东北", "街头", "Q弹"], price: 15.00,
        picture: "https://picsum.photos/300/200?random=18", description: "煎烤的Q弹面饼，配鸡蛋、火腿肠和酸甜酱。",
        tag: "小吃", month_saled: 1300, count: 0
      }
    ]
  },
  {
    tag: "甜点",
    name: "🍰 甜蜜甜点",
    foods: [
      {
        id: 301, name: "芒果西米露", like_ratio_desc: "99",
        food_tag_list: ["冰品", "甜点", "水果"], price: 22.00,
        picture: "https://picsum.photos/300/200?random=19", description: "新鲜芒果搭配Q弹西米，冰凉解暑。",
        tag: "甜点", month_saled: 880, count: 0
      },
      {
        id: 302, name: "红豆沙", like_ratio_desc: "96",
        food_tag_list: ["中式", "暖甜", "养颜"], price: 15.00,
        picture: "https://picsum.photos/300/200?random=20", description: "细腻绵密，甜而不腻，经典港式甜点。",
        tag: "甜点", month_saled: 510, count: 0
      },
      {
        id: 303, name: "提拉米苏", like_ratio_desc: "95",
        food_tag_list: ["意式", "咖啡", "蛋糕"], price: 35.00,
        picture: "https://picsum.photos/300/200?random=21", description: "浓郁的马斯卡彭奶酪和咖啡酒香。",
        tag: "甜点", month_saled: 400, count: 0
      },
      {
        id: 304, name: "双皮奶", like_ratio_desc: "98",
        food_tag_list: ["粤式", "牛奶", "Q滑"], price: 18.00,
        picture: "https://picsum.photos/300/200?random=22", description: "口感嫩滑，奶味香浓，冰镇热食皆宜。",
        tag: "甜点", month_saled: 720, count: 0
      },
      {
        id: 305, name: "焦糖布丁", like_ratio_desc: "94",
        food_tag_list: ["法式", "烤制", "焦香"], price: 20.00,
        picture: "https://picsum.photos/300/200?random=23", description: "蛋奶香浓郁，搭配微苦的焦糖酱。",
        tag: "甜点", month_saled: 600, count: 0
      },
      {
        id: 306, name: "芋圆仙草", like_ratio_desc: "97",
        food_tag_list: ["台式", "清凉", "多料"], price: 28.00,
        picture: "https://picsum.photos/300/200?random=24", description: "Q弹芋圆、滑嫩仙草，配上甜蜜红豆。",
        tag: "甜点", month_saled: 990, count: 0
      }
    ]
  }
];

