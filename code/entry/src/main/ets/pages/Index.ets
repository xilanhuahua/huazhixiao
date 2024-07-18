import { CommonConstants } from '../common/constants/CommonConstants'
import recognize from '../view/flowerRecognize/recognizePage'
import SearchHeader from '../view/flowerstudy/SearchHead'
import study from '../view/flowerstudy/StudyPage'
import User from './User'
@Entry
@Component
struct Index{
  @State currentIndex:number =0
  @Builder TabBarBuilder(title:ResourceStr,image:ResourceStr,index){
    Column({space:CommonConstants.SPACE_8}){
      Image(image)
        .width(22)
        .fillColor(
          this.selectColor(index)
        )
      Text(title)
        .fontSize(12)
        .fontColor(
          this.selectColor(index)
        )
    }
  }
  selectColor(index: number) {
    return this.currentIndex === index ? $r('app.color.primary_color') : $r('app.color.gray')
  }
  build(){
    Tabs({barPosition:BarPosition.End}){
      TabContent(){
        study()
      }
      .tabBar(this.TabBarBuilder('花卉知识学习',$r('app.media.xx'),0))

      TabContent(){
        recognize()
      }
      .tabBar(this.TabBarBuilder('花卉识别',$r('app.media.flower'),1))

      TabContent(){
        User()
      }
      .tabBar(this.TabBarBuilder('我的',$r('app.media.yy'),2))
    }
    .width('100%')
    .height('100%')
    .onChange(index => this.currentIndex = index)
    // .margin({top:10})
  }
}