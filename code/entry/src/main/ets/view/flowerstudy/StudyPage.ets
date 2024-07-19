import SearchHeader from './SearchHead'
import FlowerRecognitionHome from './StudyList'
import StudyList from './StudyList'
import router from '@ohos.router'
import Lunbotu1 from '../flowerRecognize/lunbotu'
@Component
export default struct study {
  build() {
    Column(){



      // 头部搜索栏
      SearchHeader()
      Lunbotu1()
      // 统计卡片

      // 记录列表
      FlowerRecognitionHome()

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.index_page_background'))
  }
}