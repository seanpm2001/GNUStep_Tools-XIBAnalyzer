//
//  XIBMethod.m
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/16/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import "XIBMethod.h"
#import "XIBProperty.h"
#import "NSString+Extensions.h"

@implementation XIBMethod

@synthesize parameterList;
@synthesize returnType;

- (instancetype) init
{
    self = [super init];
    if(self != nil)
    {
        self.parameterList = [NSMutableArray arrayWithCapacity:10];
        self.name = @"";
        self.returnType = @"void";
    }
    return self;
}

- (void) addParameter: (NSString *)aname ofType: (NSString *)type
{
    XIBProperty *property = [[XIBProperty alloc] init];
    property.name = aname;
    property.type = type;
    [self.parameterList addObject: property];
}

- (void) addParameter: (XIBProperty *)prop
{
    [self.parameterList addObject:prop];
}

- (NSString *)generate
{
    NSString *generatedString = nil;
    
    if([self.parameterList count] > 0)
    {
        NSString *parameterListString = @"";
        NSUInteger index = 0;
        
        for(XIBProperty *parameter in self.parameterList)
        {
            NSString *methodParamString = [parameter.name stringByUpperCasingFirstCharacter];
            if(index > 0)
            {
                methodParamString = [@"with" stringByAppendingString:methodParamString];
            }
            
            parameterListString = [parameterListString stringByAppendingFormat:@"%@:(%@)%@",methodParamString,parameter.type,parameter.name];
            index++;
        }
       
        generatedString = [NSString stringWithFormat:@"- (%@) set%@",self.returnType, parameterListString];
    }
    else
    {
        generatedString = [NSString stringWithFormat:@"- (%@) %@",self.returnType, self.name];
    }

    return generatedString;
}
@end
