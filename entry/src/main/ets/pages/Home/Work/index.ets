import Applications from './components/Applications'
import Header from './components/Header'
import Leaves from './components/Leaves'
import Tips from './components/Tips'


@Preview
@Component
export default struct Work {


  build() {
    Column() {
      Header()
      List() {
        // 提示信息
        ListItem() {
          Tips()
        }
        // 应用管理
        ListItem() {
          Applications()
        }
        ListItem(){
          Leaves()
        }
      }
      .layoutWeight(1)
      .width('100%')
      // item对齐方式
      .alignListItem(ListItemAlign.Center)
    }
    .width('100%').height('100%').backgroundColor('#f5f5f5')
  }
}