import { AbilityConstant, ConfigurationConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { PreferencesClass } from '../pages/06/6.2.6';

const DOMAIN = 0x0000;

export default class EntryAbility extends UIAbility {
  // 6.2.3-re3
  para: Record<string, ResourceStr> = {
    'age': '18',
    'nickName': '一个小码农',
    'gender': '男',
    'avtar': $r('app.media.user')
  }
  storage: LocalStorage = new LocalStorage(this.para)

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    this.context.getApplicationContext().setColorMode(ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET);
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onCreate');
  }

  onDestroy(): void {
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    // 6.2.8
    windowStage.loadContent('pages/06/6.2.8', (err) => {
      if (err.code) {
        hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
        return;
      }
      hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    });

    // 6.2.6 Preferences
    // PreferencesClass.delToken(this.context)
    // let token = PreferencesClass.getToken(this.context)
    // console.log('tokennnnnnn:',token)
    // let pagePath = 'pages/06/6.2.5'
    // if(token !== '') pagePath = 'pages/06/6.2.4B-display'
    // windowStage.loadContent(pagePath, (err) => {
    //   if (err.code) {
    //     hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
    //     return;
    //   }
    //   hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    //
    //   PersistentStorage.persistProp('userInfo','')
    // });

    // 6.2.5 PersistentStorage
    // windowStage.loadContent('pages/06/6.2.5', (err) => {
    //   if (err.code) {
    //     hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
    //     return;
    //   }
    //   hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    //
    //   PersistentStorage.persistProp('userInfo','')
    //
    // });

    // 6.2.4-login AppStorage // pages/06/6.2.4A-login-ability
    // windowStage.loadContent('pages/06/6.2.4A-login-ability', (err) => {
    //   if (err.code) {
    //     hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
    //     return;
    //   }
    //   hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    // });

    // 6.2.3-re3
    // windowStage.loadContent('pages/06/6.2.3re4', this.storage, (err) => {
    //   if (err.code) {
    //     hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
    //     return;
    //   }
    //   hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    // });

    // 6.2.3-re2 LocalStorage
    // const userInfo: Record<string, ResourceStr> = {
    //   'age': '18',
    //   'nickName': '一个小码农',
    //   'gender': '男',
    //   'avtar': $r('app.media.user')
    // }
    // const localUserInfo = new LocalStorage(userInfo)
    //
    // windowStage.loadContent('pages/06/6.2.3re2', localUserInfo, (err) => {
    //   if (err.code) {
    //     hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
    //     return;
    //   }
    //   hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    // });

    // default
    // windowStage.loadContent('pages/06/6.2.3', (err) => {
    //   if (err.code) {
    //     hilog.error(DOMAIN, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err));
    //     return;
    //   }
    //   hilog.info(DOMAIN, 'testTag', 'Succeeded in loading the content.');
    // });

    // windowStage.getMainWindow((err, data) => {
    //   if (!err.code) {
    //     data.setWindowLayoutFullScreen(true)
    //   }
    // });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(DOMAIN, 'testTag', '%{public}s', 'Ability onBackground');
  }
}