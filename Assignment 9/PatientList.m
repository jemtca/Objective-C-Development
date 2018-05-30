
#import "PatientList.h"

@implementation PatientList

- (instancetype)init{
    
    self = [super init];
    
    if(self){
        
        self.patients = [[NSMutableArray alloc] init];
        
    }
    
    return self;
    
}

- (Patient *)getPatient:(NSString *)name{
    
    Patient *p = nil;
    BOOL found = NO;
    
    for(int i = 0; i < [[self patients]count] && !found; i++){
        
        if([[[[[self patients]objectAtIndex:i] name]lowercaseString]isEqualToString:name]){
            
            p = [[self patients]objectAtIndex:i];
            found = YES;
            
        }
        
    }
    
    return p;
    
}

- (void)getPatients{
    
        NSString *hc;
    
    [InputCollector printToPrompt:@""];
    
    for(Patient *p in [self patients]){
        
        [InputCollector printToPrompt:[NSString stringWithFormat:@"Name: %@", [p name]]];
        [InputCollector printToPrompt:[NSString stringWithFormat:@"Age: %@", [p age]]];
        
        if([p healthCard]){
            
            hc = @"Yes";
            
        }
        else{
            
            hc = @"No";
            
        }
        
        [InputCollector printToPrompt:[NSString stringWithFormat:@"Health care: %@", hc]];
        
        [InputCollector printToPrompt:@""];
    
    }
    
}

@end
