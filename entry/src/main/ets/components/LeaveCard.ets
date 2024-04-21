import dayjs from 'dayjs'

// export interface LeaveCardItem {
//   // 状态
//   status: number
//   startTime: string
//   endTime: string
//   createTime: string
//   applyDay: number,
//   id: string
// }

@Observed
export class LeaveCardItem {
  // 状态
  status: number
  startTime: string
  endTime: string
  createTime: string
  applyDay: number
  id: string

  constructor(object: LeaveCardItem) {
    this.status = object.status ?? 1
    this.startTime = object.startTime ?? ''
    this.endTime = object.endTime ?? ''
    this.createTime = object.createTime?? ''
    this.applyDay = object.applyDay ?? 0
    this.id = object.id ?? ''
  }
}


// 根据申请状态返回申请结果文字
const getLabel = (status: number) => {
  switch (status) {
    case 1:
      return '待审批'
    case 2:
      return '正在审批中'
    case 3:
      return '审批通过'
    case 4:
      return '拒绝'
  }
}
// 根据申请状态返回对应的颜色值
const getColor = (status: number) => {
  switch (status) {
    case 1:
      return '#ff5f35'
    case 2:
      return '#53cbae'
    case 3:
      return '#53cbae'
    case 4:
      return '#ff5f35'
  }
}

@Component
export default struct LeaveCard {
  @ObjectLink data: LeaveCardItem;

  build() {
    Column() {
      Row() {
        Text()
          .backgroundColor('#4749a1')
          .width(20)
          .height(20)
          .borderRadius(10)
          .margin({ right: 10 })
        Text('请假申请')
          .fontSize(20)
          .fontWeight(600)
      }.width('100%')

      Column() {
        Row() {
          Text(`${dayjs(this.data.startTime).format('YYYY/MM/DD')} 至 ${dayjs(this.data.endTime).format('YYYY/MM/DD')}`)
            .margin({ right: 10 })
          Text('共2天')
        }
        .margin({ top: 10 })

        Row() {
          Text(`申请时间:${dayjs(this.data.startTime).format('YYYY-MM-DD HH:mm')}`)
          Text(getLabel(this.data.status))
            .fontColor(getColor(this.data.status))
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
        .margin({ top: 10 })
      }
      .width('100%')
      .padding({ left: 30 })
      .alignItems(HorizontalAlign.Start)
    }
    .width('100%')
    .padding({ top: 20, bottom: 20, left: 10, right: 10 })
    .borderWidth({ bottom: 1 })
    .borderColor({ bottom: '#efefef' })
    .backgroundColor(Color.White)
  }
}