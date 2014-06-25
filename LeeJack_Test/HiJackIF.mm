//
//  HiJackIF.m
//  LeeJack_Test
//
//  Created by Sean Parker on 6/23/14.
//  Copyright (c) 2014 LiteGear. All rights reserved.
//

#import "HiJackIF.h"

#import "HiJackMgr.h"

@interface HiJackIF ()

@property(nonatomic, strong) HiJackMgr* hjMgr;

- (int) receive:(UInt8)data;

@end

@implementation HiJackIF

@synthesize hjMgr;

- (id) init {
    if(self = [super init])
	{
        // Setup code
        hjMgr = [[HiJackMgr alloc] init];
        [hjMgr setDelegate:self];
	}
	return self;
}

#pragma HiJackDelegate Methods

- (int) receive:(UInt8)data {
    return 0;
}

#pragma HiJack IF

- (BOOL)sendData:(UInt8)b {
    return ([hjMgr send:b] == 0);
}

@end
