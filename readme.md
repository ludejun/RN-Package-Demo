# RN接入原生SDKDemo

代码中android、ios文件夹分别对应原生安卓、iOS代码。

### QuickStart

1. 搭建开发环境

参考官方文档：https://reactnative.dev/docs/environment-setup

中文非官方文档：https://www.react-native.cn/docs/environment-setup

对于原生同学来说，主要分几步：
```shell
# iOS
brew install node
brew install watchman

npm install -g yarn
## 在根路径中
cd ios
pod install

cd ..
yarn install
yarn ios #这是开启原生编译，就会模拟器起来，对原生来讲用下面的yarn start更简单

##或者对于原生更喜欢的模式，用Xcode打开ios文件夹中的项目，pod install
### 在根路径中
yarn start # 开始JS代码编译，并热更新，如果有改动ios文件夹下面的代码，必须用 yarn ios；android类似
### 在Xcode中运行模拟器就行


# Android 参考官方文档，主要是安装node依赖，配置android studio的一些sdk版本选上，对于原生来说有很多应该不用改
brew install node
brew install watchman
brew install --cask adoptopenjdk/openjdk/adoptopenjdk11

yanr install
yarn start
```

2. 更改代码自动打包更新模拟器

在前面使用 yarn start启动项目时，项目会自动热更新模拟器中的展示，如果模拟器没有及时展示可以强制更新 command + R

App.js就是模拟器上Demo代码，改动它，模拟器就会自动更新。

如果有改动ios、android文件夹下代码请使用yarn ios或者yarn android命令，不支持热更新
### 接入原生SDK

参考官方文档：https://reactnative.dev/docs/native-modules-intro https://reactnative.dev/docs/native-modules-ios

中文非官方文档：https://www.react-native.cn/docs/native-modules-android https://www.react-native.cn/docs/native-modules-ios

1. 将原生SDK copy到对应文件夹，添加能让RN调用的Bridge入口（可能也不需要加）

2. yarn ios或者yarn android

3. 更改App.js代码，看是否能在App.js中调用原生SDK的API
```js
// 示例代码，我在App.js中有实现，在相应注释的地方修改即可
import React from 'react';
import { NativeModules, Button } from 'react-native';

const App = () => {
  const { CalendarModule } = NativeModules; // CalendarModule即为原生SDK名字
  const onPress = () => {
    CalendarModule.createCalendarEvent('testName', 'testLocation'); // createCalendarEvent为原生SDK里面提供的方法
  };

  return (
    <Button
      title="Click to invoke your native module!"
      color="#841584"
      onPress={onPress}
    />
  );
};

export default App;

```