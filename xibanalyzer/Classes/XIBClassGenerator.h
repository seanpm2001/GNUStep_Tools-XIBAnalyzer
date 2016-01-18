//
//  XIBClassGenerator.h
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/14/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import <Foundation/Foundation.h>

@class XIBClass;

@interface XIBClassGenerator : NSObject <NSXMLParserDelegate>
{
    NSXMLParser *parser;
    NSMutableArray *stack;
    NSMutableArray *classStack;
    NSMutableDictionary *classesToNames;  // hold classes and file contents....
    NSMutableDictionary *classNameMap;    // hold mappings from XIB names to actual classnames
}

+ (instancetype) xibClassGeneratorWithContentsOfFile: (NSString *)fileName;
+ (instancetype) xibClassGeneratorWithString: (NSString *)string;
+ (instancetype) xibClassGeneratorWithData: (NSData *)data;

- (instancetype) initWithData: (NSData *)data;
- (NSString *)classNameForElementName: (NSString *)elementName;
- (BOOL) parse;

@end
