
#import "GameController.h"

@implementation GameController

- (instancetype)init{
    
    self = [super init]; //self == this
    
    if(self){
        
        self.dice = [[NSMutableArray alloc] init];
        self.heldDice = [NSMutableArray new];
        
    }
    
    return self;
    
}

- (void)holdDie:(Dice *) die{
    
        NSUInteger index = [[self dice] indexOfObject:die];
    
        if(![[self dice] objectAtIndex:index].hold){
            
            [[self dice] objectAtIndex:index].hold = YES; //un-held to held
            [[self heldDice]addObject:die];
        
        }
        else{
            
            [[self dice] objectAtIndex:index].hold = NO; //held to un-held
            [[self heldDice]removeObject:die];
            
        }
    
}

- (void) printDice{
    
    int i = 1;
    
    for(Dice *d in [self dice]){
        
        if(!d.hold){ //hold == NO
            
            [InputCollector printToPrompt:[NSString stringWithFormat:@"Dice %d: %@", i, [[d value] stringValue]]];
            
        }
        else{ //hold == YES
            
            [InputCollector printToPrompt:[NSString stringWithFormat:@"Dice %d: [%@]", i, [[d value] stringValue]]];
            
        }
        
        i++;
        
    }
    
    [InputCollector printToPrompt:@""];
    
}

- (void)resetDice{

    for(int i = 0; i < [[self dice] count]; i++){

        if([[self dice]objectAtIndex:i].hold){

            [[self dice]objectAtIndex:i].hold = NO;

        }

    }
    
    [[self heldDice] removeAllObjects];

}

@end
