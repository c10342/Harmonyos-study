import { LeaveItem } from '../../../components/LeaveCard'
import Applications from './components/Applications'
import Header from './components/Header'
import Tips from './components/Tips'


@Preview
@Component
export default struct Work {
  @State leaveList: LeaveItem[] = [
    {
      status: 1,
      endTime: '2024-4-22',
      startTime: '2024-4-20',
      applyDay: 2,
      createTime: '2024-4-20 16:50',
      id: Math.random().toString(32).slice(-9)
    },
    {
      status: 2,
      endTime: '2024-4-22',
      startTime: '2024-4-20',
      applyDay: 2,
      createTime: '2024-4-20 16:50',
      id: Math.random().toString(32).slice(-9)
    },
    {
      status: 3,
      endTime: '2024-4-22',
      startTime: '2024-4-20',
      applyDay: 2,
      createTime: '2024-4-20 16:50',
      id: Math.random().toString(32).slice(-9)
    },
    {
      status: 4,
      endTime: '2024-4-22',
      startTime: '2024-4-20',
      applyDay: 2,
      createTime: '2024-4-20 16:50',
      id: Math.random().toString(32).slice(-9)
    }
  ]

  build() {
    Column() {
      Header()
      List() {
        // 提示信息
        ListItem() {
          Tips()
        }
        // 应用管理
        ListItem() {
          Applications()
        }
      }
      .layoutWeight(1)
      .width('100%')
      // item对齐方式
      .alignListItem(ListItemAlign.Center)
    }
    .width('100%').height('100%').backgroundColor('#f5f5f5')
  }
}