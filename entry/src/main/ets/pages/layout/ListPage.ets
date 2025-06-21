import { util } from "@kit.ArkTS";
import { hilog } from "@kit.PerformanceAnalysisKit";

/**
 *联系人
 */
class Contact {
  key: string = util.generateRandomUUID(true);
  name: string;
  icon: Resource;

  constructor(name: string, icon: Resource) {
    this.name = name;
    this.icon = icon;
  }
}

/**
 * 联系人分组
 */
class ContactsGroup {
  title: string = '';
  contacts: Array<object> | null = null;
  key: string = "";
}

/**
 * List高度：
 * 当List没有设置高度，若子元素内容高度没有超过父容器的高度，就是子元素的高度，如果超过了父元素的高度，就是父元素高度
 */
@Entry
@ComponentV2
struct ListPage {
  private listScroller: Scroller = new Scroller();
  private contactsGroups: Array<object> = [
    {
      title: 'A',
      contacts: [
        new Contact('艾佳', $r('app.media.app_icon')),
        new Contact('安安', $r('app.media.app_icon')),
        new Contact('Angela', $r('app.media.app_icon')),
        new Contact('白叶', $r('app.media.app_icon')),
        new Contact('伯明', $r('app.media.app_icon')),
      ],
      key: util.generateRandomUUID(true)
    } as ContactsGroup,
    {
      title: 'B',
      contacts: [
        new Contact('艾佳', $r('app.media.app_icon')),
        new Contact('安安', $r('app.media.app_icon')),
        new Contact('Angela', $r('app.media.app_icon')),
        new Contact('白叶', $r('app.media.app_icon')),
        new Contact('伯明', $r('app.media.app_icon')),
      ],
      key: util.generateRandomUUID(true)
    } as ContactsGroup,
    {
      title: 'C',
      contacts: [
        new Contact('艾佳', $r('app.media.app_icon')),
        new Contact('安安', $r('app.media.app_icon')),
        new Contact('Angela', $r('app.media.app_icon')),
        new Contact('白叶', $r('app.media.app_icon')),
        new Contact('伯明', $r('app.media.app_icon')),
      ],
      key: util.generateRandomUUID(true)
    } as ContactsGroup
  ]

  aboutToAppear(): void {
    hilog.info(0x0000, 'testTag', 'calc(50%+50vp)');

  }

  build() {
    NavDestination() {
      Stack({ alignContent: Alignment.Bottom }) {
        Row() {
          Button("顶部")
            .width(60)
            .borderRadius(30)
            .onClick(() => {
              this.listScroller.scrollToIndex(0)
            })
        }
        .zIndex(10)
        .justifyContent(FlexAlign.End)
        .hitTestBehavior(HitTestMode.Transparent)
        .width('100%')

        List({ scroller: this.listScroller }) {
          ForEach(this.contactsGroups, (itemGroup: ContactsGroup) => {
            ListItemGroup({ header: this.itemGroupHead(itemGroup.title) }) {
              if (itemGroup.contacts) {
                ForEach(itemGroup.contacts, (item: Contact) => {
                  ListItem() {
                    Row() {
                      this.listItemView(item)
                    }
                    .width('100%')
                    .justifyContent(FlexAlign.Start)
                  }
                }, (item: Contact) => JSON.stringify(item))
              }
            }
          })
        }
        .width('100%')
        // 分隔符
        .divider({
          strokeWidth: 1,
          startMargin: 60,
          endMargin: 15,
          color: "#ffe9f0f0"
        })
        .scrollBar(BarState.Auto)
        .sticky(StickyStyle.Header)
        .zIndex(9)
      }

    }
    .title("List")
  }

  @Builder
  itemGroupHead(text: string) {
    // 列表分组的头部组件，对应联系人分组A、B等位置的组件
    Text(text)
      .fontSize(20)
      .backgroundColor('#fff1f3f5')
      .width('100%')
      .padding(5)
  }

  @Builder
  listItemView(item: Contact) {
    Row() {
      // 添加标记(角标)
      Badge({ count: 1, position: BadgePosition.RightTop, style: { badgeSize: 16, badgeColor: '#FA2A2D' } }) {
        Image(item.icon)
          .width(40)
          .height(40)
          .margin(10)
        Text(item.name).fontSize(20)
      }
    }
    .width('100%')
    .justifyContent(FlexAlign.Start)
  }
}


@Builder
export function subPageBuilder() {
  ListPage()
}