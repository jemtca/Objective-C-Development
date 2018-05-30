
#import "DoctorList.h"

@implementation DoctorList

- (instancetype)init{
    
    self = [super init];
    
    if(self){
        
        self.doctors = [[NSMutableArray alloc] init];
        
    }
    
    return self;

}

- (Doctor *)getDoctor:(NSString *)name{
    
    Doctor *d = nil;
    BOOL found = NO;
    
    for(int i = 0; i < [[self doctors]count] && !found; i++){
        
        if([[[[[self doctors]objectAtIndex:i] name]lowercaseString]isEqualToString:name]){
            
            d = [[self doctors]objectAtIndex:i];
            found = YES;
            
        }
        
    }
    
    return d;
    
}

- (void)getDoctors{
    
    [InputCollector printToPrompt:@""];
    
    for(Doctor *c in [self doctors]){
        
        [InputCollector printToPrompt:[NSString stringWithFormat:
                                       @"Name: %@", [c name]]];
        
        [InputCollector printToPrompt:[NSString stringWithFormat:
                                       @"Specialization: %@", [c specialization]]];
        
        [InputCollector printToPrompt:@""];
        
    }
    
}

@end
