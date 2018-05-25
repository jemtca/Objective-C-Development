
#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "CookOne.h"
#import "CookTwo.h"
#import "FoodTruck.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        CookOne *c1 = [CookOne new];
        CookTwo *c2 = [CookTwo new];
        
        FoodTruck *truckA = [[FoodTruck alloc] initWithName:@"Take a Bao" andFoodType:@"bao"];
        FoodTruck *truckB = [[FoodTruck alloc] initWithName:@"Tim Shortons" andFoodType:@"shortbread"];
        
        // create instances of your delegate class
        // set truckA and truckB's delegate to your new instance.
        
        [truckA setDelegate:c1];
        [truckB setDelegate:c2];
        
        [truckA serve:10];
        [truckB serve:5];
        
        [truckA cashOut];
        [truckB cashOut];
        
    }
    
    return 0;

}
