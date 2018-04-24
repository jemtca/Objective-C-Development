//Jesús Mata Camacho

#import "Box.h"

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        int x;
        Box *box1 = [[Box alloc] initWithHeight:10 andWidth:10 adnLength:10];
        
        float height, width, length;
        
        printf("Type the height of the box: ");
        scanf("%f", &height);
        
        printf("Type the width of the box: ");
        scanf("%f", &width);
        
        printf("Type the length of the box: ");
        scanf("%f", &length);
        
        Box *box2 = [[Box alloc] initWithHeight:height andWidth:width adnLength:length];
        
        printf("Volume of the box 1: %0.2f\n", [box1 calculateVolume]);
        printf("Volume of the box 2: %0.2f\n", [box2 calculateVolume]);
        
        x = [box1 howManyBoxInside:box2];
        
        printf("%d box/boxes inside of the box 1.\n", x);
        
    }
    
    return 0;
}
