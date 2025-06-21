@Entry
@ComponentV2
struct SecondPage {
  @Local message: string = 'Hello World';
  pageStack: NavPathStack = new NavPathStack();

  aboutToAppear(): void {
    console.log("123")
  }

  build() {
    NavDestination() {
      RelativeContainer() {
        Text(this.message)
          .id('SecondPageHelloWorld')
          .fontSize($r('app.float.page_text_font_size'))
          .fontWeight(FontWeight.Bold)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .onClick(() => {
            this.message = 'Welcome';
          })
      }
      .height('100%')
      .width('100%')
    }
    .onReady((context: NavDestinationContext) => {
      this.pageStack = context.pathStack
    })
    .title("secondPage")
    .hideTitleBar(false)
  }
}

@Builder
export function subPageBuilder() {
  SecondPage()
}