//
//  XIBClassGenerator.h
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/14/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XIBClassGenerator : NSObject <NSXMLParserDelegate>
{
    NSXMLParser *parser;
}

+ (instancetype) xibClassGeneratorWithContentsOfFile: (NSString *)fileName;
+ (instancetype) xibClassGeneratorWithString: (NSString *)string;
+ (instancetype) xibClassGeneratorWithData: (NSData *)data;

- (instancetype) initWithData: (NSData *)data;
- (BOOL) parse;

@end
