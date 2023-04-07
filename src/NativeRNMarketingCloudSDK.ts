import type { TurboModule } from 'react-native';
import { TurboModuleRegistry } from 'react-native';
import type { UnsafeObject } from 'react-native/Libraries/Types/CodegenTypes';

export interface Spec extends TurboModule {
  isPushEnabled(): Promise<boolean>;
  enablePush(): void;
  disablePush(): void;
  getSystemToken(): Promise<string | null>;
  getAttributes(): Promise<UnsafeObject>;
  setAttribute(key: string, value: string): void;
  clearAttribute(key: string): void;
  addTag(tag: string): void;
  removeTag(tag: string): void;
  getTags(): Promise<Array<string>>;
  setContactKey(contactKey: string): void;
  getContactKey(): Promise<string | null>;
  enableVerboseLogging(): void;
  disableVerboseLogging(): void;
  logSdkState(): void;
  track(name: string, attributes: UnsafeObject): void;
}

export default TurboModuleRegistry.getEnforcing<Spec>('RNMarketingCloudSDK');
