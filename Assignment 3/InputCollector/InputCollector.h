// InputCollector.h

#import <Foundation/Foundation.h>

@interface InputCollector : NSObject //: == extends

+ (NSString *)inputForPrompt:(NSString *)promptString; //use the name of the class to invoke this method

+ (void)printToPrompt:(NSString *)promptString; //use the name of the class to invoke this method

@end
