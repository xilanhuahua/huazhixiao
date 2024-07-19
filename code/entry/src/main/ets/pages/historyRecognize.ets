
import router from '@ohos.router'

class Flower {
  name: string;
  image: ResourceStr;
  description: string;
  text:string;
  huayu:string;
  constructor(name: string, image: ResourceStr, description: string,text: string,huayu:string) {
    this.name = name;
    this.huayu=huayu;
    this.image = image;
    this.description = description;
    this.text=text;
  }
}

@Entry
@Component
struct Daka01 {
  @State message: string = 'Hello World2'

  private flowers: Array<Flower> = [
    { name: '玫瑰', image: $r("app.media.mmgg"),description: '几个世纪以来，玫瑰一直备受推崇。历史证据表明，它们大约在5000年前在中国生长，从那时起它们就一直在历史中发挥作用。无论是古希腊人、罗马人、基督徒、共济会或其他人，玫瑰始终是爱、美和平等的永恒象征。虽然每种颜色表达爱，美和平衡有点不同，但主要的信息仍然是爱。玫瑰有许多不同的含义，这取决于它的颜色。然而，任何玫瑰通常都可以被视为象征：爱、荣誉、信仰、美丽、平衡、热情、智慧、奉献和永恒。', huayu: '爱与热情',text:
    '玫瑰（学名：Rosa rugosa Thunb）：是蔷薇科、蔷薇属多种植物和培育花卉的通称名字。直立、蔓延或攀援灌木，多数被有皮刺、针刺或刺毛，稀无刺，有毛、无毛或有腺毛。叶互生；花单生；花托球形、坛形至杯形；花瓣5，稀4，开展，覆瓦状排列，白色、黄色，粉红色至红色；花柱顶生至侧生，外伸，离生或上部合生；花瓣倒卵形，重瓣至半重瓣，花有紫红色、黄色、粉色、白色和各种复色。枝条较为柔弱软垂且多密刺，每年花期只有一次',

    },
    { name: '郁金香', image: $r('app.media.yjx'),description: '郁金香的栽培品种已达到10000多个，广泛应用于花海展示和鲜切花生产 [7]。荷兰是世界郁金香的生产中心，生产的种球和切花远销世界多个国家和地区，每年创造外汇收入多达数十亿欧元 [17]。郁金香的花可作中药材入药，据《中药大辞典》记载，郁金香具有化湿辟秽之功效。主治脾胃湿浊，胸脘满闷，呕逆腹痛等', huayu: '完美的爱',text:
    '郁金香（学名：Tulipa×gesneriana L.）是百合科郁金香属多年生球根花卉，又名草麝香、旱荷花、洋荷花、洋水仙、郁香等 。郁金香具鳞茎。叶条状披针形至卵状披针形。花单朵顶生，大型而艳丽；花被片红色或杂有白色和黄色，有时为白色或黄色。花期4-5月',
    },
    { name: '百合花', image: $r('app.media.bh'), description: '百合花姿雅致，叶片青翠娟秀，有较高的观赏价值。 [2]百合色白肉嫩，味道甘甜，其丰富的营养成分使它不仅具有良好的营养滋补功效，而且对病后虚弱症等患者大有裨益。 [8] 百合鲜花含芳香油，可作香料；鳞茎含丰富淀粉，是一种名贵食品，亦作药用，有润肺止咳、清热、安神和利尿等功效 [7]，还对各种癌症有较好的疗效 [8]，其功效在《日华子本草》《本草纲目拾遗》的本草著作中均有记载', huayu: '纯洁与精美',text:
    '百合（Lilium brownii var. viridulum Baker）是百合科百合属植物。地下根茎为鳞茎球状，广展，无明显结节，白色；茎有紫色条纹，无毛；叶散生，上部叶常比中部叶小，倒披针形，叶缘平整，无毛，具有较短的叶柄；花为喇叭形，有香味，多为白色，背面带紫褐色，无斑点，顶端弯而不卷；蒴果矩圆形，有棱，内具多数种子。 花、果期6-9月',
    },
    { name: '雏菊', image: $r('app.media.cj'), description: '雏菊的叶止血消肿，主治创伤出血等；花序祛痰止咳，主治咳嗽痰多等。 [14]其提取物对黑色素生成有良好的抑制作用，起到美白的作用，是一种天然的美容佳品； [12]其具有观赏价值，常作花坛地植造景，也可作为盆栽。 [15]雏菊可吸收家中电器、塑料制品等散发的有害气体，具有很强的空气净化功能。 [10]雏菊的花语是天真和平、纯洁的美以及深藏在心底的爱，因此，雏菊在西方文学作品中很受欢迎，莎士比亚在《哈姆雷特》中对雏菊有所引用。', huayu: '纯真与纯洁' ,text:
    '雏菊（Bellis perennis L.），菊科雏菊属的多年生或一年生葶状草本植物。其株高约10厘米，叶子呈匙形，顶端是圆的，上半部有疏钝齿或波状齿；总花苞呈半球形或宽钟形，舌状花有一层，管状花较多；瘦果是倒卵形的，扁平，有边脉，但没有冠毛。花期为3—6月。 [7]雏菊得名与形态有关，因为花型比一般菊花小，像未长成的菊花，故名雏菊',
    },
    { name: '向日葵', image: $r('app.media.xrk'), description: '野生向日葵栖息地主要是草原以及干燥、开阔的地区。它们沿着路边、田野、沙漠边缘和草地生长。在阳光充足，潮湿或受干扰的地区生长最好。原产南美洲，驯化种由西班牙人于1510年从北美带到欧洲，最初为观赏用。19世纪末，又被从俄国引回北美洲。世界各国和中国均有栽培，通过人工培育，在不同生境上形成许多品种，特别在头状花序的大小色泽及瘦果形态上有许多变异，并为综合利用的最好原料', huayu: '崇拜与忠诚' ,text:
    '向日葵（学名：Helianthus annuus L.；英文名：Sunflowers）：是桔梗目、菊科、向日葵属的植物。因花序随太阳转动而得名。是一年生高大草本植物。茎粗壮，高1-3米，不分枝或有时上部分枝，被白色粗硬毛。叶互生，卵状心形或卵形，顶端急尖或渐尖，基生3出脉，边缘有粗锯齿，两面被短糙毛，有长柄。头状花序极大，直径10-30厘米，生于茎或枝端，常倾斜。总苞片多层，叶质，卵形至卵状披针形，顶端尾状渐尖，被长硬毛或缘毛。花托平或稍凸起，有近膜质的托片。舌状花多数，黄色，舌片开展，长圆状卵形或长圆形，不结实；管状花极多数，棕色或紫色，上端有披针形的裂片，结果实。瘦果倒卵形或卵状长圆形，稍扁，有细肋，被白色短柔毛，上端有2个膜片状的冠毛，早落'
    },
    { name: '兰花', image: $r('app.media.lh'), description: '中国传统名花中的兰花仅指分布在中国兰属植物中的若干种地生兰，如春兰、惠兰、建兰、墨兰和寒兰等，即通常所指的“中国兰”。这一类兰花与花大色艳的热带兰花大不相同，没有醒目的艳态，没有硕大的花、叶，却具有质朴文静、淡雅高洁的气质，很符合东方人的审美标准。在中国有一千余年的栽培历史',huayu: '爱、奢华与美丽',text:
    '兰花（学名：Cymbidium ssp.）：是单子叶植物纲、兰科、兰属植物通称。附生或地生草本，叶数枚至多枚，通常生于假鳞茎基部或下部节上，二列，带状或罕有倒披针形至狭椭圆形，基部一般有宽阔的鞘并围抱假鳞茎，有关节。总状花序具数花或多花，颜色有白、纯白、白绿、黄绿、淡黄、淡黄褐、黄、红、青、紫'
    }
  ];
  build() {
    Column() {
      Column() {
        Search()
        Text("·历史识别·")
          .margin({right:250,top:10})
          .fontColor("#888a8c")
      }
      .width('100%')
      .height(100)
      .backgroundColor("#f0f3f7")


      Column() {
        List({ space: 10 }) {
          ForEach(this.flowers, (flower: Flower, index: number) => {
            ListItem() {
              Column(){
                Image(flower.image).width("95%") .height(200) .margin({top:10}) .borderRadius(20)
                  .onClick(() => {
                    router.push({
                      url: 'pages/Daka02',
                      params:{
                        text:'aa',
                        num:2
                      }
                    })
                  })
                Text(flower.name)
                  .width('100%')
                  .height(50)
                  .fontSize(20)
                  .fontColor(Color.Black)
                  .textAlign(TextAlign.Start)
                  .backgroundColor("#ecfbfa")
                  .margin({left:20})

                Row(){
                  Text(flower.description)
                    .textAlign(TextAlign.Start)
                    .fontColor("#2b2b2b")
                    .textOverflow({overflow:TextOverflow.Ellipsis})
                    .maxLines(1)
                  Row(){
                    // Image("view/youyin1/image/xiaoyanjing.png") .width(20) .margin({right:10})
                    // Text(item.num+'').textAlign(TextAlign.End)
                  }.width("55%") .margin({left:150,top:-25})

                }.width('100%')

              }.backgroundColor("#ecfbfa")
              .height(285)
              .shadow({
                radius:10, //边缘半径
                color:Color.Black,//颜色
                offsetX:0, //左右移动
                offsetY:0,  //上下移动
              })


            }
          })
        }

      }.height(1000).width("90%")




    }.height(2000)
    .backgroundColor("#f7fdfd")

  }
}
