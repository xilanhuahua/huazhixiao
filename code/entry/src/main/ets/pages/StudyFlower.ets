import router from '@ohos.router';

@Entry
@Component
struct StudyFlower {
  params = router.getParams();

  flowerName: string = this.params['flowerName'];
  flowerDescription: string = this.params['flowerDescription'];
  flowerImage: ResourceStr = this.params['flowerImage'];
  text:string=this.params['text']



  build() {
    Scroll() {
      Column({ space: 20 }) {
        Row() {
          Button('<')
            .fontSize(16)
            .fontColor('#fff')
            .backgroundColor('#ffcdd7e2')
            .borderRadius(2)
            // .padding({ left: 10, right: 10, top: 1, bottom: 5 })
            .onClick(() => {
              router.back();
            });
          Text(this.flowerName)
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
            .fontColor('#333')
            .textAlign(TextAlign.Center)
            .margin({ left:'50%'});
        }
        .width('100%')



        Image(this.flowerImage)
          .width('100%')
          .height(300)
          .objectFit(ImageFit.Cover)
          .borderRadius(8);



        // Text(this.flowerDescription)
        //   .fontSize(18)
        //   .fontColor('#666')
        //   .lineHeight(1.5)
        //   .padding({ left: 10, right: 10 });
        Text(this.text)
        Text(this.flowerDescription)
          // .flexGrow(1)
        // 你可以添加更多关于花卉的详细信息
      }
      .width('100%')
      .padding(20);
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#fff')

  }
}
