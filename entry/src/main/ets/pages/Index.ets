import CommonConstants from '../constants/CommonConstants'
@Entry
@Component
struct Index {
  @Provide('pageInfos') pageInfos: NavPathStack = new NavPathStack();

  @Builder
  NavigationTitle() {
    Column() {
      Text($r('app.string.encrypt_sample'))
        .fontSize($r('app.float.text_fontsize'))
        .lineHeight($r('app.float.text_lineHeight'))
        .fontWeight(CommonConstants.TEXT_FONT_WEIGHT)
    }
    .width(CommonConstants.FULL_PERCENT)
  }
  build() {
    Navigation(this.pageInfos){
      Column({ space: CommonConstants.COLUMN_SPACE }) {
        Button($r('app.string.encrypt_btn'), { stateEffect: true, type: ButtonType.Capsule})
          .onClick(() => {
            this.pageInfos.pushPathByName('EncryptionAndDecryption', null, false);
          })
          .width(CommonConstants.FULL_PERCENT)

        Button($r('app.string.signature_btn'), { stateEffect: true, type: ButtonType.Capsule})
          .onClick(() => {
            this.pageInfos.pushPathByName('SignatureVerification', null, false);
          })
          .width(CommonConstants.FULL_PERCENT)

        Button($r('app.string.message_btn'), { stateEffect: true, type: ButtonType.Capsule})
          .onClick(() => {
            this.pageInfos.pushPathByName('MessageSummary', null, false);
          })
          .width(CommonConstants.FULL_PERCENT)

        Button($r('app.string.code_btn'), { stateEffect: true, type: ButtonType.Capsule})
          .onClick(() => {
            this.pageInfos.pushPathByName('MessageAuthenticationCode', null, false);
          })
          .width(CommonConstants.FULL_PERCENT)
      }
      .justifyContent(FlexAlign.End)
      .width(CommonConstants.FULL_PERCENT)
      .height(CommonConstants.FULL_PERCENT)
      .padding($r('app.float.medium_padding'))
    }
    .title(this.NavigationTitle)
    .backgroundColor($r('app.color.background_page'))
    .mode(NavigationMode.Stack)
  }
}