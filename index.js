/**
 * Created by Calvin Huang on 3/11/17.
 */

var RNDeviceBrightness = require('react-native').NativeModules.RNDeviceBrightness;
var Platform = require('react-native').Platform;

module.exports = {
  setBrightnessLevel: function(brightnessLevel) {
    if (brightnessLevel < 0 || brightnessLevel > 1) {
      if(!(Platform.OS === 'android' && brightnessLevel===-1)) {
          throw Error('⚠️ BrightnessLevel value must betweens 0 to 1 ⚠️');
      }
    }

    RNDeviceBrightness.setBrightnessLevel(brightnessLevel);
  },
  getBrightnessLevel: RNDeviceBrightness.getBrightnessLevel,

  getSystemBrightnessLevel: function () {
    if(Platform.OS!=='android'){
        throw Error('⚠️ android only supported ⚠️');
    }
    return RNDeviceBrightness.getSystemBrightnessLevel();
  }
};
