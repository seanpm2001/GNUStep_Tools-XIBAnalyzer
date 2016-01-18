//
//  XIBClass.m
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/16/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import "XIBClass.h"
#import "XIBProperty.h"
#import "XIBMethod.h"

@implementation XIBClass

- (instancetype) init
{
    self = [super init];
    if(self != nil)
    {
        self.attributes = [NSMutableDictionary dictionaryWithCapacity:10];
        self.methods = [NSMutableDictionary dictionaryWithCapacity:10];
    }
    return self;
}

- (void) addAttribute: (XIBProperty *)property
{
    XIBProperty *prop = [self.attributes objectForKey:property.name];
    if(prop == nil)
    {
        [self.attributes setObject:property forKey:property.name];
    }
}

- (void) addMethod: (XIBMethod *)property
{
    XIBProperty *prop = [self.attributes objectForKey:property.name];
    if(prop == nil)
    {
        [self.attributes setObject:prop forKey:prop.name];
    }
}

@end
