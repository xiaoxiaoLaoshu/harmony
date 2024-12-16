import { common } from '@kit.AbilityKit'
import { Logger, Configure, LogLevel } from '@ohos/log';

let logger: Logger = new Logger(getContext(this) as common.UIAbilityContext);
let level: LogLevel = LogLevel.DEBUG;
let configure: Configure = new Configure(['file'], 'log.txt', 'Index', level);
@Entry
@Component
struct Index {
  aboutToAppear(): void {
    logger.setConfigture(configure);
  }

  build() {
    Column() {
      Row() {
        Text($r('app.string.EntryAbility_label'))
          .fontSize(18)
          .fontColor(Color.White)
          .textAlign(TextAlign.Center)
      }
      .height('6%')
      .width('100%')
      .padding({ left: 15})
      .backgroundColor('#0D9FFB')
      .constraintSize({minHeight: 50})
      Flex({direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center}){
        Button($r('app.string.log'))
          .id('log')
          .fontSize(30)
          .width('55%')
          .height('8%')
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            for(let i = 0;i <= 4;i++) {
              if (i < 2) {
                logger.debug(`this is a debug message.The Message number is ${i}`);
              } else {
                logger.warn(`this is a warn message.The Message number is ${i}`);
              }
              for(let j = 0;j <= 4;j++){
                if (j < 2) {
                  logger.info(`this is a info message.The Message number is ${j}`)
                  console.log('info1111111111111', j);
                } else {
                  logger.fatal(`this is a fatal message.The Message number is ${j}`);
                }
                logger.error(`this is a error message.i type of ${typeof (i)} j type of ${typeof (j)}`)
              }
            }
          })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F1F1F1')
  }
}