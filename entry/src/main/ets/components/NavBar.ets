import router from '@ohos.router'

@Component
export default struct NavBar {
  @Prop title: string

  build() {
    Stack({ alignContent: Alignment.Start }) {
      Row() {
        Image($rawfile('common/back.png'))
          .width(20)
          .height(20)
      }
      .height('100%')
      .zIndex(10)
      .onClick(() => {
        router.back()
      })
      .width(30)
      .justifyContent(FlexAlign.Center)

      Row() {
        Text(this.title)
          .fontSize(22)
          .fontWeight(FontWeight.Bold)
      }.justifyContent(FlexAlign.Center)
      .width('100%')

    }
    .width('100%')
    .height(60)
    .padding({
      left: 10,
      right: 10
    })
    .backgroundColor(Color.White)
  }
}