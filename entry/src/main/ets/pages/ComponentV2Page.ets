import { Child } from '../component/child';
import { ConsumerComponent } from '../component/ConsumerComponent';

@ObservedV2
class Son {
  @Trace age: number = 100
}

class Father {
  son: Son = new Son()
}


@Entry
@ComponentV2
struct ComponentV2Page {
  father: Father = new Father()
  // 必须在组件内部进行初始化,不能在组件外初始化
  @Local count: number = 0;
  @Local message: string = "Hello";
  @Local flag: boolean = false;
  // 可以添加别名
  @Provider() providerStr: string = "hello"

  @Monitor("count", "message")
  onValueChanged(monitor: IMonitor) {
    monitor.dirty.forEach((path: string) => {
      this.monitorValue = `${path} changed from ${monitor.value(path)?.before} to ${monitor.value(path)?.now}`
    })
  }

  @Local monitorValue: string = ""
  pageStack: NavPathStack = new NavPathStack();

  build() {
    NavDestination() {
      Column() {
        Divider()
        Text(`${this.father.son.age}`)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.father.son.age++
          })

        Text("========= Local ============")
          .margin({ top: 10, bottom: 10 })

        Text(`${this.count}`)
        Text(`${this.message}`)
        Text(`${this.flag}`)
        Button("change Local")
          .onClick(() => {
            this.count++;
            this.message += " World";
            this.flag = !this.flag;
          })

        Text("========= param ============")
          .margin({ top: 10, bottom: 10 })

        Child({
          count: this.count,
          message: this.message,
          flag: this.flag,
          changeValue: (x: number) => {
            this.count++
          }
        })

        Text("========= Provider ============")
          .margin({ top: 10, bottom: 10 })
        Button(this.providerStr)
          .onClick(() => {
            this.providerStr += '0';
          })
        ConsumerComponent()

        Text("========= Monitor ============")
          .margin({ top: 10, bottom: 10 })
        Button("Monitor")
          .onClick(() => {
            this.count++
          })
        Text(this.monitorValue)

        Text("========= NavStack ============")
          .margin({ top: 10, bottom: 10 })
        Button("push")
          .onClick(() => {
            this.pageStack.pushPathByName("SecondPage", null)
          })

      }
      .height('100%')
      .width('100%')
    }
    .onReady((context: NavDestinationContext) => {
      this.pageStack = context.pathStack
    })
  }
}

@Builder
export function subPageBuilder() {
  ComponentV2Page()
}