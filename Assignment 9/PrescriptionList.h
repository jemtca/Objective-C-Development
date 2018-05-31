
#import <Foundation/Foundation.h>
#import "Prescription.h"
#import "InputCollector.h"

@interface PrescriptionList : NSObject

#pragma mark - Public Properties
@property NSMutableArray <Prescription *> *prescriptions;

#pragma mark - Public Methods
- (instancetype)init;
- (NSMutableArray <Doctor *> *)getDoctors:(NSString *)patient;
- (NSMutableArray <NSString *> *)getPresPrescription:(NSString *)patient;
- (NSMutableArray <NSString *> *)getPresPrescriptions;

@end
