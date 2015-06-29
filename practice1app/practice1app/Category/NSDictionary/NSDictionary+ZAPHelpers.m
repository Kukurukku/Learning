//
//  NSDictionary+ZAPHelpers.m
//  movieCuration
//
//  Created by m_sugawara on 2015/04/01.
//  Copyright (c) 2015年 zappallas. All rights reserved.
//

#import "NSDictionary+ZAPHelpers.h"

@implementation NSDictionary (ZAPHelpers)

- (id)objectForKeyIfExists:(NSString *)key {
    // キーが含まれてなければnilを返す
    if (![self.allKeys containsObject:key]) {
        return nil;
    }
    return [self objectForKey:key];
}

@end
