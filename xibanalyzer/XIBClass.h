//
//  XIBClass.h
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/16/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XIBClass : NSObject

@property (nonatomic, assign) NSString *className;
@property (nonatomic, assign) NSMutableArray *attributes;
@property (nonatomic, assign) NSMutableArray *methods;

- (NSString *) generate;

@end
