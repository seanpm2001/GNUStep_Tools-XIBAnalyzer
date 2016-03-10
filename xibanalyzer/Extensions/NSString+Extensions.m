//
//  NSString+Extensions.m
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/16/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import "NSString+Extensions.h"

@implementation NSString (Extensions)

- (NSString *) stringByUpperCasingFirstCharacter
{
    unichar c = [self characterAtIndex: 0];
    NSString *oneChar = [[NSString stringWithFormat: @"%C",c] uppercaseString];
    NSString *newString = [self stringByReplacingCharactersInRange: NSMakeRange(0,1) withString: oneChar];
    return newString;
}

- (NSString *) renameIfReservedWord
{
    if([self isEqualToString:@"id"])
    {
        return @"ID";
    }
    
    if([self isEqualToString:@"class"])
    {
        return @"clazz";
    }
    
    return self;
}

@end
