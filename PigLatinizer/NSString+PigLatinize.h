//
//  NSString+PigLatinize.h
//  PigLatinizer
//
//  Created by Marc Maguire on 2017-05-05.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//


//take any word in the English language and move the first consonant (or group of consonants) if they are to the end of the word, then add and an ‘ay' to the end. So if we took ‘Kale Chips' it would become ‘Alekay Ipschay'.

//need to break a sentence into individual words (use components)
//then need to loop through the array to scan each word
//need to analyze each word to find the end of the first consonant or set of consonants
//remove said group of chars and append them to the end of the word
//insert the word back into an array
//return the array
//turn the array back into a string
//return the string


#import <Foundation/Foundation.h>

@interface NSString (PigLatinize)


-(NSString *)stringByPigLatinization;


@end
