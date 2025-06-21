@Entry
@Component
struct RelativePage {
  @State message: string = 'Hello World';

  build() {
    NavDestination() {
      RelativeContainer() {
        Text(this.message)
          .id('RelativePageHelloWorld')
          .fontSize($r('app.float.page_text_font_size'))
          .fontWeight(FontWeight.Bold)
          .alignRules({
            top: { anchor: '__container__', align: VerticalAlign.Top },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .onClick(() => {
            this.message = 'Welcome';
          })
      }
      .height('100%')
      .width('100%')
    }
  }
}

@Builder
export function subPageBuilder() {
  RelativePage()
}