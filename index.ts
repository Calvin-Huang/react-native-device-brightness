import { NativeModules, Platform } from 'react-native';

const { RNDeviceBrightness } = NativeModules;

export const setBrightnessLevel = async (
  brightnessLevel: number
): Promise<void> => {
  if (brightnessLevel < 0 || brightnessLevel > 1) {
    if (!(Platform.OS === 'android' && brightnessLevel === -1)) {
      throw Error('⚠️ BrightnessLevel value must betweens 0 to 1 ⚠️');
    }
  }

  await RNDeviceBrightness.setBrightnessLevel(brightnessLevel);
};

export const getBrightnessLevel = async (): Promise<number> => {
  return RNDeviceBrightness.getBrightnessLevel();
};

export const getSystemBrightnessLevel = (): Promise<number> => {
  if (Platform.OS !== 'android') {
    throw Error('⚠️ Android only supported ⚠️');
  }
  return RNDeviceBrightness.getSystemBrightnessLevel();
};

export default {
  setBrightnessLevel,
  getBrightnessLevel,
  getSystemBrightnessLevel,
};
