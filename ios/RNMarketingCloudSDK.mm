#import "RNMarketingCloudSDK.h"
#import <MarketingCloudSDK/MarketingCloudSDK.h>

@implementation RNMarketingCloudSDK
RCT_EXPORT_MODULE()

RCT_REMAP_METHOD(isPushEnabled,
  isPushEnabled:(RCTPromiseResolveBlock)resolve
  rejecter:(RCTPromiseRejectBlock)reject)
{
  BOOL status = [[MarketingCloudSDK sharedInstance] sfmc_pushEnabled];
  resolve(@(status));
}

RCT_REMAP_METHOD(enablePush, enablePush) {
  [[MarketingCloudSDK sharedInstance] sfmc_setPushEnabled:YES];
}

RCT_REMAP_METHOD(disablePush, disablePush) {
  [[MarketingCloudSDK sharedInstance] sfmc_setPushEnabled:NO];
}

RCT_REMAP_METHOD(getSystemToken,
  getSystemToken:(RCTPromiseResolveBlock)resolve
  rejecter:(RCTPromiseRejectBlock)reject)
{
  NSString *deviceToken = [[MarketingCloudSDK sharedInstance] sfmc_deviceToken];
  resolve(deviceToken);
}

RCT_REMAP_METHOD(setContactKey, setContactKey: (NSString *_Nonnull)contactKey) {
  [[MarketingCloudSDK sharedInstance] sfmc_setContactKey:contactKey];
}

RCT_REMAP_METHOD(getContactKey,
  getContactKey:(RCTPromiseResolveBlock)resolve
  rejecter:(RCTPromiseRejectBlock)reject)
{
  NSString *contactKey = [[MarketingCloudSDK sharedInstance] sfmc_contactKey];
  resolve(contactKey);
}

RCT_REMAP_METHOD(addTag, addTag: (NSString *_Nonnull)tag) {
  [[MarketingCloudSDK sharedInstance] sfmc_addTag:tag];
}

RCT_REMAP_METHOD(removeTag, removeTag: (NSString *_Nonnull)tag) {
  [[MarketingCloudSDK sharedInstance] sfmc_removeTag:tag];
}

RCT_REMAP_METHOD(getTags,
  getTags:(RCTPromiseResolveBlock)resolve
  rejecter:(RCTPromiseRejectBlock)reject)
{
  NSSet *tags = [[MarketingCloudSDK sharedInstance] sfmc_tags];
  NSArray *arr = [tags allObjects];
  resolve(arr);
}

RCT_REMAP_METHOD(setAttribute, setAttribute:(NSString *_Nonnull)name value : (NSString *_Nonnull)value) {
  [[MarketingCloudSDK sharedInstance] sfmc_setAttributeNamed:name value:value];
}

RCT_REMAP_METHOD(clearAttribute, clearAttribute:(NSString *_Nonnull)name) {
  [[MarketingCloudSDK sharedInstance] sfmc_clearAttributeNamed:name];
}

RCT_REMAP_METHOD(getAttributes,
  getAttributes: (RCTPromiseResolveBlock)resolve
  rejecter:(RCTPromiseRejectBlock)reject)
{
  NSDictionary *attributes = [[MarketingCloudSDK sharedInstance] sfmc_attributes];
  resolve((attributes != nil) ? attributes : @[]);
}

RCT_REMAP_METHOD(enableVerboseLogging, enableVerboseLogging) {
  [[MarketingCloudSDK sharedInstance] sfmc_setDebugLoggingEnabled:YES];
}

RCT_REMAP_METHOD(disableVerboseLogging, disableVerboseLogging) {
  [[MarketingCloudSDK sharedInstance] sfmc_setDebugLoggingEnabled:NO];
}

// RCT_REMAP_METHOD(logSdkState, logSdkState:(void)) {
//    [self splitLog:[[MarketingCloudSDK sharedInstance] sfmc_getSDKState]];
// }

RCT_REMAP_METHOD(track, track:(NSString* _Nonnull)name withAttributes:(NSDictionary *_Nonnull) attributes) {
  [[MarketingCloudSDK sharedInstance] sfmc_track:[SFMCEvent customEventWithName:name withAttributes:attributes]];
}

// Don't compile this code when we build for the old architecture.
#ifdef RCT_NEW_ARCH_ENABLED
- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:
  (const facebook::react::ObjCTurboModule::InitParams &)params
{
  return std::make_shared<facebook::react::NativeMarketingcloudsdkSpecJSI>(params);
}
#endif

@end
