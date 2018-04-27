//Jesús Mata Camacho

#import <Foundation/Foundation.h>

@interface Contact : NSObject //: == extends

#pragma mark - Public Properties
@property NSString *name;
@property NSString *lastName;
@property NSString *phoneNumber;
@property NSString *email;

#pragma mark - Public Methods
- (instancetype) initWithName:(NSString *) name andLastName:(NSString *) lastName
               andPhoneNumber:(NSString *) phoneNumber andEmail:(NSString *) email;
- (NSString *) getContactDetails;

@end
