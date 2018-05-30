
#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "InputCollector.h"

@interface DoctorList : NSObject

#pragma mark - Public Properties
@property NSMutableArray <Doctor *> *doctors;

#pragma mark - Public Methods
- (instancetype)init;
- (Doctor *)getDoctor:(NSString *)name;
- (void)getDoctors;

@end
