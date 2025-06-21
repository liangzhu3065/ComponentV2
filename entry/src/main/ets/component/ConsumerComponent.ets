/**
 * @author wlz
 * @since 2025−05-10
 * @description:
 */

@ComponentV2
export struct ConsumerComponent {
  @Consumer() providerStr: string = "world"

  build() {
    Column() {
      Button(this.providerStr)
        .onClick(() => {
          this.providerStr += '0';
        })
    }
  }
}