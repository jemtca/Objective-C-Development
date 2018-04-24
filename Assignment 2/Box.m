//Jesús Mata Camacho

#import "Box.h"

@implementation Box

#pragma mark - Constructor
- (instancetype) initWithHeight:(float)height andWidth:(float)width adnLength:(float)length{
    
    self = [super init]; // self == this
    
    if(self){
        
        self.height = height;
        self.width = width;
        self.length = length;
        
    }
    
    return self;
    
}

#pragma mark - Methods
- (float) calculateVolume{
    
    return self.height * self.width * self.length;
    
}

- (int) howManyBoxInside:(Box *) box{
    
    int count = 0;
    float totalVolume = 0;
    
    float v1 = [self calculateVolume];
    float v2 = [box calculateVolume];
    
    while(totalVolume < v1){
        
        if(v2 <= v1 && totalVolume < v1/2){
            
            count++;
            
        }
        
        totalVolume = totalVolume + v2;
        
    }
    
    return count;
    
}

@end
