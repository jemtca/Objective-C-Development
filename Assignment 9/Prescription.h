
#import <Foundation/Foundation.h>

@class Doctor;
@class Patient;

@interface Prescription : NSObject

#pragma mark - Public Properties
@property NSString *prescription;
@property Doctor *doctor;
@property Patient *patient;

#pragma mark - Public Methods
- (instancetype)initWithPrescription:(NSString *)prescription andDoctor:(Doctor *)doctor andPatient:(Patient *)patient;

@end
