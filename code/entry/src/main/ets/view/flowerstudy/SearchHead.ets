import { CommonConstants } from '../../common/constants/CommonConstants'
import router from '@ohos.router'
class Flower {
  name: string;
  image: ResourceStr;
  description: string;
  text:string;
  constructor(name: string, image: ResourceStr, description: string,text:string) {
    this.name = name;
    this.image = image;
    this.description = description;
    this.text=text;
  }
}
@Component
 export default  struct SearchHeader {
  private flowers: Array<Flower> = [
    { name: '玫瑰', image: $r("app.media.mgh"), description: '爱与热情',text:
    '玫瑰（学名：Rosa rugosa Thunb）：是蔷薇科、蔷薇属多种植物和培育花卉的通称名字。直立、蔓延或攀援灌木，多数被有皮刺、针刺或刺毛，稀无刺，有毛、无毛或有腺毛。叶互生；花单生；花托球形、坛形至杯形；花瓣5，稀4，开展，覆瓦状排列，白色、黄色，粉红色至红色；花柱顶生至侧生，外伸，离生或上部合生；花瓣倒卵形，重瓣至半重瓣，花有紫红色、黄色、粉色、白色和各种复色。枝条较为柔弱软垂且多密刺，每年花期只有一次',

    },
    { name: '郁金香', image: $r('app.media.yjx'), description: '完美的爱',text:
    '郁金香（学名：Tulipa×gesneriana L.）是百合科郁金香属多年生球根花卉，又名草麝香、旱荷花、洋荷花、洋水仙、郁香等 。郁金香具鳞茎。叶条状披针形至卵状披针形。花单朵顶生，大型而艳丽；花被片红色或杂有白色和黄色，有时为白色或黄色。花期4-5月',
    },
    { name: '百合花', image: $r('app.media.bh'), description: '纯洁与精美',text:
    '百合（Lilium brownii var. viridulum Baker）是百合科百合属植物。地下根茎为鳞茎球状，广展，无明显结节，白色；茎有紫色条纹，无毛；叶散生，上部叶常比中部叶小，倒披针形，叶缘平整，无毛，具有较短的叶柄；花为喇叭形，有香味，多为白色，背面带紫褐色，无斑点，顶端弯而不卷；蒴果矩圆形，有棱，内具多数种子。 花、果期6-9月',
    },
    { name: '雏菊', image: $r('app.media.cj'), description: '纯真与纯洁' ,text:
    '雏菊（Bellis perennis L.），菊科雏菊属的多年生或一年生葶状草本植物。其株高约10厘米，叶子呈匙形，顶端是圆的，上半部有疏钝齿或波状齿；总花苞呈半球形或宽钟形，舌状花有一层，管状花较多；瘦果是倒卵形的，扁平，有边脉，但没有冠毛。花期为3—6月。 [7]雏菊得名与形态有关，因为花型比一般菊花小，像未长成的菊花，故名雏菊',
    },
    { name: '向日葵', image: $r('app.media.xrk'), description: '崇拜与忠诚' ,text:
    '向日葵（学名：Helianthus annuus L.；英文名：Sunflowers）：是桔梗目、菊科、向日葵属的植物。因花序随太阳转动而得名。是一年生高大草本植物。茎粗壮，高1-3米，不分枝或有时上部分枝，被白色粗硬毛。叶互生，卵状心形或卵形，顶端急尖或渐尖，基生3出脉，边缘有粗锯齿，两面被短糙毛，有长柄。头状花序极大，直径10-30厘米，生于茎或枝端，常倾斜。总苞片多层，叶质，卵形至卵状披针形，顶端尾状渐尖，被长硬毛或缘毛。花托平或稍凸起，有近膜质的托片。舌状花多数，黄色，舌片开展，长圆状卵形或长圆形，不结实；管状花极多数，棕色或紫色，上端有披针形的裂片，结果实。瘦果倒卵形或卵状长圆形，稍扁，有细肋，被白色短柔毛，上端有2个膜片状的冠毛，早落'
    },
    { name: '兰花', image: $r('app.media.lh'), description: '中国传统名花中的兰花仅指分布在中国兰属植物中的若干种地生兰，如春兰、惠兰、建兰、墨兰和寒兰等，即通常所指的“中国兰”。这一类兰花与花大色艳的热带兰花大不相同，没有醒目的艳态，没有硕大的花、叶，却具有质朴文静、淡雅高洁的气质，很符合东方人的审美标准。在中国有一千余年的栽培历史',text:
    '兰花（学名：Cymbidium ssp.）：是单子叶植物纲、兰科、兰属植物通称。附生或地生草本，叶数枚至多枚，通常生于假鳞茎基部或下部节上，二列，带状或罕有倒披针形至狭椭圆形，基部一般有宽阔的鞘并围抱假鳞茎，有关节。总状花序具数花或多花，颜色有白、纯白、白绿、黄绿、淡黄、淡黄褐、黄、红、青、紫'
    }
  ];
  @State sumvalue:string='';
  build() {
    Row({space:CommonConstants.SPACE_6}){
      Search({placeholder:'搜索花卉',value:this.sumvalue})
        .textFont({size:18})
        .layoutWeight(1)
      Image($r("app.media.mgh"))
        .width(20)
        .onClick(()=>{
          this.flowers.forEach(element => {
            if (element.name===this.sumvalue) {
              router.pushUrl({
                url: 'pages/StudyFlower',
                params: { flowerName: element.name, flowerDescription:element.description, flowerImage: element.image,text:element.text }
              });
            }
          });

        }
        )
    }
    .width(CommonConstants.THOUSANDTH_940)
  }
}