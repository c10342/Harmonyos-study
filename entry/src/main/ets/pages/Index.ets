import router from '@ohos.router';
import { RouteNameEnum } from '../utils/enums';
import Log from '../utils/Log';
import Storage from '../utils/Storage';

@Entry
@Component
struct Index {
  @State time: number = 4;
  timer: number = -1;

  aboutToAppear() {
    // 倒计时进入登录页面
    this.timer = setInterval(() => {
      this.time--;
      if (this.time < 1) {
        // 跳转页面
        this.enter();
        clearInterval(this.timer);
      }
    }, 1000);
  }

  aboutToDisappear() {
    clearInterval(this.timer);
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Stack({ alignContent: Alignment.TopEnd }) {
        Text(this.time + '')
          .fontColor(Color.Gray)
          .fontSize(30)
          .backgroundColor(Color.White)
          .width(50)
          .height(50)
          .borderRadius(25)
          .textAlign(TextAlign.Center)
          .margin({
            top: 20,
            right: 20
          })
      }
      .width('100%')
      .position({ y: 0 })
      .zIndex(1)

      Image($rawfile('index/launch-screen.png'))
        .width('100%')
        .height('100%')
      Button()
        .width(200)
        .height(50)
        .margin({ bottom: 88 })
        .backgroundColor(Color.Transparent)
        .onClick(this.enter.bind(this))
    }
    .height('100%')
    .width('100%')
  }

  async enter() {
    const token = await Storage.getToken();
    if (token) {
      // 存在就获取用户信息
      router.replaceUrl({ url: RouteNameEnum.Home });
    } else {
      router.replaceUrl({ url: RouteNameEnum.Login });
    }
  }
}