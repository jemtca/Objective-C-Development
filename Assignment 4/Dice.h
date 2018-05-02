
#import <Foundation/Foundation.h>

@interface Dice : NSObject // : == extends

#pragma mark - Public Properties
@property NSNumber *value; //random number between one and six
@property BOOL hold; //YES if it is hold, NO otherwise

#pragma mark - Public Methods
- (instancetype) initWithRandomValue;
- (NSNumber *) randomNumber;

@end
