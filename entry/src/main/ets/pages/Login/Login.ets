import promptAction from '@ohos.promptAction'
import CommonUI from '../../utils/CommonUI'
import Storage from '../../utils/Storage'
import router from '@ohos.router'
import { RouteNameEnum } from '../../utils/enums'

@Entry
@Component
struct Login {
  @State userName: string = '13456765456'
  @State password: string = '111111'

  @Styles inputWrapperStyle(){
    .borderWidth(1)
    .borderColor('#d5d5d5')
    .height(50)
    .borderRadius(0)
    .margin({ top: 30 })
  }

  @Styles inputStyle(){
    .height('100%')
    .layoutWeight(1)
    .borderRadius(0)
    .backgroundColor(Color.White)
  }

  build() {
    Column() {
      Image($rawfile('login/login1.png'))
        .objectFit(ImageFit.Fill)
        .width('100%')
        .height(300)
      Column() {
        // 输入账号
        Row() {
          Image($rawfile('login/phone.png'))
            .width(20)
            .height(30)
            .margin({ left: 10 })
          TextInput({
            placeholder: '请输入账号',
            text: this.userName
          })
            .inputStyle()
            .onChange((value) => this.userName = value)
        }
        .inputWrapperStyle()

        Row() {
          Image($rawfile('login/password.png'))
            .width(20)
            .height(30)
            .margin({ left: 10 })
          TextInput({
            placeholder: '请输入密码',
            text: this.password
          })
            .type(InputType.Password)
            .inputStyle()
            .onChange(value => this.password = value)
        }
        .inputWrapperStyle()

        Button('登录')
          .backgroundColor('#4749a1')
          .height(60)
          .width('100%')
          .margin({ top: 30 })
          .onClick(this.login.bind(this))
        Row() {
          Text('登录即代表同意').fontColor('#919191')
          Text('《同意协议》').fontColor('#333').fontWeight(FontWeight.Bold)
          Text('和').fontColor('#919191')
          Text('《隐私条款》').fontColor('#333').fontWeight(FontWeight.Bold)
        }
        .margin({ top: 40 })
      }
      .width('94%')
      .backgroundColor(Color.White)
      .borderRadius(5)
      .height(350)
      .margin({ top: -30 })
      .padding({ left: 10, right: 10 })

      Text('忘记密码')
        .fontColor('#4749a1')
        .margin({
          top: 100
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5')
  }

  async login() {
    const useNameReg = /^1[3-9]\d{9}$/
    const passwordReg = /^\d{6,16}$/
    if (!useNameReg.test(this.userName)) {
      CommonUI.showToast('手机号不合法')
      return
    }
    if (!passwordReg.test(this.password)) {
      CommonUI.showToast('密码要6-16位')
      return;
    }
    await Storage.setToken(`${this.userName}-${this.password}`);
    router.replaceUrl({ url: RouteNameEnum.Home })
  }
}