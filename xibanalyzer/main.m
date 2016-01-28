//
//  main.m
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/14/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XIBClassGenerator.h"
#import "XIBClass.h"

// #define DEBUG 1

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
#ifdef DEBUG
        NSString *fileName = @"/Users/heron/Desktop/MainMenu.xib";
#else
        if(argc <= 1)
        {
            puts("\nUsage: xibanalyzer xibname.xib\n");
            return -1;
        }
        
        NSString *fileName = [NSString stringWithUTF8String:argv[1]];
#endif
        XIBClassGenerator *classGenerator = [XIBClassGenerator xibClassGeneratorWithContentsOfFile:fileName];
        NSArray *array = [classGenerator parse];
        if(array == nil)
        {
            printf("\nInput file '%s' was not parseable\n",[fileName cStringUsingEncoding:NSUTF8StringEncoding]);
            return -1;
        }
        else
        {
            for(XIBClass *xibClass in array)
            {
                NSString *stringForClassHeader = [xibClass generate];
#ifdef DEBUG
                NSLog(@"%@",stringForClassHeader);
#endif
                NSString *headerName = [xibClass.name stringByAppendingString:@".h"];
                [stringForClassHeader writeToFile:headerName atomically:YES encoding:NSUTF8StringEncoding error:NULL];
                
                NSString *stringForClassCode = [xibClass generateCode];
#ifdef DEBUG
                NSLog(@"%@",stringForClassCode);
#endif
                NSString *codeName = [xibClass.name stringByAppendingString:@".m"];
                [stringForClassCode writeToFile:codeName atomically:YES encoding:NSUTF8StringEncoding error:NULL];
            }
        }
    }
    return 0;
}
