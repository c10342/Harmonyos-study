import LeaveCard, { LeaveCardItem } from '../../../../components/LeaveCard'
import Title from './Title'
import router from '@ohos.router'
import { RouteNameEnum } from '../../../../utils/enums'
import Log from '../../../../utils/Log'

@Component
export default struct LeaveList {
  @State leaveList: LeaveCardItem[] = [
    new LeaveCardItem({
      status: 1,
      endTime: '2024-4-22 16:50:30',
      startTime: '2024-4-20 16:50:30',
      applyDay: 2,
      createTime: '2024-4-20 16:50:30',
      id: Math.random().toString(32).slice(-9)
    }),
    new LeaveCardItem({
      status: 2,
      endTime: '2024-4-22 16:50:30',
      startTime: '2024-4-20 16:50:30',
      applyDay: 2,
      createTime: '2024-4-20 16:50:30',
      id: Math.random().toString(32).slice(-9)
    }),
    new LeaveCardItem({
      status: 3,
      endTime: '2024-4-22 16:50:30',
      startTime: '2024-4-20 16:50:30',
      applyDay: 2,
      createTime: '2024-4-20 16:50:30',
      id: Math.random().toString(32).slice(-9)
    }),
    new LeaveCardItem({
      status: 4,
      endTime: '2024-4-22 16:50:30',
      startTime: '2024-4-20 16:50:30',
      applyDay: 2,
      createTime: '2024-4-20 16:50:30',
      id: Math.random().toString(32).slice(-9)
    }),
  ]

  build() {
    Column() {
      Title({
        name: '我的申请',
        rightText: '更多',
        rawfile: 'work/badge.png',
        onRightClick: () => {
          router.pushUrl({
            url: RouteNameEnum.LeaveList
          })
        }
      })
      ForEach(this.leaveList, (item: LeaveCardItem) => {
        LeaveCard({
          data: item
        })
      }, (item: LeaveCardItem) => item.id)
    }
    .width('94%')
    .backgroundColor(Color.White)
    .borderRadius(10)
    .margin({ top: 20 })
  }
}