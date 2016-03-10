//
//  XIBMethod.h
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/16/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XIBElement.h"

@class XIBProperty;

@interface XIBMethod : XIBElement
{
    NSString *returnType;
    NSMutableArray *parameterList;
}

@property (nonatomic, retain) NSString *returnType;
@property (nonatomic, retain) NSMutableArray *parameterList;

- (void) addParameter: (NSString *)aname ofType: (NSString *)type;
- (void) addParameter: (XIBProperty *)prop;
- (NSString *)generateCopy;

@end
