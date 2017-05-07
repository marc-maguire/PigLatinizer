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
    
    NSString *consonants = @"bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ";
    NSCharacterSet *consonantSet = [NSCharacterSet characterSetWithCharactersInString:consonants];
    //array of words to work on
    NSArray *input = [self componentsSeparatedByString:@" "];
   
    
    NSMutableArray *workingSpace = [[NSMutableArray alloc]init];

    
    NSLog(@"attempt 1 = %@",workingSpace);
    
    for (NSString *string in input){
        NSMutableArray *characterArray = [[NSMutableArray alloc]init];
        NSInteger indexOfFirstConsonantInCharacterArray = 0;
        for (int i = 0; i < [string length]; i++) {
            NSString *ch = [string substringWithRange:NSMakeRange(i, 1)];
            [characterArray addObject:ch];
            NSLog(@"constonant array %@",characterArray);
        } //at this point, we have an array of characters
        //search through the characterArray to find the first consonant
        NSRange firstConsonantRange = [string rangeOfCharacterFromSet:consonantSet];
        
        //now i have the range of the first consonant - pull out the length to act as the index
        indexOfFirstConsonantInCharacterArray = firstConsonantRange.location;
        NSLog(@"index of first consonant = %ld",(long)indexOfFirstConsonantInCharacterArray);
        //now i know that the index of the firstConsonant is x. lets remove everything up to that index and add it to the end.
        NSString *consonantExtractionString = [[NSString alloc]init];

        
        if (indexOfFirstConsonantInCharacterArray == 0) {
            consonantExtractionString = [characterArray[0]lowercaseString];
            NSLog(@"consonantExtractionString: %@",consonantExtractionString);
            [characterArray removeObjectAtIndex:0];
            NSString *stringWithAy = [consonantExtractionString stringByAppendingString:@"ay"];
            [characterArray addObject:stringWithAy];
            NSString *recompileString = [characterArray componentsJoinedByString:@""];
            [workingSpace addObject:recompileString];
            NSLog(@"attempt 1 = %@",workingSpace);
            
        }
        
        
        
    }
    

    NSString *finalString = [workingSpace componentsJoinedByString:@" "];
    return finalString;
}

@end
