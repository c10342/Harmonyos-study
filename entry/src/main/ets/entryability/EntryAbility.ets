import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import Log from '../utils/Log';
import Storage from '../utils/Storage';

export default class EntryAbility extends UIAbility {
  onCreate(want, launchParam) {
    Log.info('Ability onCreate')
  }

  onDestroy() {
    Log.info('Ability onDestroy')
  }

  async onWindowStageCreate(windowStage: window.WindowStage) {
    Log.info('Ability onWindowStageCreate')
    await Storage.init(this.context)

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        Log.info('Failed to load the content. Cause: ', err)
        return;
      }
      Log.info('Succeeded in loading the content. Data: ', data)
    });
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    Log.info('Ability onWindowStageDestroy')
  }

  onForeground() {
    // Ability has brought to foreground
    Log.info('Ability onForeground')
  }

  onBackground() {
    // Ability has back to background
    Log.info('Ability onBackground')
  }
}
