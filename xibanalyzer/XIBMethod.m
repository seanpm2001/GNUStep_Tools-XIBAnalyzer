//
//  XIBMethod.m
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/16/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import "XIBMethod.h"

@implementation XIBMethod

- (instancetype) init
{
    self = [super init];
    if(self != nil)
    {
        self.parameterList = [NSMutableArray arrayWithCapacity:10];
        self.name = @"bar";
    }
    return self;
}

@end
