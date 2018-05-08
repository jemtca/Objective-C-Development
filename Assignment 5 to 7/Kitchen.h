//Jesús Mata Camacho

#import <Foundation/Foundation.h>
#import "Pizza.h"
#import "KitchenDelegate.h"

@interface Kitchen : NSObject // : == extends

#pragma mark - Public Properties
@property (weak) id <KitchenDelegate> delegate;

#pragma mark - Public Methods
- (Pizza *)makePizzaWithSize:(PizzaSize)size toppings:(NSMutableArray *)toppings; //NSArray
- (Pizza *)makePepperoniPizza;
- (Pizza *)makeMeatLoversPizzaWithSize:(PizzaSize) size;

@end
