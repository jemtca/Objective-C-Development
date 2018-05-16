
#import <Foundation/Foundation.h>

@protocol ManagerDelegate <NSObject>

#pragma mark - Public Methods
- (void)deliverPizza:(Pizza *)pizza;

@end
