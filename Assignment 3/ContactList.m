
#import "ContactList.h"

@implementation ContactList

- (instancetype)init{
    
    self = [super init]; //self == this
    
    if(self){
        
        self.contactList = [NSMutableArray new]; //[NSMutableArray new] == [[NSMutableArray alloc] init]
        
    }
    
    return self;
    
}

- (void) addContact:(Contact *)newContact{
    
    [[self contactList] addObject:newContact]; //ask Rodrigo: _contactList
    
}

- (void) printContactList{
    
    int i = 1;
    
    [InputCollector printToPrompt:@""];
    
    for(Contact *temp in [self contactList]){
        
        [InputCollector printToPrompt:[NSString stringWithFormat:@"[Contact %d]", i]];
        [InputCollector printToPrompt:[NSString stringWithFormat:@"%@", [temp getContactDetails]]];
        i++;
        
    }
    
}

@end
