import ApplicationList from './components/ApplicationList'
import Header from './components/Header'
import LeaveList from './components/LeaveList'
import TipList from './components/TipList'


@Preview
@Component
export default struct Work {
  build() {
    Column() {
      Header()
      List() {
        // 提示信息
        ListItem() {
          TipList()
        }
        // 应用管理
        ListItem() {
          ApplicationList()
        }

        ListItem() {
          LeaveList()
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