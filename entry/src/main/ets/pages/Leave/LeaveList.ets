import NavBar from '../../components/NavBar'
import TabList from './components/TabList'

interface TabItem {
  label: string,
  value: number
}


@Entry
@Component
struct LeaveList {
  tabList: TabItem[] = [
    { label: "全部", value: 0 },
    { label: "人事管理", value: 1 },
    { label: "行政事务", value: 2 },
    { label: "财务类", value: 3 },
    { label: "业务相关", value: 4 },
  ]
  @State currentIndex: number = 0

  // 已经进行了初始化的下标索引
  // 懒加载
  @State initIndexList: number[] = [this.currentIndex]

  @Builder TabBuilder(item: TabItem, index: number) {
    Column() {
      Text(item?.label ?? '')
        .fontColor(this.currentIndex === index ? '#101010' : '#666666')
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? 500 : 400)
        .lineHeight(22)
        .margin({ top: 17, bottom: 7 })
      Divider()
        .strokeWidth(2)
        .color('#007DFF')
        .opacity(this.currentIndex === index ? 1 : 0)
        .width('50%')
    }.width('100%').backgroundColor(Color.White).height('100%')
  }

  build() {
    Column() {
      NavBar({ title: '我的申请' })
      Tabs({ barPosition: BarPosition.Start, index: this.currentIndex }) {
        ForEach(this.tabList, (item: TabItem, index: number) => {
          TabContent() {
            // 懒加载
            if (this.initIndexList.includes(index)) {
              TabList()
            }
          }.tabBar(this.TabBuilder(item, index)).padding(15)
        })
      }
      .onChange(index => {
        this.currentIndex = index
        // 懒加载
        const i = this.initIndexList.findIndex(i => i === index)
        if (i === -1) {
          this.initIndexList.push(index)
        }
      })
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5')
  }
}