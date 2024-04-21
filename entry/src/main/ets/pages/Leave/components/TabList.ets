import LeaveCard, { LeaveCardItem } from '../../../components/LeaveCard'

@Component
export default struct TabList {
  @State list: LeaveCardItem[] = []

  aboutToAppear() {
    console.log('aboutToAppear')
    for (let index = 0; index < 10; index++) {
      this.list.push(new LeaveCardItem({
        status: index % 4 + 1,
        endTime: '2024-4-22 16:50:30',
        startTime: '2024-4-20 16:50:30',
        applyDay: 2,
        createTime: '2024-4-20 16:50:30',
        id: Math.random().toString(32).slice(-9)
      }))

    }
  }

  build() {
    Column() {
      // ForEach(this.list, (item: LeaveCardItem) => {
      //   LeaveCard({
      //     data: item
      //   })
      // }, (item: LeaveCardItem) => item.id)
      // LazyForEach()
    }
    .width('100%')
    .height('100%')
  }
}