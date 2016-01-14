//
//  XIBClassGenerator.m
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/14/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import "XIBClassGenerator.h"

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
        }
        else
        {
            return nil;
        }
    }
    return self;
}

- (BOOL) parse
{
    return [parser parse];
}


// Delegate
- (void)  parser:(NSXMLParser *)parser
 didStartElement:(NSString *)elementName
    namespaceURI:(NSString *)namespaceURI
   qualifiedName:(NSString *)qName
      attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    // Push onto the stack...
    [stack addObject:elementName];
    
    // Do whatever...
}

- (void)  parser:(NSXMLParser *)parser
   didEndElement:(NSString *)elementName
    namespaceURI:(NSString *)namespaceURI
   qualifiedName:(NSString *)qName
{
    // Do whatever...
    
    // Pop off the stack...
    [stack removeLastObject];
}
@end
