//Jesús Mata Camacho

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PizzaSize){ // declaring a ENUM
    small,
    medium,
    large
};

@interface Pizza : NSObject // : == extends

#pragma mark - Public Properties
@property PizzaSize size;
@property NSMutableArray <NSString *> *toppings;

#pragma mark - Public Methods
- (instancetype) initWithSize:(PizzaSize) size andToppings:(NSMutableArray *) toppings;
+ (Pizza *) largePepperoni;
+ (Pizza *) meatLoversWithSize:(PizzaSize) size;

@end
