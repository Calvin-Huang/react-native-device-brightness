/**
 * Created by Calvin Huang on 3/11/17.
 */

package org.capslock.RNDeviceBrightness;

import android.app.Activity;
import android.view.WindowManager;
import android.provider.Settings;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.Promise;

public class RNDeviceBrightnessModule extends ReactContextBaseJavaModule {
	public RNDeviceBrightnessModule(ReactApplicationContext reactContext) {
    super(reactContext);
  }

  @Override
  public String getName() {
    return "RNDeviceBrightness";
  }

  @ReactMethod
  public void setBrightnessLevel(final float brightnessLevel) {
    final Activity activity = getCurrentActivity();
    if (activity == null) {
      return;
    }
    
    activity.runOnUiThread(new Runnable() {
      @Override
      public void run() {
        WindowManager.LayoutParams lp = activity.getWindow().getAttributes();
        lp.screenBrightness = brightnessLevel;
        activity.getWindow().setAttributes(lp);
      }
    });
  }

  @ReactMethod
  public void getBrightnessLevel(Promise promise) {
    WindowManager.LayoutParams lp = getCurrentActivity().getWindow().getAttributes();
    promise.resolve(lp.screenBrightness);
  }

  @ReactMethod
  public void getSystemBrightnessLevel(Promise promise){
    String brightness = Settings.System.getString(getCurrentActivity().getContentResolver(), "screen_brightness");
    promise.resolve(Integer.parseInt(brightness)/255f);
  }
}
