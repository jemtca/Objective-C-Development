
#import "DeliveryService.h"

@implementation DeliveryService

- (instancetype)init{
    
    self = [super init];
    
    if(self){
        
        self.pd = [NSMutableArray new];
        
    }
    
    return self;
    
}

- (void)deliverPizza:(Pizza *)pizza{
    
    [[self pd]addObject:pizza];
    
    DeliveryCar *dc = [DeliveryCar new];
    
    [self setDelegate:dc];
    
    [dc deliverPizza:pizza];
    
}

- (NSMutableArray <Pizza *> *)pizzaDescription{
    
    return [self pd];
    
}

@end
