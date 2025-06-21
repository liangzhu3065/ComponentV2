@Entry
@ComponentV2
struct StackPage {
  @Local message: string = 'Hello World';
  private arr: string[] = ['APP1', 'APP2', 'APP3', 'APP4', 'APP5', 'APP6', 'APP7', 'APP8'];

  build() {
    NavDestination() {
      Stack({ alignContent: Alignment.Bottom }) {
        Flex({ wrap: FlexWrap.Wrap, direction: FlexDirection.Row }) {
          ForEach(this.arr, (item: string) => {
            Text(item)
              .width(100)
              .height(100)
              .fontSize(16)
              .margin(10)
              .textAlign(TextAlign.Center)
              .borderRadius(10)
              .backgroundColor(0xFFFFFF)
          }, (item: string): string => item)
        }
        .width("100%")
        .height("100%")
        .backgroundColor('#CFD0CF')

        Flex({ justifyContent: FlexAlign.SpaceAround, alignItems: ItemAlign.Center }) {
          Text('联系人').fontSize(16)
          Text('设置').fontSize(16)
          Text('短信').fontSize(16)
        }
        .width('50%')
        .height(50)
        .backgroundColor('#16302e2e')
        .margin({ bottom: 15 })
        .borderRadius(15)
      }
    }
  }
}

@Builder
export function subPageBuilder() {
  StackPage()
}