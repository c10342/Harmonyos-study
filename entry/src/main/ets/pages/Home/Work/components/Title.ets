@Component
export default struct Title {
  @Prop name: string;
  @Prop rightText: string;
  @Prop rawfile: string;

  onRightClick: (() => any) | null = null;

  build() {
    Row() {
      Row() {
        Image($rawfile(this.rawfile))
          .width(26)
          .height(26)
        Text(this.name)
          .margin({ left: 5 })
          .fontSize(20)
          .fontWeight(500)
          .fontColor('#101010')
      }

      Row() {
        Text(this.rightText)
          .fontColor('#7f6666')
          .fontSize(16)
        Image($rawfile('common/arraw_right.png'))
          .width(20)
          .height(20)
      }
      .onClick(() => {
        this.onRightClick?.();
      })
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .height(60)
    .width('100%')
    .borderWidth({ bottom: 1 })
    .borderColor({ bottom: '#efefef' })
    .padding({ left: 10, right: 10 })
  }
}