import { router } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    // 相对容器布局,不考虑里面元素的堆叠顺序
    RelativeContainer() {
      // 文本容器，绑定文本内容
      Text(this.message)
        // 绑定 id
        .id('HelloWorld')
        // 设置文本文字大小
        .fontSize(50)
        // 设置文本为加粗
        .fontWeight(FontWeight.Bold)
        // 设置该容器相对为父容器的垂直、水平居中
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
      // 第一种按钮文字写法
      Button() {
        Text('Next')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .onClick(() => {
        console.info('Click Pre button')
        // 路由跳转，需要设置路由表，路径为 entry > src > main > resources > base > profile
        router.pushUrl({
          url: 'pages/Second'
        }).then(() => {
          console.info('Succeeded  in jumping to the second Page.')
        }).catch((err: BusinessError) => {
          console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
        })
      })
      .type(ButtonType.Capsule)
      .margin({
        top: 100,
        left: 100
      })
      .backgroundColor('#0D9FFB')
      .alignRules({
        center: { anchor: '__container__', align: VerticalAlign.Center },
        middle: { anchor: '__container__', align: HorizontalAlign.Center }
      })
      .width('25%')
      .height('5%')
      // 第二种按钮文字写法，但是文字颜色为白色
      Button('Pre')
        .onClick(() => {
          console.info('Click Next button')
          router.pushUrl({
            url: 'pages/Third'
          }).then(() => {
            console.info('Succeeded  in jumping to the third Page.')
          }).catch((err: BusinessError) => {
            console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
          })
        })
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .type(ButtonType.Capsule)
        .margin({
          top: 100,
          left: -100
        })
        .backgroundColor('#0D9FFB')
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .width('25%')
        .height('5%')
    }
    .height('100%')
    .width('100%')
    .backgroundColor("#ccc")
  }
}