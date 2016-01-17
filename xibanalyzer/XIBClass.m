//
//  XIBClass.m
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/16/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import "XIBClass.h"

@implementation XIBClass

- (instancetype) init
{
    self = [super init];
    if(self != nil)
    {
        self.attributes = [NSMutableArray arrayWithCapacity:10];
        self.methods = [NSMutableArray arrayWithCapacity:10];
    }
    return self;
}

- (NSString *) generate
{
    // will generate contents based on attributes....
    return @"";
}

@end
