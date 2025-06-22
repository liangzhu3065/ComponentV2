import { HMRouter } from "@hadss/hmrouter"
import { PageConstant } from "basebusiness"

@HMRouter({ pageUrl: PageConstant.BuilderPage })
@Entry
@ComponentV2
export struct BuilderPage {
  build() {
    Row() {
      Column() {
        Text('123455')
      }
      .width('100%')
    }
    .height('100%')
  }
}
