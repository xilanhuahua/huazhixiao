import axios, { FormData } from '@ohos/axios'
// 定义花卉类
class Flower {
  name: string
  image: ResourceStr

  constructor(name: string, image: ResourceStr) {
    this.name = name
    this.image = image
  }
}

// 自定义构造函数用于显示花卉信息
@Builder function FlowerCard(flower: Flower) {
  Column({ space: 4 }) {
    Image(flower.image)
      .width('100%')
      .height(200)
      .objectFit(ImageFit.Cover)
      .borderRadius(8)
    Text(flower.name)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .fontColor('#333')
  }
  .width('100%')
  .padding(10)
  .backgroundColor('#fff')
  .borderRadius(8)
  .shadow({ color: '#000', radius: 5, offsetX: 0, offsetY: 2 })
}

// 自定义公共样式
@Styles function fillscreen() {
  .width('100%')
  .height('100%')
  .backgroundColor('#Efefef')
  .padding(20)
}

// 头部组件
@Component
struct HeadComponent {
  @Prop title: string

  build() {
    Row({ space: 10 }) {
      Text(this.title)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333')
        .flexGrow(1)
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height(56)
    .backgroundColor('#fff')
    .padding({ left: 16, right: 16 })
    // .borderBottom('1px solid #eee')
  }
}

// 首页组件
@Entry
@Component
struct FlowerRecognitionHome {
  private flowers: Array<Flower> = []
  private selectedImage: ResourceStr = null

  private async uploadImage() {
    // 实现上传图片的逻辑，并将图片资源赋值给 selectedImage
    const imagePath = await this.chooseImage()
    this.selectedImage = imagePath
    this.recognizeFlower(this.selectedImage)
  }

  private async chooseImage(): Promise<ResourceStr> {
    // 这里需要实现图片选择的逻辑，通常会弹出文件选择框
    // 这只是一个示例，实际需要根据平台和框架选择适当的方法
    return new Promise((resolve) => {
      // 模拟文件选择
      resolve($r('app.media.app_icon'))
    })
  }

  private async recognizeFlower(image: ResourceStr) {
    const formData = new FormData()
    formData.append('image', image)

    try {
      const response = await axios.post('http://127.0.0.1:5000/predict', formData, {
        headers: {
          'Content-Type': 'multipart/form-data'
        }
      })
      const result = response.data
      const recognizedFlower = new Flower(result.name, image)
      this.flowers.push(recognizedFlower)
    } catch (error) {
      console.error('Error recognizing flower:', error)
    }
  }

  build() {
    Column({ space: 8 }) {
      HeadComponent({ title: '花卉识别' })
        .margin({ bottom: 10 })

      if (this.selectedImage) {
        Image(this.selectedImage)
          .width('100%')
          .height(300)
          .objectFit(ImageFit.Cover)
      }

      Button('上传图片')
        .onClick(() => this.uploadImage())
        .margin({ top: 20 })

      List({ space: 8 }) {
        ForEach(
          this.flowers,
          (flower: Flower) => {
            ListItem() {
              FlowerCard(flower)
            }
          }
        )
      }
      .width('100%')
      .layoutWeight(1)
    }
    .fillscreen()
  }
}
