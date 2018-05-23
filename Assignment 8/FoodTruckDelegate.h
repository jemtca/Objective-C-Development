
#import <Foundation/Foundation.h>

@class FoodTruck;

@protocol FoodTruckDelegate <NSObject>

- (double)foodTruck:(FoodTruck *)truck priceForFood:(NSString *)food;

@end
