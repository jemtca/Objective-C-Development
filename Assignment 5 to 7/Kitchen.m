
#import "Kitchen.h"

@implementation Kitchen

- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSMutableArray *)toppings{ //NSarray
    
    return [[Pizza alloc]initWithSize:large andToppings:toppings];

}

- (Pizza *)makePepperoniPizza{
    
    return [Pizza largePepperoni];
    
}

- (Pizza *)makeMeatLoversPizzaWithSize:(PizzaSize)size{
    
    return [Pizza meatLoversWithSize:(size)];
    
}

@end
