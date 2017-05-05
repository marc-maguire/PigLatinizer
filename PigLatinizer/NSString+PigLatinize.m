//
//  NSString+PigLatinize.m
//  PigLatinizer
//
//  Created by Marc Maguire on 2017-05-05.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "NSString+PigLatinize.h"

@implementation NSString (PigLatinize)

-(NSString *)stringByPigLatinization {
    
    //if first letter is vowel, do nothing and append -ay
    
    NSString *consonants = @"bcdfghjklmnpqrstvwxyz";
    NSCharacterSet *consonantSet = [NSCharacterSet characterSetWithCharactersInString:consonants];
    
    //array of words to work on
    NSArray *input = [self componentsSeparatedByString:@" "];
//    NSLog(@"%@",input);
    
    for (NSString *string in input){
        NSMutableArray *characterArray = [[NSMutableArray alloc]init];
        for (int i = 0; i < [string length]; i++) {
            NSString *ch = [string substringWithRange:NSMakeRange(i, 1)];
            [characterArray addObject:ch];
            NSLog(@"constonant array %@",characterArray);
        }
        for (NSString* chars in characterArray) {
            
            if (
            
        }
        
        //NSRange consonantRange = [string rangeOfCharacterFromSet:consonantSet];
//        NSArray *stringConsonantsArray = [string componentsSeparatedByCharactersInSet:consonantSet];
        
//        NSLog(@"%@",[string :@""]);
        //now i want to find what consonants to move
        
    
    }
    
    return nil;
}

@end
