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
@synthesize returnType;

- (instancetype) init
{
    self = [super init];
    if(self != nil)
    {
        self.parameterList = [NSMutableArray arrayWithCapacity:10];
        self.name = @"bar";
        self.returnType = @"void";
    }
    return self;
}

- (NSString *)generate
{
    return [NSString stringWithFormat:@"- (%@) %@: (id)sender;",self.returnType,self.name];
}

@end
