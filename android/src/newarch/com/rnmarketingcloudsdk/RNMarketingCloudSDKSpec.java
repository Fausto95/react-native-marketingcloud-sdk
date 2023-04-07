package com.rnmarketingcloudsdk;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReadableMap;

abstract class RNMarketingCloudSDKSpec extends NativeRNMarketingCloudSDKSpec {
  RNMarketingCloudSDKSpec(ReactApplicationContext context) {
    super(context);
  }

  public abstract void isPushEnabled(Promise promise);
  public abstract void enablePush();
  public abstract void disablePush();
  public abstract void getSystemToken(Promise promise);
  public abstract void getAttributes(Promise promise);
  public abstract void setAttribute(final String key, final String value);
  public abstract void clearAttribute(final String key);
  public abstract void addTag(final String tag);
  public abstract void removeTag(final String tag);
  public abstract void getTags(Promise promise);
  public abstract void setContactKey(final String contactKey);
  public abstract void getContactKey(final Promise promise);
  public abstract void enableVerboseLogging();
  public abstract void disableVerboseLogging();
  public abstract void logSdkState();
  public abstract void track(final String name, final ReadableMap attributes);
}
