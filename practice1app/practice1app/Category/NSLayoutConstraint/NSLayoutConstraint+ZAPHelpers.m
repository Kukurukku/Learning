//
//  NSLayoutConstraint+ZAPHelpers.m
//  movieCuration
//
//  Created by m_sugawara on 2015/04/08.
//  Copyright (c) 2015年 zappallas. All rights reserved.
//

#import "NSLayoutConstraint+ZAPHelpers.h"

@implementation NSLayoutConstraint (ZAPHelpers)

- (void)setPriorityIfNeeded:(UILayoutPriority)priority {
    if (self.priority == priority) {
        return;
    }
    self.priority = priority;
}

@end
