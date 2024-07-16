import { CommonConstants } from '../../common/constants/CommonConstants'
@Component
 export default  struct SearchHeader {
  build() {
    Row({space:CommonConstants.SPACE_6}){
      Search({placeholder:'搜索花卉'})
        .textFont({size:18})
        .layoutWeight(1)
      Image($r('app.media.mg'))
        .width(20)
    }
    .width(CommonConstants.THOUSANDTH_940)
  }
}