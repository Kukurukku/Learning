//
//  Week001Item.h
//  KobetsuKakinShichiyoLib
//
//  Created by tech-user on 13/08/27.
//
//

#import  <Foundation/Foundation.h>

@interface Check002Item : NSObject

@property (nonatomic, strong) NSString *packages;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *start_datetime;
@property (nonatomic, strong) NSString *end_datetime;
@property (nonatomic, strong) NSString *status;

@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSString *etc1;
@property (nonatomic, strong) NSString *etc2;
@property (nonatomic, strong) NSString *etc3;


- (void)dump;
@end
