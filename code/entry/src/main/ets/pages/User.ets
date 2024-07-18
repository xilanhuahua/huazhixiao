@Entry
@Component
export default   struct User {
  @State message: string = 'Hello World'

  build() {
    Column() {
      Column({  }) {
        Row() {
          Image($r('app.media.xx'))
            .width(30)

          Text('我的')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)

          Image($r('app.media.sz'))
            .width(30)
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceBetween)
        .alignItems(VerticalAlign.Center)

        Image($r('app.media.tx'))
          .width(80)
          .height(80)
          .borderRadius(40)
          .margin({ top: 10 })

        Text('Flower测试')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .margin({ top: 10 })

        Text('落花时节又逢君.....')
          .fontSize(16)
          .fontColor('#666')
          .margin({ top: 5 })

        Row({ space: 140 }) {
          Text('0关注')
          Text('0粉丝')
        }
        .width('100%')
        .margin({ top: 20,left:150 })

        Row({ space: 60 }) {
          Column({ space: 10 }) {
            Image($r('app.media.OCR'))
              .width(30)
            Text('识别')
          }
          Column({ space: 10}) {
            Image($r('app.media.jd'))
              .width(30)
            Text('鉴定')
          }
          Column({ space: 10 }) {
            Image($r('app.media.gx'))
              .width(30)
            Text('贡献')
          }
          Column({ space: 10 }) {
            Image($r('app.media.sc'))
              .width(30)
            Text('收藏')
          }
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .margin({ top: 20, bottom: 30 })
        .padding({ left: 20, right: 20, top: 6, bottom: 6 })
        .shadow({ color: '#ffc1bcbc', radius: 5, offsetX: 0, offsetY: 2 })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      Text('我的动态')
        .fontSize(16)
        .fontWeight(FontWeight.Bold)
        .flexGrow(1)
        // .alignSelf(HorizontalAlign.Start)
        .padding({ top: 20 })
    }
    .height('100%')
    .justifyContent(FlexAlign.SpaceBetween)
  }
}
