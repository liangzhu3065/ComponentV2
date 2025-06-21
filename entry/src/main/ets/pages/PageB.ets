import { HMRouter, HMRouterMgr } from '@hadss/hmrouter';

@HMRouter({ pageUrl: 'PageB' })
@Entry
@Component
export struct PageB {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text(this.message)
        .id('PageBHelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          HMRouterMgr.pop()
        })
    }
    .height('100%')
    .width('100%')
  }
}