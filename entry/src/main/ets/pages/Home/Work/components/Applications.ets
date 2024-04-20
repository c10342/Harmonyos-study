import Title from './Title'

interface ApplicationItem {
  image: ResourceStr,
  label: string
}

// 应用管理
@Component
export default struct Applications {
  @State applicationList: ApplicationItem[] = [
    { image: $rawfile('work/process.png'), label: "请假申请" },
    { image: $rawfile('work/clock.png'), label: "考勤打卡" },
    { image: $rawfile('work/report.png'), label: "汇报" },
    { image: $rawfile('work/approve.png'), label: "OA审批" },
    { image: $rawfile('work/card.png'), label: "补卡申请" },
    { image: $rawfile('work/salary.png'), label: "工资单" },
    { image: $rawfile('work/notice.png'), label: "公司公告" },
    { image: $rawfile('work/rule.png'), label: "规章制度" },
  ]

  build() {
    Column() {
      Title({
        name: '应用管理',
        rightText: '自定义',
        rawfile: 'work/menu.png'
      })

      Flex({ wrap: FlexWrap.Wrap, alignContent: FlexAlign.SpaceBetween }) {
        ForEach(this.applicationList, (item: ApplicationItem) => {
          Column() {
            Image(item.image)
              .width(50)
              .height(50)
            Text(item.label)
              .margin({ top: 10 })
          }
          .width('25%')
          .padding(10)
          .onClick(() => {
            console.log(item.label)
          })
        })
      }
    }
    .width('94%')
    .backgroundColor(Color.White)
    .borderRadius(10)
    // offset还会占据原来的位置
    // .offset({ y: -80 })
    .margin({ top: -80 })
  }
}