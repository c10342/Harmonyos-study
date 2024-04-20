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
      Row() {
        Row() {
          Image($rawfile('work/menu.png'))
            .width(26)
            .height(26)
          Text('应用管理')
            .margin({ left: 5 })
            .fontSize(20)
            .fontWeight(500)
            .fontColor('#101010')
        }

        Row() {
          Text('自定义')
            .fontColor('#7f6666')
            .fontSize(16)
          Image($rawfile('common/arraw_right.png'))
            .width(20)
            .height(20)
        }
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .height(60)
      .width('100%')
      .borderWidth({ bottom: 1 })
      .borderColor({ bottom: '#efefef' })
      .padding({ left: 10, right: 10 })

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
        })
      }
    }
    .width('94%')
    .offset({ y: -80 })
    .backgroundColor(Color.White)
    .borderRadius(10)
  }
}