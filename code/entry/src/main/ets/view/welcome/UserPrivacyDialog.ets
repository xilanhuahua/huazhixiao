@CustomDialog
export default   struct UserpivacyDialog {
  controller:CustomDialogController
  confirm:()=>void
  cancel:()=>void
  build() {
    Column({space:10}){
    //   标签
      Text('花知晓')
        .fontSize(20)
        .fontWeight(50)
    //   内容
      Text('"花知晓"是一个基于TensorFlow 2.0的人工智能花卉识别应用程序，旨在通过科学的手段帮助小朋友认识和了解各种奇花异卉。这个应用程序利用深度学习技术和卷积神经网络（CNN）对花卉图像进行识别和分类，为小朋友们提供了一个互动学习和探索的平台')
    //   按钮
      Button('同意')
        .width(150)
        .backgroundColor(Color.Green)
        .onClick(()=>{
          this.confirm()
          this.controller.close()
        })
      Button('不同意')
        .width(150)
        .backgroundColor('#ffe8f2f3')
        .fontColor('#ffc8c6c6')
        .onClick(()=>{
          this.cancel()
          this.controller.close()
        })
    }
    .width('100%')
    .padding(10)
  }
}