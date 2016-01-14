//
//  main.m
//  xibanalyzer
//
//  Created by Gregory Casamento on 1/14/16.
//  Copyright © 2016 GNUstep. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XIBClassGenerator.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        if(argc <= 1)
        {
            return 0;
        }
        
        NSString *fileName = [NSString stringWithUTF8String:argv[1]];
        XIBClassGenerator *classGenerator = [XIBClassGenerator xibClassGeneratorWithContentsOfFile:fileName];
        BOOL success = [classGenerator parse];
        if(success == NO)
        {
            return -1;
        }
    }
    return 0;
}
