//
//  XIBProperty.m
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/16/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import "XIBProperty.h"

@implementation XIBProperty

@synthesize type;

- (instancetype) init
{
    self = [super init];
    if(self != nil)
    {
        self.type = @"NSString";
        self.name = @"foo";
    }
    return self;
}

- (NSString *)generate
{
    NSString *aType = self.type;
    if([aType containsString:@"Rect"] == NO &&
       [aType isEqualToString:@"BOOL"] == NO &&
       [aType containsString:@"Mask"] == NO)
    {
        aType = [aType stringByAppendingString:@"*"];
    }
    return [NSString stringWithFormat:@"%@ _%@", aType, self.name];
}

@end
