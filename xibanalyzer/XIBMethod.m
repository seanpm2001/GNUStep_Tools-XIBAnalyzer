//
//  XIBMethod.m
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/16/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import "XIBMethod.h"

@implementation XIBMethod

@synthesize parameterList;

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

- (NSString *)generate
{
    return [NSString stringWithFormat:@"- (IBAction) %@: (id)sender;",self.name];
}

@end
