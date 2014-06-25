//
//  HiJackIF.h
//  LeeJack_Test
//
//  Created by Sean Parker on 6/23/14.
//  Copyright (c) 2014 LiteGear. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HiJackDelegate;

@interface HiJackIF : NSObject <HiJackDelegate>

- (BOOL)sendData:(UInt8)b;

@end
