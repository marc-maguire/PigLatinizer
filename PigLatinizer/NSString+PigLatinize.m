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
    
    
    NSString *consonants = @"bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ";
    NSCharacterSet *consonantSet = [NSCharacterSet characterSetWithCharactersInString:consonants];
    NSArray *input = [self componentsSeparatedByString:@" "];
    NSMutableArray *workingSpace = [[NSMutableArray alloc]init];
    NSString *consonantExtractionString = [[NSString alloc]init];

    for (NSString *string in input){
        
        
         NSMutableArray *characterArray = [[NSMutableArray alloc]init];
                for (int i = 0; i < [string length]; i++) {
            NSString *ch = [string substringWithRange:NSMakeRange(i, 1)];
            [characterArray addObject:ch];
        }
        NSRange firstConsonantRange = [string rangeOfCharacterFromSet:consonantSet];
        NSRange firstCharacterRange = NSMakeRange(0, [string length]);
        NSRange searchRange;
        if (firstConsonantRange.location == firstCharacterRange.location) {
            searchRange = firstConsonantRange;
        } else {
            searchRange = NSMakeRange(firstCharacterRange.location, firstConsonantRange.location+1);
        }
        
        //now i have the range of the first consonant - pull out the length to act as the index
        consonantExtractionString = [[[string substringWithRange:searchRange]stringByAppendingString:@"ay"]lowercaseString];
        [characterArray removeObjectsInRange:searchRange];
        [characterArray addObject:consonantExtractionString];
        NSString *recompileString = [characterArray componentsJoinedByString:@""];
        [workingSpace addObject:recompileString];

    }

    NSString *finalString = [workingSpace componentsJoinedByString:@" "];
    return finalString;
}

//need to trim result for punctuation so that commas get moved to the end or removed all together.


@end
