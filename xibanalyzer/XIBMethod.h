//
//  XIBMethod.h
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/16/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XIBElement.h"

@interface XIBMethod : XIBElement

@property (nonatomic, retain) NSMutableArray *parameterList;

@end
