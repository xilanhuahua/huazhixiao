@Component
export default struct Lunbotu1 {
  private swiperController: SwiperController = new SwiperController()

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        Image($r("app.media.cj")).width('100%').height(160)
        // Image($r("app.media.mgh")).width('100%').height(160)
        Image($r("app.media.yjx")).height(160)


      }
      .width('85%')
      .borderRadius(10)
      .cachedCount(2)
      .index(1)
      .autoPlay(true)
      .interval(4000)
      .indicator(true)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .curve(Curve.Linear)
      .onChange((index: number) => {
        console.info(index.toString())
      })

    }.width('100%')
    .margin({ top: 5 })
  }
}