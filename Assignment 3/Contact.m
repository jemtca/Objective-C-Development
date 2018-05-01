
#import "Contact.h"

@implementation Contact

- (instancetype)initWithName:(NSString *)name andLastName:(NSString *)lastName
              andPhoneNumber:(NSString *)phoneNumber andEmail:(NSString *) email{
    
    self = [super init]; //self == this
    
    if(self){
        
        self.name = name;
        self.lastName = lastName;
        self.phoneNumber = phoneNumber;
        self.email = email;
        
    }
    
    return self;
    
}

- (NSString *) getContactDetails{
    
    NSString *details = [NSString stringWithFormat:@"Name: %@ \nLast name: %@ \nPhone number: %@ \nEmail: %@\n",
                          [self name], [self lastName], [self phoneNumber], [self email]];
    
    return details;
    
}

@end
