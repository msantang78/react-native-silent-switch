#import "RCTSilentSwitch.h"
#if __has_include(<React/RCTEventDispatcher.h>)
  #import <React/RCTEventDispatcher.h>
#else
  #import "RCTEventDispatcher.h"
#endif


@implementation RCTSilentSwitch

@synthesize bridge = _bridge;

-(id)init {
    if (self) {
        self.detector = [SharkfoodMuteSwitchDetector shared];
    }
    return self;
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(subscribe) {
    self.detector.silentNotify = ^(BOOL silent) {
        [self.bridge.eventDispatcher sendAppEventWithName:@"SilentSwitch"
                                                     body:@{@"status": silent?@"ON":@"OFF"}];
    };
}

@end
