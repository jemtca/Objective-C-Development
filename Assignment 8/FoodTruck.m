
#import "FoodTruck.h"
#import "InputCollector.h"

@interface FoodTruck ()

#pragma mark - Private Properties
@property (nonatomic, assign) float earnings;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *foodType;

@end

@implementation FoodTruck

-(instancetype)initWithName:(NSString *)pun andFoodType:(NSString *)foodType {
    
    self = [super init];
    
    if (self) {
        
        self.name = pun;
        self.foodType = foodType;
        
    }
    
    return self;
    
}


-(void)serve:(int)orders {
    
    double price = [self.delegate foodTruck:self priceForFood:self.foodType];
    
    [InputCollector printToPrompt:[NSString stringWithFormat:@"[Welcome to %@]", self.name]];
    [InputCollector printToPrompt:[NSString stringWithFormat:@"We serve %@ for $%0.2f",
                                   self.foodType, price]];
    [InputCollector printToPrompt:@""];
    
    
    self.earnings += orders * price;
    
}

-(void)cashOut {
    
    [InputCollector printToPrompt:[NSString stringWithFormat:@"%@ earned %0.2f today!",
                                   self.name, self.earnings]];
    
}

@end
