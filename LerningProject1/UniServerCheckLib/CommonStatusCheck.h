//
//  CommonStatusCheck.h
//  KobetuKakinShichiyo
//
//  Created by tech-user on 13/07/11.
//
//

#import "Check002Item.h"
#import "Check002Phase.h"


@interface CommonStatusCheck : NSObject<LogicLoaderDelegate> {
    int parseStatus;

    Check002Phase *logCheck002Phase;
}
- (void)Check002:(NSString *)bundleId serverUrl:(NSString*)isDebug;

@end