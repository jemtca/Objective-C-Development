
#import <Foundation/Foundation.h>
#import "InputCollector.h"

@class Doctor;
@class Patient;
@class Prescription;

@interface Patient : NSObject

#pragma mark - Public Properties
@property NSString *name;
@property NSNumber *age;
@property BOOL healthCard;

#pragma mark - Public Methods
- (instancetype)initWithName:(NSString *)name andAge:(NSNumber *)age andHealthCard:(BOOL)healthCard;
- (void)requestMedication​:(Doctor *)doctor;

@end
