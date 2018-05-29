
#import <Foundation/Foundation.h>
#import "InputCollector.h"

@class Patient;

@interface Doctor : NSObject

#pragma mark - Public Properties
@property NSString *name;
@property NSString *specialization;
@property NSMutableArray <Patient *> *patientsWithHCC;

#pragma mark - Public Methods
- (instancetype)initWithName:(NSString *)name andSpecialization:(NSString *)specialization;
- (BOOL)patientWithHCC:(Patient *)patient;
- (void)getPatientsWithHCC;

@end
