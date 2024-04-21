import LeaveCard, { LeaveCardItem } from '../../../components/LeaveCard'
import { ListDataSource } from '../../../utils/ListDataSource';
import router from '@ohos.router';
import { RouteNameEnum } from '../../../utils/enums';

@Component
export default struct TabList {
  data: ListDataSource<LeaveCardItem> = new ListDataSource<LeaveCardItem>();

  aboutToAppear() {
    for (let index = 0; index < 10; index++) {
      this.data.pushData(new LeaveCardItem({
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
    List() {
      LazyForEach(this.data, (item: LeaveCardItem) => {
        ListItem() {
          LeaveCard({
            data: item
          }).onClick(() => {
            router.pushUrl({
              url: RouteNameEnum.LeaveDetail,
              params: {
                leaveId: item.id
              }
            })
          })
        }
      }, (item: LeaveCardItem) => item.id)
    }
    .width('100%')
    .height('100%')
  }
}