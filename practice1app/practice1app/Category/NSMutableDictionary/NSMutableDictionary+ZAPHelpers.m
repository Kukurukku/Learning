//
//  NSMutableDictionary+ZAPHelpers.m
//  koiuranai
//
//  Created by 菅原　正展 on 2015/01/09.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "NSMutableDictionary+ZAPHelpers.h"

@implementation NSMutableDictionary (ZAPHelpers)

-(BOOL)setObjectOrNil:(id)objectOrNil forKey:(id<NSCopying>)key {
    if (!objectOrNil) {
        return NO;
    }
    [self setObject:objectOrNil forKey:key];
    return YES;
}
@end
