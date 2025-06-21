import { HMDefaultGlobalAnimator, HMNavigation, HMRouterMgr } from '@hadss/hmrouter';
import { AttributeUpdater } from '@kit.ArkUI';
import { HomePage } from 'home';

class NavModifier extends AttributeUpdater<NavigationAttribute> {
  initializeModifier(instance: NavigationAttribute): void {
    instance.mode(NavigationMode.Stack);
    instance.navBarWidth('100%');
    instance.hideTitleBar(true)
    instance.hideToolBar(true)
  }
}

@Entry
@ComponentV2
struct Index2 {
  modifier: NavModifier = new NavModifier()
  @Local currentIndex: number = 0

  build() {
    Column() {
      HMNavigation({
        navigationId: "mainNavigation",
        options: {
          standardAnimator: HMDefaultGlobalAnimator.STANDARD_ANIMATOR,
          dialogAnimator: HMDefaultGlobalAnimator.DIALOG_ANIMATOR,
          modifier: this.modifier
        }
      }) {
        Tabs({ barPosition: BarPosition.End }) {
          TabContent() {
            HomePage()
          }
          .tabBar(this.tabItemBuilder('首页', 0, $r("app.media.tab_home"), $r("app.media.tab_home_selected")))

          TabContent() {
            Text("商城")
          }
          .tabBar(this.tabItemBuilder('商城', 1, $r("app.media.tab_classification"),
            $r("app.media.tab_classification_selected")))

          TabContent() {
            Text("购物")
          }
          .tabBar(this.tabItemBuilder('购物', 2, $r("app.media.tab_discovery"),
            $r("app.media.tab_discovery_selected")))

          TabContent() {
            Text("购物车")
          }
          .tabBar(this.tabItemBuilder('购物车', 3, $r("app.media.tab_shopping_bag"),
            $r("app.media.tab_shopping_bag_selected")))

          TabContent() {
            Text("我的")
          }
          .tabBar(this.tabItemBuilder('我的', 4, $r("app.media.tab_mine"), $r("app.media.tab_mine_selected")))
        }
        .onChange((index: number) => {
          this.currentIndex = index
        })
        .barMode(BarMode.Fixed)
        .scrollable(false)
        .animationMode(AnimationMode.NO_ANIMATION)

      }
    }
    .height('100%')
    .width('100%')
  }

  @Builder
  tabItemBuilder(title: string, targetIndex: number, normalImg: Resource, selectedImg: Resource) {
    Column() {
      Image(this.currentIndex == targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
        .padding(3)
      Text(title)
        .fontColor(this.currentIndex === targetIndex ? '#232323' : '#8e8e8e')
        .fontSize(10)
        .margin({ top: 5 })
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }
}