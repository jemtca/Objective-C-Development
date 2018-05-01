
#import <Foundation/Foundation.h>

@interface Box : NSObject //Box extends NSObject

#pragma mark - Public properties
@property float height;
@property float width;
@property float length;

#pragma mark - Public methods
- (instancetype) initWithHeight:(float)height andWidth:(float)width adnLength:(float)length;
- (float) calculateVolume;
- (int) howManyBoxInside:(Box *) box;

@end
