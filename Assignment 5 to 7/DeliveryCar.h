
#import <Foundation/Foundation.h>
#import "Pizza.h"
#import "InputCollector.h"
#import "DeliveryDelegate.h"

@interface DeliveryCar : NSObject <DeliveryDelegate>

#pragma mark - Public Methods
- (void)deliverPizza:(Pizza *)pizza;

@end
