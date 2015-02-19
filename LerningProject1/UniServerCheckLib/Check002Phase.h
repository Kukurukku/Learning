//
//  Week001Phase.h
//  KobetsuKakinShichiyoLib
//
//  Created by tech-user on 13/08/27.
//
//

#import "Logic.h"
#import "Check002Phase.h"
#import "Check002Item.h"

@interface Check002Phase : Logic<DownloaderDelegate>
{
    Check002Item *itemCheck002;

    
}

@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, retain) NSMutableArray *text_array;
@property (nonatomic, strong) NSString *currentElementType;
@property (nonatomic, strong) NSMutableString *currentElementData;
@property (nonatomic, strong) id currentElement;


- (bool)download:(NSString *)param serverUrl:(NSString*)isDebug;

@end
