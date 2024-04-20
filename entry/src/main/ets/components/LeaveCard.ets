export interface LeaveItem {
  // 状态
  status: number
  startTime: string
  endTime: string
  createTime: string
  applyDay: number,
  id: string
}


@Component
export default struct LeaveCard {
  build() {
    Text('LeaveCard')
  }
}