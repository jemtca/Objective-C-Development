
#import <Foundation/Foundation.h>

@class Kitchen;

@protocol KitchenDelegate <NSObject>

#pragma mark - Public Methods
- (BOOL) kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings; //NSMutableArray

- (BOOL) kitchenShouldUpgradeOrder:(Kitchen *)kitchen;

@optional
- (void) kitchenDidMakePizza:(Pizza *)pizza;

@end
