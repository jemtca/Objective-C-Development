
#import "InputCollector.h"
#import "ManagerTwo.h"

@implementation ManagerTwo

- (BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings{ //NSMutableArray?
    
    return YES;
    
}

- (BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen{
    
    return YES;
    
}

- (void) kitchenDidMakePizza:(Pizza *)pizza{
    
    [InputCollector printToPrompt:@"kitchenDidMakePizza method works!"];
    
}

@end
