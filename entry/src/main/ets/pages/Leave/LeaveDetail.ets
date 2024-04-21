import { getColor, getLabel } from '../../components/LeaveCard'
import NavBar from '../../components/NavBar'
import router from '@ohos.router'

@Entry
@Component
struct LeaveDetail {
  @State leaveId: string = ''

  aboutToAppear() {
    this.leaveId = (router.getParams() as any).leaveId
  }

  @Builder TitleBuilder() {
    Row() {
      Row() {
        Text()
          .width(20)
          .height(20)
          .borderRadius(10)
          .backgroundColor('#4749a1')
        Text('张三请假申请')
          .fontSize(18)
          .fontColor('#101010')
          .fontWeight(FontWeight.Bold)
          .margin({ left: 10 })
      }

      Text(getLabel(1))
        .fontColor(getColor(1))
    }
    .height(80)
    .justifyContent(FlexAlign.SpaceBetween)
    .backgroundColor(Color.White)
    .width('100%')
    .borderRadius(8)
    .padding({ left: 15, right: 15 })
  }

  @Builder ContentItemBuilder(label: string, info: string) {
    Row() {
      Text(`${label}:`).margin({ right: 10 })
      Text(info)
    }.width('100%').height(40)
  }

  @Builder ContentBuilder() {
    Column() {
      this.ContentItemBuilder('审批编号', this.leaveId)
      this.ContentItemBuilder('所在部门', '技术部')
      this.ContentItemBuilder('请假类型', '请假申请')
      this.ContentItemBuilder('开始时间', '2024-4-21 16:20')
      this.ContentItemBuilder('结束事件', '2024-4-21 16:20')
      this.ContentItemBuilder('请假天数', '3')
      this.ContentItemBuilder('请假事由', '家中有事')
    }
    .backgroundColor(Color.White)
    .width('100%')
    .borderRadius(8)
    .padding({ left: 15, right: 15 })
  }

  build() {
    Column() {
      NavBar({ title: '请假申请详情' })
      List({ space: 10 }) {
        ListItem() {
          this.TitleBuilder()
        }

        ListItem() {
          this.ContentBuilder()
        }
      }
      .layoutWeight(1)
      .width('100%')
      .padding(10)
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#f5f5f5')
  }
}