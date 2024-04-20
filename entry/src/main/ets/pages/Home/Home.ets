import Work from './Work'
import My from './My'
import Message from './Message'
import AddressBook from './AddressBook'

interface TabItem {
  text: ResourceStr,
  icon: ResourceStr,
  activeIcon: ResourceStr
}

const tabs: TabItem[] = [
  {
    text: $r('app.string.work'),
    icon: $rawfile('tabBarItemImages/book.png'),
    activeIcon: $rawfile('tabBarItemImages/book_active.png'),
  },
  {
    text: $r("app.string.message"),
    icon: $rawfile("tabBarItemImages/message.png"),
    activeIcon: $rawfile("tabBarItemImages/message_active.png"),
  },
  {
    text: $r("app.string.address_book"),
    icon: $rawfile("tabBarItemImages/address_book.png"),
    activeIcon: $rawfile("tabBarItemImages/address_book_active.png"),
  },
  {
    text: $r("app.string.my"),
    icon: $rawfile("tabBarItemImages/my.png"),
    activeIcon: $rawfile("tabBarItemImages/my_active.png"),
  }
]

@Entry
@Component
struct Home {
  @State currentIndex: number = 0;

  @Builder tabItemBuilder(item: TabItem, index: number) {
    Column() {
      Image(this.currentIndex === index ? item.activeIcon : item.icon)
        .width(24)
        .height(24)
        .margin({ bottom: 4 })
        .objectFit(ImageFit.Contain)
      Text(item.text)
        .fontColor(this.currentIndex === index ? '#4749a1' : '#9a9a9a')
        .fontSize(10)
        .fontWeight(500)
        .lineHeight(14)
    }.width('100%')
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        // 遍历数据
        ForEach(tabs, (item: TabItem, index: number) => {
          TabContent() {
            if (0 === index) {
              Work()
            } else if (1 === index) {
              Message()
            } else if (2 === index) {
              AddressBook()
            } else if (3 === index) {
              My()
            }
          }.tabBar(this.tabItemBuilder(item, index))
        })
      }
      .onChange(index => this.currentIndex = index)
    }
    .height('100%')
  }
}