@Entry
@ComponentV2
struct RowPage {
  private scrollView: Scroller = new Scroller()
  private arr: number[] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

  build() {
    NavDestination() {
      Column({ space: 10 }) {
        Row({ space: 10 }) {
          Text("111")
            .height(15)
            .backgroundColor(Color.Blue)
          Text("222")
            .height(20)
            .backgroundColor(Color.Orange)
          Text("333")
            .height(25)
            .backgroundColor(Color.Red)
        }
        .width('100%')
        .backgroundColor(Color.Gray)
        // 主轴的对齐方式(居中)
        .justifyContent(FlexAlign.End)
        // 交叉轴的对齐方式
        .alignItems(VerticalAlign.Bottom)

        Row({ space: 10 }) {
          Text("111")
            .height(15)
            .backgroundColor(Color.Blue)
          Text("222")
            .height(20)
            .backgroundColor(Color.Orange)
          Text("333")
            .height(25)
            .backgroundColor(Color.Red)
        }
        .width('100%')
        .backgroundColor(Color.Gray)
        .justifyContent(FlexAlign.SpaceBetween)

        Row({ space: 10 }) {
          Text("111")
            .height(15)
            .backgroundColor(Color.Blue)
          Text("222")
            .height(20)
            .backgroundColor(Color.Orange)
          Text("333")
            .height(25)
            .backgroundColor(Color.Red)
        }
        .width('100%')
        .backgroundColor(Color.Gray)
        .justifyContent(FlexAlign.SpaceAround)

        // 自适应拉伸
        Text("============自适应拉伸==============")
        Row() {
          Text("Bluetooth").fontSize(18)
          Blank()
          Toggle({ type: ToggleType.Switch, isOn: true })
        }
        .padding({ left: 20, right: 20 })
        .width('100%')

        Text("=======自适应缩放:layoutWeight=======")
          .margin({ top: 15 })

        Row() {
          Column() {
            Text("layout(1)")
          }
          .layoutWeight(1)
          .backgroundColor(Color.Blue)

          Column() {
            Text("layout(2)")
          }
          .layoutWeight(2)
          .backgroundColor(Color.Orange)

          Column() {
            Text("layout(3)")
          }
          .layoutWeight(3)
          .backgroundColor(Color.Red)
        }

        Text("=======自适应缩放:百分比=======")
          .margin({ top: 15 })

        Text("=======自适应延伸:scroll=======")
          .margin({ top: 15 })

        Column() {
          Scroll(this.scrollView) {
            Column() {
              ForEach(this.arr, (item: number, index: number) => {
                if (item) {
                  Text(item.toString())
                    .width('90%')
                    .height(150)
                    .backgroundColor(0xFFFFFF)
                    .borderRadius(15)
                    .fontSize(16)
                    .textAlign(TextAlign.Center)
                    .margin({ top: 10 })
                }
              }, (item: number) => item.toString())
            }
          }
          .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
          .scrollBar(BarState.On) // 滚动条常驻显示
          .scrollBarColor(Color.Gray) // 滚动条颜色
          .scrollBarWidth(10) // 滚动条宽度
          .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
        }
        .height(100)
        .backgroundColor(0xDCDCDC)
        .width('100%')

      }

    }.title("row and colum")
  }
}

@Builder
export function subPageBuilder() {
  RowPage()
}