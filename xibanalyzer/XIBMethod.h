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
{
    NSMutableArray *parameterList;
}

@property (nonatomic, retain) NSMutableArray *parameterList;

@end
