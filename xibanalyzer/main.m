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
        /*
        if(argc <= 1)
        {
            return -1;
        }*/
        
        NSString *fileName = @"/Users/heron/Desktop/MainMenu.xib"; // [NSString stringWithUTF8String:argv[1]];
        XIBClassGenerator *classGenerator = [XIBClassGenerator xibClassGeneratorWithContentsOfFile:fileName];
        NSArray *array = [classGenerator parse];
        if(array == nil)
        {
            return -1;
        }
        else
        {
            for(XIBClass *xibClass in array)
            {
                NSString *stringForClassHeader = [xibClass generate];
                NSLog(@"%@",stringForClassHeader);
                
                NSString *stringForClassCode = [xibClass generateCode];
                NSLog(@"%@",stringForClassCode);
            }
        }
    }
    return 0;
}
