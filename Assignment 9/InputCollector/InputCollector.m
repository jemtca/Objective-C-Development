// InputCollector.m

#import "InputCollector.h"

@implementation InputCollector

+ (NSString *)inputForPrompt:(NSString *)promptString {
    
    char option[255];
    //NSLog(@"%@",promptString);
    printf("%s", [promptString UTF8String]);
    fgets(option, 255, stdin); //add "\n" at the end of the string
    
    NSString *textTyped = [NSString stringWithUTF8String:option]; //char -> NSString
    NSString *text = [textTyped stringByReplacingOccurrencesOfString:@"\n" withString:@""]; //delete "\n" from the input
    
    return text;
}

+ (void)printToPrompt:(NSString *)promptString {

    //NSLog(@"%@",promptString);
    printf("%s\n", [promptString UTF8String]);
    
}

@end
