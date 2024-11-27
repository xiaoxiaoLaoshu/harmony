import { BusinessError } from '@kit.BasicServicesKit';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct Second {
  @State message: string = 'Hello Second World';

  build() {
    // 栅格布局
    Row(){
      Row() {
        Column() {
          Text(this.message)
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
        }.width('50%')
      }
      Row(){
        Column(){
          Button('Back')
            .onClick(() => {
              try {
                router.back();
                console.info('Succeeded in returning to the first page.');
              }
              catch (err) {
                let code = (err as BusinessError).code;
                let message = (err as BusinessError).message;
                console.error(`Failed to return to the first page. Code is ${code}, message is ${message}`);
              }
            })
        }
        .width("50%")
      }
    }
    .height('100%')
  }
}