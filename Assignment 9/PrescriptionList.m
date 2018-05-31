
#import "PrescriptionList.h"
#import "Doctor.h"
#import "Patient.h"

@implementation PrescriptionList

- (instancetype)init{
    
    self = [super init];
    
    if(self){
        
        self.prescriptions = [[NSMutableArray alloc] init];
        
    }
    
    return self;
    
}

- (NSMutableArray<Doctor *> *)getDoctors:(NSString *)patient{
    
    NSMutableArray *doctors = [NSMutableArray new];
    
    for(int i = 0; i < [[self prescriptions] count]; i++){
        
        if([[[[[[self prescriptions]objectAtIndex:i]patient]name]lowercaseString]isEqualToString:patient]){

            [doctors addObject:[[[self prescriptions]objectAtIndex:i]doctor]];
            
        }
        
    }
    
    return doctors;
    
}

- (NSMutableArray<NSString *> *)getPresPrescription:(NSString *)patient{
    
    NSMutableArray *prescriptions = [NSMutableArray new];
    
    for(int i = 0; i < [[self prescriptions] count]; i++){
        
        if([[[[[[self prescriptions]objectAtIndex:i]patient]name]lowercaseString]isEqualToString:patient]){
            
            [prescriptions addObject:[[[self prescriptions]objectAtIndex:i]prescription]];
            
        }
        
    }
    
    return prescriptions;
    
}

- (NSMutableArray<NSString *> *)getPresPrescriptions{
    
    NSMutableArray *prescriptions = [NSMutableArray new];
    
    for(int i = 0; i < [[self prescriptions] count]; i++){
        
        [prescriptions addObject:[[[self prescriptions]objectAtIndex:i]prescription]];
        
    }
    
    return prescriptions;
    
}

@end
