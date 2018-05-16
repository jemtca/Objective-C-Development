
#import <Foundation/Foundation.h>

@protocol DeliveryDelegate <NSObject>

#pragma mark - Public Methods
- (void)deliverPizza:(Pizza *)pizza;

@end
