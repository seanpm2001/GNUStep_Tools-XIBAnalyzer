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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        if(argc <= 1)
        {
            puts("\nUsage: xibanalyzer xibname.xib\n");
            return -1;
        }
        
        NSString *fileName = [NSString stringWithUTF8String:argv[1]];
        XIBClassGenerator *classGenerator = [XIBClassGenerator xibClassGeneratorWithContentsOfFile:fileName];
        NSArray *array = [classGenerator parse];
        if(array == nil)
        {
            puts("\nInput file was not parseable\n");
            return -1;
        }
        else
        {
            for(XIBClass *xibClass in array)
            {
                NSString *stringForClassHeader = [xibClass generate];
                NSLog(@"%@",stringForClassHeader);
                NSString *headerName = [xibClass.name stringByAppendingString:@".h"];
                [stringForClassHeader writeToFile:headerName atomically:YES encoding:NSUTF8StringEncoding error:NULL];
                
                NSString *stringForClassCode = [xibClass generateCode];
                NSLog(@"%@",stringForClassCode);
                NSString *codeName = [xibClass.name stringByAppendingString:@".m"];
                [stringForClassCode writeToFile:codeName atomically:YES encoding:NSUTF8StringEncoding error:NULL];
            }
        }
    }
    return 0;
}
