//
//  XIBElement.m
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/17/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import "XIBElement.h"
#import "NSString+Extensions.h"

@implementation XIBElement

@dynamic name;

- (void) setName:(NSString *)aname
{
    name = [aname renameIfReservedWord];
}

- (NSString *)name
{
    return name;
}

- (NSString *) generate
{
    // will generate contents based on attributes....
    return self.name;
}

- (NSString *) generateCode
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
