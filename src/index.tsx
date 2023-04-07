import { NativeModules, Platform } from 'react-native';

const LINKING_ERROR =
  `The package 'RNMarketingCloudSDK' doesn't seem to be linked. Make sure: \n\n` +
  Platform.select({ ios: "- You have run 'pod install'\n", default: '' }) +
  '- You rebuilt the app after installing the package\n' +
  '- You are not using Expo Go\n';

// @ts-expect-error
const isTurboModuleEnabled = global.__turboModuleProxy != null;

const RNMarketingCloudSDKModule = isTurboModuleEnabled
  ? require('./NativeRNMarketingCloudSDK').default
  : NativeModules.RNMarketingCloudSDK;

const RNMarketingCloudSDK = RNMarketingCloudSDKModule
  ? RNMarketingCloudSDKModule
  : new Proxy(
      {},
      {
        get() {
          throw new Error(LINKING_ERROR);
        },
      }
    );

export function isPushEnabled(): Promise<boolean> {
  return RNMarketingCloudSDK.isPushEnabled();
}

export function enablePush(): void {
  RNMarketingCloudSDK.enablePush();
}
export function disablePush(): void {
  RNMarketingCloudSDK.disablePush();
}

export function getSystemToken(): Promise<string | null> {
  return RNMarketingCloudSDK.getSystemToken();
}

export function getAttributes(): { [key: string]: string } {
  return RNMarketingCloudSDK.getAttributes();
}

export function setAttribute(key: string, value: string): void {
  RNMarketingCloudSDK.setAttribute(key, value);
}

export function clearAttribute(key: string): void {
  RNMarketingCloudSDK.clearAttribute(key);
}

export function addTag(tag: string): void {
  RNMarketingCloudSDK.addTag(tag);
}

export function removeTag(tag: string): void {
  RNMarketingCloudSDK.removeTag(tag);
}

export function getTags(): Promise<Array<string>> {
  return RNMarketingCloudSDK.getTags();
}

export function setContactKey(contactKey: string): void {
  RNMarketingCloudSDK.setContactKey(contactKey);
}

export function getContactKey(): Promise<string | null> {
  return RNMarketingCloudSDK.getContactKey();
}

export function enableVerboseLogging(): void {
  RNMarketingCloudSDK.enableVerboseLogging();
}

export function disableVerboseLogging(): void {
  RNMarketingCloudSDK.disableVerboseLogging();
}

export function logSdkState(): void {
  RNMarketingCloudSDK.logSdkState();
}

export function track(
  name: string,
  attributes: { [key: string]: string }
): void {
  RNMarketingCloudSDK.track(name, attributes);
}
