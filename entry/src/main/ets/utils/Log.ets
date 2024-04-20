import hilog from '@ohos.hilog';

function formatData(data: any[]) {
  const arr: string[] = []
  data.forEach(v => {
    if (typeof v !== 'string') {
      arr.push(JSON.stringify(v))
    } else {
      arr.push(v)
    }
  })
  return arr.join('---');
}

export default class Log {
  static info(...args: any[]) {
    hilog.info(0x0000, 'testTag', '%{public}s', formatData(args));
  }

  static error(...args: any[]) {
    hilog.error(0x0000, 'testTag', '%{public}s', formatData(args));
  }
}