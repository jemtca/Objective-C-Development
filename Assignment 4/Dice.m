
#import "Dice.h"

@implementation Dice

- (instancetype)initWithRandomValue{
    
    self = [super init]; //self == this
    
    if(self){
        
        self.value = [self randomNumber];
        self.hold = NO;
        
    }
    
    return self;
    
}

- (NSNumber *)randomNumber{
    
    NSNumber *number = [NSNumber numberWithInt:arc4random_uniform(6) + 1]; //number between (0 - 5) then plus 1 = (1 - 6)
    
    return number;
    
}

@end
