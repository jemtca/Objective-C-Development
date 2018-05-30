
#import <Foundation/Foundation.h>
#import "Patient.h"
#import "InputCollector.h"

@interface PatientList : NSObject

#pragma mark - Public Properties
@property NSMutableArray <Patient *> *patients;

#pragma mark - Public Methods
- (instancetype)init;
- (Patient *)getPatient:(NSString *)name;
- (void)getPatients;

@end
