
#import <Foundation/Foundation.h>
#import "Kitchen.h"
#import "KitchenDelegate.h"
#import "ManagerDelegate.h"

@interface ManagerTwo : NSObject <KitchenDelegate>

#pragma mark - Public Properties
@property (weak) id <ManagerDelegate> delegate;

@end
