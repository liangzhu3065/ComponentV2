import { HMRouter } from "@hadss/hmrouter"
import { PageConstant } from "basebusiness"

/*
@Component:实现复杂UI，内部可以定义状态变量，还可以管理组件的生命周期
@Builder: 为了实现UI复用
*
*
* 私有构建函数:建议通过this访问组件的状态变量
* 全局构建函数: 如果不涉及组件状态变化，建议使用全局的自定义构建函数
*
* 参数传递：
* 1、默认是按照值传递方式
* 2、引用传递
* 1）只有一个参数
* 2）按照对象字面量的形式传递

 */

class TempParams {
  paramA1: string = '';
}


@HMRouter({ pageUrl: PageConstant.BuilderPage })
@Entry
@ComponentV2
export struct BuilderPage {
  @Local text: string = 'Hello World'

  aboutToAppear(): void {
  }

  aboutToDisappear(): void {
  }

  onDidBuild(): void {
    // build()函数执行完成之后回调该接口
    /*
     埋点数据上报等不影响实际UI的功能
     */
  }

  build() {
    Column() {

      // 私有构建函数，值传递（值改变不会引起内部UI刷新）
      this.showTextBuilder(this.text)

      // 私有构建函数,直接引用状态变量
      this.showTextBuilder2()
      // 全局构建函数，引用传递（只有一个参数，且按照对象字面量的方式传参）
      showTextBuilderGlobal({ paramA1: this.text })

      // @Builder装饰的函数当作customBuilder类型使用
      List() {
        ListItem() {
          Text('左滑、右滑')
            .align(Alignment.Center)
            .fontSize(30)
        }
        .swipeAction({
          start: {
            builder: showTextBuilderGlobal({ paramA1: this.text })
          },
          end: { builder: this.showTextBuilder2() }
        })
        .height(30)
        .width('100%')
      }

      Button("Click")
        .onClick(() => {
          this.text = "Hello, harmonyOS"
        })
    }
  }

  // 私有构建函数
  @Builder
  showTextBuilder(text: string) {
    Text(text)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
  }

  // 私有构建函数
  @Builder
  showTextBuilder2() {
    Text(this.text)
      .fontSize(30)
      .fontWeight(FontWeight.Bold)
  }
}

@Builder
function showTextBuilderGlobal(param: TempParams) {
  Text(param.paramA1)
    .fontSize(30)
    .fontWeight(FontWeight.Bold)
}