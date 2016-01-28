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

- (void) addMethod: (XIBMethod *)method
{
    XIBMethod *meth = [self.methods objectForKey:method.name];
    if(meth == nil)
    {
        [self.methods setObject:method forKey:method.name];
    }
}

- (NSString *)generate
{
    NSString *classString = nil;
    
    classString = @"#import <Foundation/Foundation.h>\n\n";
    classString = [classString stringByAppendingFormat:@"@interface %@ : NSObject\n{\n", self.name];
    
    for(XIBProperty *prop in [[self.attributes allValues] sortedArrayUsingSelector:@selector(compare:)])
    {
        NSString *propString = [NSString stringWithFormat: @"\t_%@;\n",[prop generate]];
        classString = [classString stringByAppendingString: propString];
    }
    
    classString = [classString stringByAppendingString:@"}\n\n"];  // end ivar section
    
    for(XIBMethod *method in [[self.methods allValues] sortedArrayUsingSelector:@selector(compare:)])
    {
        NSString *methodString = [NSString stringWithFormat: @"%@;\n",[method generate]];
        classString = [classString stringByAppendingString: methodString];
    }

    classString = [classString stringByAppendingString:@"\n@end\n"];  // end ivar section

    return classString;
}

- (NSString *)generateCode
{
    NSString *classString = nil;
    
    classString = [NSString stringWithFormat:@"#import \"%@.h\"\n\n",self.name];
    classString = [classString stringByAppendingFormat:@"@implementation %@ \n\n", self.name];
    
    /*
    for(XIBProperty *prop in [[self.attributes allValues] sortedArrayUsingSelector:@selector(compare:)])
    {
        NSString *propString = [NSString stringWithFormat: @"\t_%@\n",[prop generate]];
        classString = [classString stringByAppendingString: propString];
    }
     */
    
    // classString = [classString stringByAppendingString:@"}\n\n"];  // end ivar section
    
    for(XIBMethod *method in [[self.methods allValues] sortedArrayUsingSelector:@selector(compare:)])
    {
        NSString *methodString = [NSString stringWithFormat: @"%@\n",[method generateCode]];
        classString = [classString stringByAppendingString: methodString];
    }
    
    classString = [classString stringByAppendingString:@"@end\n"];  // end ivar section
    
    return classString;
}

@end
