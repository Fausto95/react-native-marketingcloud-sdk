
#ifdef RCT_NEW_ARCH_ENABLED
#import "RNMarketingCloudSDKSpec.h"

@interface RNMarketingCloudSDK : NSObject <NativeRNMarketingCloudSDKSpec>
#else
#import <React/RCTBridgeModule.h>

@interface RNMarketingCloudSDK : NSObject <RCTBridgeModule>
#endif

@end
