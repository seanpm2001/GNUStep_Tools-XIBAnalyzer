//
//  XIBElement.m
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/17/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import "XIBElement.h"

@implementation XIBElement

@synthesize name;

- (NSString *) generate
{
    // will generate contents based on attributes....
    return self.name;
}

- (NSUInteger) compare: (id)obj
{
    XIBElement *elem = (XIBElement *)obj;
    return [[self name] compare:elem.name];
}

@end
