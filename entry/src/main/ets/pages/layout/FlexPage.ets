/**
 * Flex与row、colum的区别
 *
 * 1、flex除了具备row和colum的布局功能外，还可以动态的调整子元素的大小和位置，以适应不同的屏幕尺寸和设备
 *
 * 属性
 * 1、flexBasis：设置子元素的基准尺寸。优先级高于width、height
 * 2、flexGrow：父容器的剩余空间分配给此属性所在组件的比例，未设置不参与瓜分
 * 3、flexShrink: 当父容器空间不足时，子元素的压缩比例。
 */
@Entry
@ComponentV2
struct FlexPage {
  build() {
    NavDestination() {
      Flex({ direction: FlexDirection.Row }) {
        Text("flex")
          .width("100")
          .flexBasis("200")
          .backgroundColor(Color.Red)
      }

      Flex() {
        Text('flexGrow(2)')
          .flexGrow(2)
          .width(100)
          .height(100)
          .backgroundColor(0xF5DEB3)
        Text('flexGrow(3)')
          .flexGrow(3)
          .width(100)
          .height(100)
          .backgroundColor(0xD2B48C)

        Text('no flexGrow')
          .width(100)
          .height(100)
          .backgroundColor(0xF5DEB3)
      }.width("100%").height(120).padding(10).backgroundColor(0xAFEEEE)

    }
    .title("flex")
  }
}

@Builder
export function subPageBuilder() {
  FlexPage()
}