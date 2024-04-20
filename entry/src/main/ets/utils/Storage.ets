import dataPreferences from '@ohos.data.preferences';
import Log from './Log';


const PREFERENCES_NAME = 'myPreferences' // 首选项名字

type ValueType = dataPreferences.ValueType;


export default class Storage {
  static preference: dataPreferences.Preferences | null = null;
  // 初始化
  static async init(context: Context) {
    if (!this.preference) {
      this.preference = await dataPreferences.getPreferences(context, PREFERENCES_NAME)
    }
  }

  // 获取
  static async get<T extends ValueType>(key: string, defaultValue: T) {
    try {
      const res = await this.preference.get(key, defaultValue);
      return res as T;
    } catch (e) {
      Log.error('获取preference数据失败', e)
      return defaultValue;
    }
  }
  // 设置
  static async set(key: string, value: ValueType) {
    try {
      await this.preference.put(key, value);
      // 设置完成后一定要调用flush进行持久化
      await this.preference.flush();
    } catch (e) {
      Log.error('设置preference数据失败', e)
    }
  }
  // 获取token
  static async getToken() {
    return await this.get<string>('token', '');
  }
  // 设置token
  static async setToken(token: string) {
    return await this.set('token', token);
  }
}