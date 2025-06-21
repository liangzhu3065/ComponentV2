@Entry
@ComponentV2
struct Index {
  pageStack: NavPathStack = new NavPathStack();

  build() {
    Navigation(this.pageStack) {
      Column({ space: 10 }) {
        Button("ComponentV2")
          .onClick(() => {
            this.pageStack.pushPathByName("ComponentV2Page", null)
          })


        Button("NavPath")
          .onClick(() => {
            this.pageStack.pushPathByName("SecondPage", null)
          })

        Button("row ")
          .onClick(() => {
            this.pageStack.pushPathByName("RowPage", null)
          })

        Button("Flex ")
          .onClick(() => {
            this.pageStack.pushPathByName("FlexPage", null)
          })

        Button("Stack ")
          .onClick(() => {
            this.pageStack.pushPathByName("StackPage", null)
          })

        Button("Relative ")
          .onClick(() => {
            this.pageStack.pushPathByName("RelativePage", null)
          })

        Button("List ")
          .onClick(() => {
            this.pageStack.pushPathByName("ListPage", null)
          })
      }
      .height('100%')
      .width('100%')
    }
    .title('Index')
    .titleMode(NavigationTitleMode.Mini)
    .hideTitleBar(true)
  }
}