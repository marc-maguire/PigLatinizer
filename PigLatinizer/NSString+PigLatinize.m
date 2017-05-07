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
        NSRange firstCharacter = [string rangeOfString:characterArray[0]];
        NSRange searchRange;
        if (firstConsonantRange.location == firstCharacter.location) {
            searchRange = firstConsonantRange;
        } else {
            searchRange = NSMakeRange(firstCharacter.location, firstConsonantRange.location);
        }
        
        

        
        //now i have the range of the first consonant - pull out the length to act as the index
        indexOfFirstConsonantInCharacterArray = firstConsonantRange.location;
        //        NSLog(@"index of first consonant = %ld",(long)indexOfFirstConsonantInCharacterArray);
        //now i know that the index of the firstConsonant is x. lets remove everything up to that index and add it to the end.
        NSString *consonantExtractionString = [[NSString alloc]init];
        
        
        //need to trim result for punctuation so that commas get moved to the end or removed all together.
        
        consonantExtractionString = [[string substringWithRange:searchRange]stringByAppendingString:@"ay"];
        //        NSLog(@"consonantExtractionString: %@",consonantExtractionString);
        [characterArray removeObjectsInRange:searchRange];
        [characterArray addObject:consonantExtractionString];
        NSString *recompileString = [characterArray componentsJoinedByString:@""];
        [workingSpace addObject:recompileString];
        [characterArray removeAllObjects];
        //        NSLog(@"attempt 1 = %@",workingSpace);
    }

    NSString *finalString = [workingSpace componentsJoinedByString:@" "];
    return finalString;
}

@end
