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

@synthesize attributes, methods;

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

- (NSString *)generate
{
    NSString *classString = nil;
    
    classString = @"#import <Foundation/Foundation.h>\n\n";
    classString = [classString stringByAppendingFormat:@"@interface %@ : NSObject\n{\n", self.name];
    
    for(XIBProperty *prop in [self.attributes allValues])
    {
        NSString *propString = [NSString stringWithFormat: @"\t%@\n",[prop generate]];
        classString = [classString stringByAppendingString: propString];
    }
    
    classString = [classString stringByAppendingString:@"}\n"];  // end ivar section
    
    for(XIBMethod *method in [self.methods allValues])
    {
        NSString *methodString = [NSString stringWithFormat: @"%@\n",[method generate]];
        classString = [classString stringByAppendingString: methodString];
    }

    classString = [classString stringByAppendingString:@"\n@end\n"];  // end ivar section

    return classString;
}

- (NSUInteger) compare: (id)obj
{
    XIBClass *aclass = (XIBClass *)obj;
    return [[self name] compare:aclass.name];
}
@end
