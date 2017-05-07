//
//  main.m
//  PigLatinizer
//
//  Created by Marc Maguire on 2017-05-05.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSString+PigLatinize.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
//        NSString *hello = @"Hello";
        NSString *pigLatinVersion = [@"hello" stringByPigLatinization];
        NSLog(@"The pig latin version of 'Hello' is %@",pigLatinVersion);
        
        
    }
    return 0;
}
