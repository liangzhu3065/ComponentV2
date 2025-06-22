import { HMDefaultGlobalAnimator, HMNavigation, HMRouterMgr } from '@hadss/hmrouter';
import { AttributeUpdater } from '@kit.ArkUI';
import { PageConstant } from '../constant/PageConstant';

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

  build() {
    Column() {
      HMNavigation({
        navigationId: "mainNavigation",
        homePageUrl: PageConstant.MainPage,
        options: {
          standardAnimator: HMDefaultGlobalAnimator.STANDARD_ANIMATOR,
          dialogAnimator: HMDefaultGlobalAnimator.DIALOG_ANIMATOR,
          modifier: this.modifier
        }
      })
    }
    .height('100%')
    .width('100%')
  }
}