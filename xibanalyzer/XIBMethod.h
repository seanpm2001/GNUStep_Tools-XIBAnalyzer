//
//  XIBMethod.h
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/16/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XIBMethod : NSObject

@property (nonatomic, assign) NSString *name;
@property (nonatomic, assign) NSMutableArray *parameterList;

@end
