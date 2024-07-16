class Flower {
  name: string;
  image: ResourceStr;
  description: string;
  constructor(name: string, image: ResourceStr, description: string) {
    this.name = name;
    this.image = image;
    this.description = description;
  }
}

// 自定义构造函数用于显示花卉信息
@Builder function FlowerCard(flower: Flower) {
  Row({ space: 10 }) {
    Image(flower.image)
      .width(100)
      .height(100)
      .objectFit(ImageFit.Cover)
      .borderRadius(8);

    Column({ space: 4 }) {
      Text(flower.name)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333');
      Text(flower.description)
        .fontSize(16)
        .fontColor('#666');
    }
    .flexGrow(1);
  }
  .onClick(() => {
    console.log(flower.name); // 打印花卉名字
  })
  .width('100%')
  .padding(10)
  .backgroundColor('#fff')
  .borderRadius(8)
  .shadow({ color: '#000', radius: 5, offsetX: 0, offsetY: 2 });

}

// 花卉展示列表组件
@Component
struct StudyList {
  @State flowers: Array<Flower>=[];

  build() {
    Column({ space: 8 }) {
      ForEach(
        this.flowers,
        (flower: Flower) => {
          FlowerCard(flower);
        }
      );
    }
    .width('100%');
  }
}

// 花卉识别首页组件
@Entry
@Component
export default struct FlowerRecognitionHome {
  private flowers: Array<Flower> = [
    { name: '玫瑰', image: $r('app.media.xrk'), description: '爱与热情' },
    { name: '郁金香', image: $r('app.media.xrk'), description: '完美的爱' },
    { name: '百合花', image: $r('app.media.xrk'), description: '纯洁与精美' },
    { name: '雏菊', image: $r('app.media.xrk'), description: '纯真与纯洁' },
    { name: '向日葵', image: $r('app.media.xrk'), description: '崇拜与忠诚' },
    { name: '兰花', image: $r('app.media.xrk'), description: '爱、奢华与美丽' }
  ];

  build() {
    Scroll(){
      Column({ space: 4 }) {
        Text('花卉展示')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor('#333')
          .margin({ bottom: 20 });
        StudyList({ flowers: this.flowers });
      }
    }
    .width('100%')
    .padding(10)
    .backgroundColor('#f0f0f0');
  }
}
