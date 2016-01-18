 //
//  XIBClassGenerator.m
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/14/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import "XIBClassGenerator.h"
#import "XIBClass.h"
#import "XIBMethod.h"
#import "XIBProperty.h"

@implementation XIBClassGenerator 

+ (instancetype) xibClassGeneratorWithContentsOfFile: (NSString *)fileName
{
    if(fileName == nil)
    {
        return nil;
    }
    
    NSError *error = nil;
    NSString *xmlString = [NSString
                           stringWithContentsOfFile:fileName
                           encoding:NSUTF8StringEncoding
                           error:&error];
    if(error != nil)
    {
        NSLog(@"Error %@",error);
        return nil;
    }

    return [self xibClassGeneratorWithString:xmlString];
}

+ (instancetype) xibClassGeneratorWithString: (NSString *)string
{
    if(string == nil)
    {
        return nil;
    }
    
    NSData *data = [NSData dataWithBytes:[string cStringUsingEncoding:NSUTF8StringEncoding]
                                  length:[string lengthOfBytesUsingEncoding:NSUTF8StringEncoding]];
    
    return [self xibClassGeneratorWithData:data];
}

+ (instancetype) xibClassGeneratorWithData: (NSData *)data
{
    return [[self alloc] initWithData: data];
}

- (instancetype) initWithData: (NSData *)data
{
    self = [super init];
    if(self != nil)
    {
        parser = [[NSXMLParser alloc] initWithData:data];
        if(parser != nil)
        {
            [parser setDelegate:self];
            stack = [NSMutableArray arrayWithCapacity:100];
            classesToNames = [NSMutableDictionary dictionaryWithCapacity:100];
            classNameMap = [NSMutableDictionary dictionaryWithCapacity:100];
        }
        else
        {
            return nil;
        }
    }
    return self;
}

- (NSArray *) parse
{
    if([parser parse])
    {
        NSArray *sortedArray = [[classesToNames allValues] sortedArrayUsingSelector:@selector(compare:)];
        return sortedArray;
    }

    return nil;
}

// Class name generation
- (NSString *)classNameForElementName: (NSString *)elementName
{
    return elementName;
}

- (NSString *)inferType:(NSString *)value
{
    if([value isEqualToString:@"NO"] || [value isEqualToString: @"YES"])
    {
        return @"BOOL";
    }
    return @"NSString*"; // for now.
}

- (XIBClass *)classForName: (NSString *)name
{
    XIBClass *xibClass = [classesToNames objectForKey:name];
    if(xibClass == nil)
    {
        xibClass = [[XIBClass alloc] init];
        xibClass.name = name;
        [classesToNames setObject:xibClass forKey:name];
    }
    return xibClass;
}

// Delegate
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    // Currently do nothing....
    NSLog(@"Started parsing");

}

- (void)  parser:(NSXMLParser *)parser
 didStartElement:(NSString *)elementName
    namespaceURI:(NSString *)namespaceURI
   qualifiedName:(NSString *)qName
      attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    NSString *className = nil;
    XIBClass *xibClass = nil;
    NSArray *allKeys = [attributeDict allKeys];
    if([allKeys count] > 0)
    {
        if([allKeys containsObject:@"key"])
        {
            XIBClass *currentClass = (XIBClass *)[stack lastObject];
            className = [self classNameForElementName:elementName];
            xibClass = [self classForName:className];
            NSString *keyName = [attributeDict objectForKey:@"key"];
            XIBProperty *property = [[XIBProperty alloc] init];
            property.name = keyName;
            property.type = className;
            [currentClass addAttribute:property];
            
            // Push onto the stack...
            [stack addObject:xibClass];
        }
        else
        {
            className = [self classNameForElementName:elementName];
            xibClass = [self classForName:className];
            
            // Push onto the stack...
            [stack addObject:xibClass];
            
            for(NSString *key in allKeys)
            {
                NSString *value = [attributeDict objectForKey:key];
                NSString *type = [self inferType: value];
                XIBProperty *property = [[XIBProperty alloc] init];
                property.name = key;
                property.type = type;
                [xibClass addAttribute: property];
            }
        }
    }
    else
    {
        XIBElement *elem = (XIBElement *)[stack lastObject];
        className = elem.name;
        xibClass = (XIBClass *)[classesToNames objectForKey:className];
        XIBProperty *property = [[XIBProperty alloc] init];
        property.name = elementName;
        property.type = @"NSMutableArray*";
        [xibClass addAttribute: property];
    }
}

- (void)  parser:(NSXMLParser *)parser
   didEndElement:(NSString *)elementName
    namespaceURI:(NSString *)namespaceURI
   qualifiedName:(NSString *)qName
{
    // Pop off the stack...
    XIBClass *obj = (XIBClass *)[stack lastObject];
    NSString *className = [self classNameForElementName:elementName];
    if([[obj name] isEqualToString:className] == YES)
    {
        [stack removeLastObject];
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"Done parsing");
}

@end
