import { HMRouterMgr } from "@hadss/hmrouter";
import { PageConstant } from "basebusiness";

@ComponentV2
export struct HomePage {
  @Local message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        List() {
          ListItem() {
            Button("自定义组件")
              .onClick(() => {
                HMRouterMgr.push({ pageUrl: PageConstant.BuilderPage })
              })
          }
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}
