
#import "Prescription.h"

@implementation Prescription

- (instancetype)initWithPrescription:(NSString *)prescription andDoctor:(Doctor *)doctor andPatient:(Patient *)patient{
    
    self = [super init];
    
    if(self){
        
        self.prescription = prescription;
        self.doctor = doctor;
        self.patient = patient;
        
    }
    
    return self;
    
}

@end
