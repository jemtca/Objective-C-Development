
#import <Foundation/Foundation.h>
#import "Pizza.h"
#import "ManagerDelegate.h"
#import "DeliveryDelegate.h"

#import "DeliveryCar.h"

@interface DeliveryService : NSObject <ManagerDelegate>

#pragma mark - Public Properties
@property NSMutableArray <Pizza *> *pd;
@property (weak) id <DeliveryDelegate> delegate;

#pragma mark - Public Methods
- (instancetype)init;
- (void)deliverPizza:(Pizza *)pizza;
- (NSMutableArray <Pizza *> *)pizzaDescription;

@end
