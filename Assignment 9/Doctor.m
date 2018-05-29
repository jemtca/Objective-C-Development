
#import "Doctor.h"
#import "Patient.h"

@implementation Doctor

- (instancetype)initWithName:(NSString *)name andSpecialization:(NSString *)specialization{
    
    self = [super init];
    
    if(self){
        
        self.name = name;
        self.specialization = specialization;
        self.patientsWithHCC = [[NSMutableArray alloc] init];
        
    }
    
    return self;
    
}

- (BOOL)patientWithHCC:(Patient *)patient{
    
    return [patient healthCard] ? YES : NO;
    
}

- (void)getPatientsWithHCC{

    NSString *hc;

    [InputCollector printToPrompt:@""];

    for(Patient *p in [self patientsWithHCC]){

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
