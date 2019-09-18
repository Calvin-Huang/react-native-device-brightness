# React Native Device Brightness - screen brightness adjustment tool for ReactNative

[![npm version](https://badge.fury.io/js/react-native-device-brightness.svg)](https://badge.fury.io/js/react-native-device-brightness)


## Platforms Supported

- [x] iOS
- [x] Android

## Getting Started

### Install

```
$ yarn add react-native-device-brightness
```
 (or)
 
 For npm use
```
$ npm install --save react-native-device-brightness
```

### Automatic Link

- **React Native 0.60+** (skip this as auto-linking should work)

  [CLI autolink feature](https://github.com/react-native-community/cli/blob/master/docs/autolinking.md) links the module while building the app.

  Note For iOS using cocoapods, run:
  ```
  $ cd ios/ && pod install
  ```

- **React Native <= 0.59**
  ```
  react-native link react-native-device-brightness
  ```

- **With older versions of React Native <0.27**

  You need [rnpm](https://github.com/rnpm/rnpm) (npm install -g rnpm)
  ```
  rnpm link react-native-device-brightness
  ```
  *Hey, bro! react-native-device-brightness wasn't support older version of React Native yet.*

## Manually link

### iOS (without Cocoa Pods)
In XCode, in the project navigator:
- Right click _Libraries_
- Add Files to _[your project's name]_
- Go to `node_modules/react-native-device-brightness`
- Add the `.xcodeproj` file

In XCode, in the project navigator, select your project.
- Add the `libRNDeviceInfo.a` from the _deviceinfo_ project to your project's _Build Phases ➜ Link Binary With Libraries_
- Click `.xcodeproj` file you added before in the project navigator and go the _Build Settings_ tab. Make sure _All_ is toggled on (instead of _Basic_).
- Look for _Header Search Paths_ and make sure it contains both `$(SRCROOT)/../react-native/React` and `$(SRCROOT)/../../React`
- Mark both as recursive (should be OK by default).

Run your project (Cmd+R)

(Thanks to @brysgo for writing the instructions)

### Android

- in `android/app/build.gradle`:

```diff
dependencies {
    ...
    compile "com.facebook.react:react-native:+"  // From node_modules
+   compile project(':react-native-device-brightness')
}
```

- in `android/settings.gradle`:

```diff
...
include ':app'
+ include ':react-native-device-brightness'
+ project(':react-native-device-brightness').projectDir = new File(rootProject.projectDir, '../node_modules/react-native-device-brightness/android')
```

#### With React Native 0.29+

- in `MainApplication.java`:

```diff
+ import com.learnium.RNDeviceInfo.RNDeviceInfo;

  public class MainApplication extends Application implements ReactApplication {
    //......

    @Override
    protected List<ReactPackage> getPackages() {
      return Arrays.<ReactPackage>asList(
+         new RNDeviceInfo(),
          new MainReactPackage()
      );
    }

    ......
  }
```

#### With older versions of React Native:

- in `MainActivity.java`:

```diff
+ import com.learnium.RNDeviceInfo.RNDeviceInfo;

  public class MainActivity extends ReactActivity {
    ......

    @Override
    protected List<ReactPackage> getPackages() {
      return Arrays.<ReactPackage>asList(
+       new RNDeviceInfo(),
        new MainReactPackage()
      );
    }
  }
```

(Thanks to @chirag04 for writing the instructions)

## Usage
**Important: Brightness Level only accept value 0 to 1.**

- *Adjusting screen brightness will make iOS's Auto-Brightness function do nothing.*
- *Adjusting screen brightness in Android only works in App and will reset to system setting exiting App.*

```javascript
  // ES5
  var DeviceBrightness = require('react-native-device-brightness');
  // or ES6
  // import DeviceBrightness from 'react-native-device-brightness';

// It will throw a exception when value less than 0 or more than 1.
DeviceBrightness.setBrightnessLevel(luminous);
DeviceBrightness.getBrightnessLevel()
    .then(function (luminous) {
        // Get current brightness level
        // 0 ~ 1
        console.log(luminous);
    });
// Android only
DeviceBrightness.getSystemBrightnessLevel()
    .then(function (luminous) {
        // Get current brightness level
        // 0 ~ 1
        console.log(luminous);
    });
```

## License
Copyright (c) [Calvin Huang](https://github.com/Calvin-Huang). This software is licensed under the [MIT License](https://github.com/Calvin-Huang/react-native-device-brightness/blob/master/LICENSE).
