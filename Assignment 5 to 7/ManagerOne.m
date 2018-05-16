
#import "ManagerOne.h"

@implementation ManagerOne

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings{ //NSMutableArray?
    
    BOOL anchovies = NO;
    
    for(int i = 0; i < [toppings count] && !anchovies; i++){
        
        if([[[toppings objectAtIndex:i]lowercaseString]isEqualToString:@"anchovies"]){
            
            anchovies = YES;
            
        }
        
    }
    
    return !anchovies;
    
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen{
    
    return NO; //this manager does not upgrade orders
    
}

@end
