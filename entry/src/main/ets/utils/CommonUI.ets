import promptAction from '@ohos.promptAction'

export default class CommonUI {
  static showToast(message: string) {
    promptAction.showToast({
      message: message,
      duration: 500
    })
  }
}