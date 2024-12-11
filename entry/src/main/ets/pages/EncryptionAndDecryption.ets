import { CryptoViewModel } from '../viewmodel/CryptoViewModel';
import { CryptoItem } from '../viewmodel/CryptoItem';
import CommonConstants from '../constants/CommonConstants';
import { getResourceString } from '../utils/ResourceString';

@Builder
export function EncryptionAndDecryptionBuilder() {
  EncryptionAndDecryption()
}

@Entry
@Component
struct EncryptionAndDecryption {
  @Consume('pageInfos') pageInfos: NavPathStack;

  build() {
    RelativeContainer() {
      NavDestination() {
        Column() {
          Text($r('app.string.total_count', CryptoViewModel.getCryptoList().length))
            .fontSize($r('app.float.count_size'))
            .fontWeight(CommonConstants.FONT_WEIGHT_500)
            .fontFamily(CommonConstants.FONT_FAMILY_BLACK)
            .fontColor($r('sys.color.mask_secondary'))
            .margin({
              bottom: $r('app.float.count_margin_bottom')
            })
          // List 布局
          List() {
            // ForEach 循环
            ForEach(CryptoViewModel.getCryptoList(), (item: CryptoItem) => {
              // ListItem 每一项里的内容
              ListItem() {
                // 栅格布局
                Row() {
                  Text(item.name)
                    .fontSize($r('app.float.common_font'))
                    .fontWeight(CommonConstants.FONT_WEIGHT_500)
                    .fontFamily(CommonConstants.FONT_FAMILY_BLACK)
                  Image($r('app.media.ic_public_arrow_right'))
                    .width($r('app.float.arrow_width'))
                    .height($r('app.float.common_image'))
                }
                .width(CommonConstants.FULL_PERCENT)
                .justifyContent(FlexAlign.SpaceBetween)
              }
              .height($r('app.float.list_item_height'))
              .onClick(() => {
                this.pageInfos.pushPathByName('CryptoDetail', item)
              })
            //   渲染唯一性
            }, (item: CryptoItem, index: number) => index + JSON.stringify(item))
          }
          .backgroundColor(Color.White)
          .borderRadius($r('sys.float.corner_radius_level8'))
          .divider({
            strokeWidth: $r('app.float.stroke_width'),
            color: $r('app.color.five_black')
          })
          .padding({
            left: $r('app.float.small_padding'),
            right: $r('app.float.small_padding')
          })
        }
        .alignItems(HorizontalAlign.Start)
        .padding({
          top: $r('app.float.list_padding'),
          left: $r('app.float.medium_padding'),
          right: $r('app.float.medium_padding')
        })
      }
      .title(getResourceString($r('app.string.encrypt_btn'), this))
      .backgroundColor($r('app.color.background_page'))
    }
  }
}