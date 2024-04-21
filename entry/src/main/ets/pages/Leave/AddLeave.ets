import NavBar from '../../components/NavBar'

@Entry
@Component
struct AddLeave {
  leaveTypeList = [
    { label: '年假', value: 0 },
    { label: '事假', value: 1 },
    { label: '病假', value: 2 },
    { label: '调休', value: 3 },
    { label: '婚假', value: 4 },
    { label: '其他', value: 5 }
  ]
  @State model: {
    leaveTypeId: number | string,
    remark: string
  } = { leaveTypeId: '', remark: '' }

  @Builder DateBuilder() {
    Row() {
      Text('开始时间')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Row() {
        Text('2024-4-21').fontSize(18).margin({ right: 10 })
        Text('22:46').fontSize(18)
      }
    }
    .width('100%')
    .height(80)
    .backgroundColor(Color.White)
    .padding({
      left: 10,
      right: 10
    })
    .justifyContent(FlexAlign.SpaceBetween)
    .onClick(() => {
      DatePickerDialog.show({
        // 设置选择器的起始日期
        start: new Date("2000-1-1"),
        end: new Date("2100-12-31"),
        //   设置当前选中的日期
        // selected: this.selectedDate,
        //   点击弹窗中的“确定”按钮时触发该回调
        onAccept: (value: DatePickerResult) => {
          // 通过Date的setFullYear方法设置按下确定按钮时的日期，这样当弹窗再次弹出时显示选中的是上一次确定的日期
          // this.selectedDate.setFullYear(value.year, value.month, value.day);
          console.info("DatePickerDialog:onAccept()" + JSON.stringify(value));
        },
        //   点击弹窗中的“取消”按钮时触发该回调
        onCancel: () => {
          console.info("DatePickerDialog:onCancel()");
        },
        //   滑动弹窗中的滑动选择器使当前选中项改变时触发该回调
        onChange: (value: DatePickerResult) => {
          console.info("DatePickerDialog:onChange()" + JSON.stringify(value));
        },
      });
    })
  }

  @Builder LeaveTypeBuilder() {
    Row() {
      Text('请假类型')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
      Select(this.leaveTypeList.map(item => ({ value: item.label })))
        .value(this.leaveTypeList.find(item => item.value === this.model.leaveTypeId)?.label??  '请选择')
        .font({ size: 20 })
        .fontColor('#182431')
        .selectedOptionFont({ size: 20, weight: 400 })
        .optionFont({ size: 20, weight: 400 })
        .selectedOptionBgColor('#f5f5f5')
        .selectedOptionFontColor('#182431')
        .onSelect((index: number) => {
          console.info('Select:' + index)
        })
    }
    .width('100%')
    .height(80)
    .backgroundColor(Color.White)
    .padding({
      left: 10,
      right: 10
    })
    .justifyContent(FlexAlign.SpaceBetween)
  }

  @Builder RemarkBuilder() {
    Column() {
      Text('请假类型')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .padding({
          left: 10,
          right: 10
        })
      TextArea({ placeholder: '请输入', text: this.model.remark })
        .placeholderFont({ size: 20 })
        .fontSize(20)
        .layoutWeight(1)
        .borderRadius(30)
        .backgroundColor(Color.White)
        .onChange(v => this.model.remark = v)
    }
    .width('100%')
    .height(300)
    .backgroundColor(Color.White)
    .alignItems(HorizontalAlign.Start)
    .padding({
      top: 10,
      bottom: 10
    })
  }

  build() {
    Column() {
      NavBar({ title: '请假申请' })
      List({ space: 10 }) {
        ListItem() {
          this.LeaveTypeBuilder()
        }

        ListItem() {
          this.RemarkBuilder()
        }

        ListItem() {
          this.DateBuilder()
        }
      }.width('100%')
      .layoutWeight(1)
      .margin({ top: 10 })

      Button('提交').width('94%').height(40).margin({ bottom: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5')
  }
}