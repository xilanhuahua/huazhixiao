import SearchHeader from './SearchHead'
import FlowerRecognitionHome from './StudyList'
import StudyList from './StudyList'
import router from '@ohos.router'
@Component
export default struct study {
  build() {
    Column(){
<<<<<<< HEAD
=======
      SearchHeader()


>>>>>>> 6808c385a0d89b0d83a9ce1fb2f95b749745498d
      // 头部搜索栏
      SearchHeader()

      // 统计卡片

      // 记录列表
      FlowerRecognitionHome()

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.index_page_background'))
  }
}