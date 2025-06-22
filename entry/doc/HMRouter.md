# HMRouter

https://blog.csdn.net/superherowupan/article/details/143056088
https://juejin.cn/post/7448464856620564515

## 快速集成

### 下载依赖

在`oh-package.json5`中添加依赖

```
"dependencies":{
    "@hadss/hmrouter": "^1.0.0-rc.5"
}
```

### 编译插件配置

1.修改工程的hvigor/hvigor-config.json文件，加入路由编译插件

```
{
   "dependencies": {
     "@hadss/hmrouter-plugin": "^1.0.0-rc.10"
   },
```

2. 修改entry模块的hvigorfile.ts ， 路径：entry/hvigorfile.ts

```
 import { hapTasks } from '@ohos/hvigor-ohos-plugin';
 import { hapPlugin } from '@hadss/hmrouter-plugin';

 export default {
   system: hapTasks,
   plugins: [hapPlugin()] // 使用HMRouter标签的模块均需要配置，与模块类型保持一致
 } 

```

### 初始化

``` 
onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    HMRouterMgr.init({
      context: this.context
    })
  }
}
```

### 路由入口

必须在页面中定义一个HMNavigation容器

``` 
HMNavigation({
        navigationId: "AppNavigationID",
        options: {
          // 设置动画样式
          standardAnimator: HMDefaultGlobalAnimator.STANDARD_ANIMATOR,
          // 设置弹框动画样式
          dialogAnimator: HMDefaultGlobalAnimator.DIALOG_ANIMATOR,
          // 设置页面navigation的参数，标题栏，工具栏，bar那些
          modifier: this.modifier
        }
      })
```

### 补充

如果是多模块开发，在子模块，如har包内，也要进行编译配置。
需要注意，har模块的编译配置是harPlugin，不是hapPlugin。

``` 
import { harTasks } from '@ohos/hvigor-ohos-plugin';
import { harPlugin } from "@hadss/hmrouter-plugin";

export default {
  system: harTasks, /* Built-in plugin of Hvigor. It cannot be modified. */
  plugins: [harPlugin()]         /* Custom plugin to extend the functionality of Hvigor. */
}
```