
import UserpivacyDialog from '../view/welcome/UserPrivacyDialog'
import common from '@ohos.app.ability.common'
import PreferenceUtil from '../common/utils/PreferenceUtil'
import router from '@ohos.router'
@Extend(Text) function colorsizeop(opacity:number,fontsize:number=10){
  .fontSize(fontsize)
  .opacity(opacity)
}
const pref_key='userPrivacyKey'
@Entry
@Component
struct WelcomePage {
  context = getContext(this) as common.UIAbilityContext
  @State message: string = 'Hello World'
  controller:CustomDialogController =new CustomDialogController({
    builder:UserpivacyDialog({
      confirm:()=>this.onConfirm(),
      cancel:()=>this.exitApp()
    })
  })
  async aboutToAppear(){
     let isAgree=  await PreferenceUtil.getPreferenceValue(pref_key,false)
    // 加载首选项
    // 判断是否同意
    if (isAgree) {
      // 跳转首页
        this.jumpToIndex()
    }else {
      this.controller.open()
    }

  }
  jumpToIndex(){
    setTimeout(()=>{
      router.replaceUrl({
        url:'pages/Index'
      })
    },1000)

  }
  onConfirm(){
  //   点击同意事件
  //   保存首选项
    PreferenceUtil.putPreferenceValue(pref_key,true)
    this.jumpToIndex()
  }
  exitApp(){
  //   点击退出app
    this.context.terminateSelf()
  }

  build() {
    Column({space:10}) {
      //   中央
      Row(){
        Image($r('app.media.xrk')).width(260)
      }
      .layoutWeight(1)
      //设置布局权重


      //   logo



      //文字描述
      Row(){
        Text('花知晓')
          .colorsizeop(0.7,36)
          .fontColor(Color.Black)
      }
      Text('花知晓由肖润哲，骆欣怡，贺蒋共同开发')
        .colorsizeop(0.7,17)
        .margin({bottom:35})
        .padding(5)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffc0ea9b')


  }
}