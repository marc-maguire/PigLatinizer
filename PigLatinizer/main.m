//
//  main.m
//  PigLatinizer
//
//  Created by Marc Maguire on 2017-05-05.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSString+PigLatinize.h"
#import "InputHandler.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        
        BOOL loopOn = YES;
        
        NSLog(@"Welcome to Piglatinizer!");
        while (loopOn) {
            
        NSLog(@"Please enter a sentence to get the piglatin version:");
        NSString *inputString = [InputHandler initiateUserInteraction];
        NSString *pigLatinVersion = [inputString stringByPigLatinization];
        NSLog(@"%@",pigLatinVersion);
        
        }
    }
    return 0;
}
