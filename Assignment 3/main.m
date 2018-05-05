//Jesús Mata Camacho

#import "Contact.h"
#import "ContactList.h"
#import "InputCollector.h"

ContactList *cl;

void test(){
    
//    NSString *x;
//
//    x = [InputCollector inputForPrompt:@"Input: "];
//    [InputCollector printToPrompt:x];
    
}

//adding some contacts to the NSMutableArray
void addingSomeContacts(){
    
    Contact *c1 = [Contact new];
    Contact *c2 = [Contact new];
    Contact *c3 = [Contact new];
    Contact *c4 = [Contact new];
    
    c1 = [c1 initWithName:@"c1 name" andLastName:@"c1 last name"
           andPhoneNumber:@"00000000001" andEmail:@"c1@email.com"];
    c2 = [c2 initWithName:@"c2 name" andLastName:@"c2 last name"
           andPhoneNumber:@"00000000002" andEmail:@"c2@email.com"];
    c3 = [c3 initWithName:@"c3 name" andLastName:@"c3 last name"
           andPhoneNumber:@"00000000003" andEmail:@"c3@email.com"];
    c4 = [c4 initWithName:@"c4 name" andLastName:@"c4 last name"
           andPhoneNumber:@"00000000004" andEmail:@"c4@email.com"];
    
    [cl addContact:c1];
    [cl addContact:c2];
    [cl addContact:c3];
    [cl addContact:c4];
    
}

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        cl = [ContactList new]; //[X new] == [[X alloc] init]

        NSString *input;
        NSMutableArray *history = [NSMutableArray new];
        
        addingSomeContacts();
        
        do{
            
            [InputCollector printToPrompt:@"What would you like to do next?"];
            [InputCollector printToPrompt:@"\nnew - Create a new contact."];
            [InputCollector printToPrompt:@"list - List all contacts."];
            [InputCollector printToPrompt:@"bonus - Hide commands."];
            [InputCollector printToPrompt:@"quit - Exit Application."];
            
            input = [InputCollector inputForPrompt:@"\nChoose an option: "];
            
            if([history count] <= 3 && ![[input lowercaseString] isEqualToString:@"history"]){
                
                if([history count] + 1 == 1){
                    
                    [history addObject:input];
                    
                }
                else if([history count] + 1 == 2){
                    
                    [history addObject:input];
                    
                }
                else if([history count] + 1 == 3){
                    
                    [history addObject:input];
                    
                }
                else if([history count] + 1 == 4){
                    
                    [history removeObjectAtIndex:0];
                    [history addObject:input];
                    
                }
            }
            
            if([[input lowercaseString]isEqualToString:@"new"]){
                
                NSString *name, *lastName, *phoneNumber, *email;
                Contact *c = [Contact new];
                
                email = [InputCollector inputForPrompt:@"\nType email: "];
                
                NSPredicate *p =[NSPredicate predicateWithFormat:@"(email like %@)", email];
                NSArray *contactsFiltered = [[cl contactList] filteredArrayUsingPredicate:p];
                
                if([contactsFiltered count] == 0){ //empty contactsFiltered == contact not found
                    
                    name = [InputCollector inputForPrompt:@"Type name: "];
                    lastName = [InputCollector inputForPrompt:@"Type last name: "];
                    do{
                        phoneNumber = [InputCollector inputForPrompt:@"Type phone number (11 digits and the first one must to be 0): "];
                    }while([phoneNumber characterAtIndex:0] != '0' || [phoneNumber length] != 11);
                    
                    [InputCollector printToPrompt:@""];
                    
                    c = [c initWithName:name andLastName:lastName andPhoneNumber:phoneNumber andEmail:email];
                    
                    [cl addContact:c];
                    
                }
                else{
                    
                    [InputCollector printToPrompt:@"\nThe contact exists already.\n"];
                    
                }
                
            }
            else if([[input lowercaseString]isEqualToString:@"list"]){
                
                [cl printContactList];
                
            }
            else if([[[input lowercaseString]substringToIndex:4]isEqualToString:@"show"]){
                
                if([[input lowercaseString]isEqualToString:@"show"]){
                    
                    [InputCollector printToPrompt:@"\nYou haven't typed any index.\n"];
                    
                }
                else if([input characterAtIndex:4] != ' '){
                    
                    [InputCollector printToPrompt:@"\nIt should be a space between 'show' and the index you are looking for.\n"];
                    
                }
                else{
                    
                    NSString *temp = [input substringFromIndex:5];
                    NSScanner* scan = [NSScanner scannerWithString:temp];
                    
                    if([scan scanInt:nil] && [scan isAtEnd]){ //only numbers
                        
                        NSInteger myInt = [temp integerValue]; //NSString to NSInteger
                        
                        if(myInt > 0 && myInt <= [[cl contactList] count]){ //right index
                            
                            Contact *contact = [[cl contactList] objectAtIndex:myInt - 1];
                            [InputCollector printToPrompt:[contact getContactDetails]];
                            
                        }
                        else{
                            
                            [InputCollector printToPrompt:@"\nIt doesn't exist a contact at the position you have typed.\n"];
                            
                        }
                    
                    }
                    else{
                        
                        printf("\nThe index you have typed is not a number.\n\n");
                        
                    }
                    
                }
                
            }
            else if([[[input lowercaseString]substringToIndex:4]isEqualToString:@"find"]){
                
                if([[input lowercaseString]isEqualToString:@"find"]){
                    
                    [InputCollector printToPrompt:@"\nYou haven't typed any word to look for.\n"];
                    
                }
                else if([input characterAtIndex:4] != ' '){
                    
                    [InputCollector printToPrompt:@"\nIt should be a space between 'find' and the word you are looking for.\n"];
                    
                }
                else{
                    
                    NSString *temp = [input substringFromIndex:5];
                    NSPredicate *p = [NSPredicate predicateWithFormat:@"email contains[cd] %@ or name contains[cd] %@", temp, temp];
                    NSArray *contactsFiltered = [[cl contactList] filteredArrayUsingPredicate:p];
                    
                    if([contactsFiltered count] != 0){
                        
                        [InputCollector printToPrompt:@""];
                        
                        for(int i = 0; i < [contactsFiltered count]; i++){
                            
                            Contact *c =[contactsFiltered objectAtIndex:i];
                            
                            [InputCollector printToPrompt:[NSString stringWithFormat:@"[Result number %d]", i + 1]];
                            [InputCollector printToPrompt:[c getContactDetails]];
                            
                        }
                        
                    }
                    else{
                        
                        [InputCollector printToPrompt:@"\nNothing have been found.\n"];
                        
                    }
                    
                }
                
            }
            else if([[input lowercaseString]isEqualToString:@"history"]){
                
                if([history count] == 0){
                    
                    [InputCollector printToPrompt:@"\nHistory hasn't been generated yet.\n"];
                    
                }
                else{
                    
                    [InputCollector printToPrompt:@"\n[History]"];
                
                    for(int i = 0; i < [history count]; i++){
                    
                        [InputCollector printToPrompt:[history objectAtIndex:i]];
                
                    }
                
                    [InputCollector printToPrompt:@""];
                
                }
                
            }
            else if([[input lowercaseString]isEqualToString:@"bonus"]){
                
                [InputCollector printToPrompt:@"\nYou also can use show, find and history commands.\n"];
                
            }
            else if(![[input lowercaseString]isEqualToString:@"quit"]){
                
                [InputCollector printToPrompt:@"\nYou have typed a wrong option, try it again.\n"];
                
            }
            
        }while(![[input lowercaseString]isEqualToString:@"quit"]);
        
    }
    
    return 0;
}
