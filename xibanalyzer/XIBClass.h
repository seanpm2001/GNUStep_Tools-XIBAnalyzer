//
//  XIBClass.h
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/16/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XIBElement.h"

@class XIBMethod;
@class XIBProperty;

@interface XIBClass : XIBElement
{
    NSMutableDictionary *attributes;
    NSMutableDictionary *methods;
}

@property (nonatomic, retain) NSMutableDictionary *attributes;
@property (nonatomic, retain) NSMutableDictionary *methods;

- (void) addAttribute: (XIBProperty *)property;
- (void) addMethod: (XIBMethod *)method;

@end
