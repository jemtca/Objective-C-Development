
#import "Patient.h"
#import "Doctor.h"

@implementation Patient

- (instancetype)initWithName:(NSString *)name andAge:(NSNumber *)age andHealthCard:(BOOL)healthCard{
    
    self = [super init];
    
    if(self){
        
        self.name = name;
        self.age = age;
        self.healthCard = healthCard;
        
    }
    
    return self;
    
}

- (void)requestMedication​:(Doctor *)doctor{

    
    if([[[doctor name]lowercaseString]isEqualToString:@"doctor 1"]){
        
        [InputCollector printToPrompt:@"\nRest at home for one week."];
        
    }
    else if([[[doctor name]lowercaseString]isEqualToString:@"doctor 2"]){
        
        [InputCollector printToPrompt:@"\nTake medicine each 6 hours for four days."];
        
    }
    else if([[[doctor name]lowercaseString]isEqualToString:@"doctor 3"]){
        
        [InputCollector printToPrompt:@"\nTake medicine once a day for one week."];
        
    }
    else{
        
        [InputCollector printToPrompt:@"\nSleep more."];
        
    }

}

@end
