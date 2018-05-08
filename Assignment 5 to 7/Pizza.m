//Jesús Mata Camacho

#import "Pizza.h"

@implementation Pizza

- (instancetype)initWithSize:(PizzaSize)size andToppings:(NSMutableArray *)toppings{
    
    self = [super init];
    
    if(self){

        self.size = size;
        self.toppings = toppings;
        
    }
    
    return self;
    
}

+ (Pizza *)largePepperoni{
    
    
    NSMutableArray <NSString *> *toppings = [NSMutableArray new];
    
    [toppings addObject:@"tomato"];
    [toppings addObject:@"cheese"];
    [toppings addObject:@"oregano"];
    [toppings addObject:@"pepperoni"];
    
    Pizza * p = [[Pizza alloc] initWithSize:(2) andToppings:(toppings)];
    
    return p;
    
}

+ (Pizza *)meatLoversWithSize:(PizzaSize)size{
    
    NSMutableArray <NSString *> *toppings = [NSMutableArray new];
    
    [toppings addObject:@"tomato"];
    [toppings addObject:@"cheese"];
    [toppings addObject:@"oregano"];
    [toppings addObject:@"pepperoni"];
    [toppings addObject:@"bacon"];
    [toppings addObject:@"jam"];
    
    Pizza *p = [[Pizza alloc] initWithSize:size andToppings:toppings];
    
    return p;
    
}

@end
