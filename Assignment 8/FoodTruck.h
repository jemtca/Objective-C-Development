
#import <Foundation/Foundation.h>
#import "FoodTruckDelegate.h"

@interface FoodTruck : NSObject

#pragma mark - Public Properties
@property (nonatomic, weak) id <FoodTruckDelegate> delegate;

#pragma mark - Public Methods
- (instancetype) initWithName:(NSString *)pun andFoodType:(NSString *)foodType;
- (void) serve:(int)orders;
- (void) cashOut;

@end
