@Component
export default struct Header {
  build() {
    Row() {
      Text('我的办公')
        .fontSize(30)
        .fontColor(Color.White)
        .fontWeight(500)
      Row() {
        Column() {
          Text("8℃")
            .fontColor(Color.White)
            .fontWeight(800)
          Text("12月8日")
            .fontColor(Color.White)
            .margin({ top: 5 })
        }

        Image($rawfile('work/weather.png'))
          .width(50)
          .height(50)
      }
    }
    .width('100%')
    .height(100)
    .backgroundColor('#4749a1')
    .borderColor({ bottom: '#6a6cb2' })
    .borderWidth({ bottom: 1 })
    .justifyContent(FlexAlign.SpaceBetween)
    .padding({ left: 20, right: 20, bottom: 10 })
    .alignItems(VerticalAlign.Bottom)
  }
}