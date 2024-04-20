interface TipItem {
  label: string,
  value: number
}


@Component
export default struct Tips {
  @State tipList: Array<TipItem> = [
    { label: '待审批', value: 15 },
    { label: '会议提示', value: 2 },
    { label: '周报', value: 1 },
    { label: "工作汇报", value: 5 }
  ]

  build() {
    Row() {
      ForEach(this.tipList, (item: TipItem) => {
        Column() {
          Text(item.label)
            .fontSize(16)
            .fontColor('#8888cd')
          Text(`${item.value}`)
            .fontSize(26)
            .fontColor(Color.White)
            .fontWeight(800)
            .margin({ top: 15 })

        }
      })
    }
    .width('100%')
    .height(200)
    .backgroundColor('#4749a1')
    .justifyContent(FlexAlign.SpaceEvenly)
    .alignItems(VerticalAlign.Top)
    .padding({ top: 30 })
  }
}