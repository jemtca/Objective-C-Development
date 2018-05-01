
#import <Foundation/Foundation.h>
#import "Contact.h"
#import "InputCollector.h"

@interface ContactList : NSObject //: == extends

#pragma mark - Public Properties
@property NSMutableArray <Contact *> *contactList;

#pragma mark - Public Methods
- (instancetype) init;
- (void) addContact:(Contact *) newContact;
- (void) printContactList;

@end
