//
//  NSArray+ZAPHelpers.m
//  koiuranai
//
//  Created by 日野　慎哉 on 2015/01/05.
//  Copyright (c) 2015年 Zappallas. All rights reserved.
//

#import "NSArray+ZAPHelpers.h"

@implementation NSArray (ZAPHelpers)

- (id)objectAtIndexIfExists:(NSUInteger)index {
    if (!self) {
        return nil;
    }
    NSUInteger count = self.count;
    BOOL hasObject = count - 1 >= index;
    if (hasObject) {
        return [self objectAtIndex:index];
    }
    return nil;
}

- (NSArray *)shuffled {
    // 参考：http://tryworks-design.com/?p=2344
    // シャッフルした配列の要素を格納する。「self」は「NSArray」を指している
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
    
    // 渡ってきたNSArrayの要素の数だけ繰り返し実行する。
    for(id object in self)
    {
        // NSUIntegerは正の整数を扱う数
        // ランダムの整数を生成。
        NSUInteger randomNum = arc4random() % ([tmpArray count] + 1);
        // tmpArrayのrandomNum番目に要素を追加する。
        // これにより、NSArrayの要素がシャッフルされ配置される。
        [tmpArray insertObject:object atIndex:randomNum];
    }
    return tmpArray;
}

@end
