
#import <Foundation/Foundation.h>
#import "Dice.h"
#import "GameController.h"
#import "InputCollector.h"

GameController *gm;

void gameSetup(){
    
    Dice *d1 = [[Dice alloc] initWithRandomValue];
    Dice *d2 = [[Dice alloc] initWithRandomValue];
    Dice *d3 = [[Dice alloc] initWithRandomValue];
    Dice *d4 = [[Dice alloc] initWithRandomValue];
    Dice *d5 = [[Dice alloc] initWithRandomValue];
    
    [[gm dice]addObject:d1];
    [[gm dice]addObject:d2];
    [[gm dice]addObject:d3];
    [[gm dice]addObject:d4];
    [[gm dice]addObject:d5];
    
}

BOOL limits(NSString *string){
    
    BOOL wrong = NO;
    
    for(int i = 0; i < [string length] && !wrong; i++){
        
        if([string characterAtIndex:i] < '1' || [string characterAtIndex:i] > '5'){
            
            wrong = YES;
            
        }
        
    }
    
    return wrong;
    
}

BOOL holdVSunhold(int count, NSMutableArray <NSNumber *> *ma){
    
    BOOL wrong = YES;
    
    if(count == 1){

        if(![[gm dice]objectAtIndex:[[ma objectAtIndex:0] unsignedIntegerValue] - 1].hold){
            
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:0] unsignedIntegerValue] -1]];
            
            wrong = NO;
        }
        
    }
    else if(count == 2){

        if(![[gm dice]objectAtIndex:[[ma objectAtIndex:0] unsignedIntegerValue] - 1].hold){
            
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:0] unsignedIntegerValue] -1]];
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:1] unsignedIntegerValue] -1]];
            
            wrong = NO;
            
        }

    }
    else if(count == 3){

        if(![[gm dice]objectAtIndex:[[ma objectAtIndex:0] unsignedIntegerValue] - 1].hold){
            
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:0] unsignedIntegerValue] -1]];
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:1] unsignedIntegerValue] -1]];
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:2] unsignedIntegerValue] -1]];
            
            wrong = NO;
            
        }

    }
    else if(count == 4){

        if(![[gm dice]objectAtIndex:[[ma objectAtIndex:0] unsignedIntegerValue] - 1].hold){
            
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:0] unsignedIntegerValue] -1]];
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:1] unsignedIntegerValue] -1]];
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:2] unsignedIntegerValue] -1]];
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:3] unsignedIntegerValue] -1]];
            
            wrong = NO;
            
        }

    }
    else if(count == 5){

        if(![[gm dice]objectAtIndex:[[ma objectAtIndex:0] unsignedIntegerValue] - 1].hold){
            
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:0] unsignedIntegerValue] -1]];
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:1] unsignedIntegerValue] -1]];
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:2] unsignedIntegerValue] -1]];
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:3] unsignedIntegerValue] -1]];
            [gm holdDie:[[gm dice]objectAtIndex:[[ma objectAtIndex:4] unsignedIntegerValue] -1]];
            
            wrong = NO;
            
        }

    }
    
    return wrong;
    
}

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        gm = [GameController new];
        NSString *input;
        NSInteger round = 0;
        BOOL exit;
        BOOL newGame;
        
        gameSetup();
        
        do{
            
            input = [InputCollector inputForPrompt:@">"];
            
            if([[input lowercaseString]isEqualToString:@"roll"]){
                
                if(round > 0){
                    
                    for(int i = 0; i < [[gm dice] count]; i++){
                        
                        if(![[gm dice]objectAtIndex:i].hold){
                            
                            Dice *new = [[Dice alloc] initWithRandomValue];
                            [[gm dice]replaceObjectAtIndex:i withObject:new];
                            
                        }
                        
                    }
                    
                }
                
                [InputCollector printToPrompt:[NSString stringWithFormat:@"\n[Round %ld]", ++round]];
                [gm printDice];
                
                do{
                    
                    exit = YES;
                    newGame = NO;
                    
                    input = [InputCollector inputForPrompt:@"Any dice to hold/un-hold: "];
                    
                    NSScanner* scan = [NSScanner scannerWithString:input];
                    
                    if([scan scanInt:nil] && [scan isAtEnd]){ //only numbers
                        
                        //only numbers between 1 and 5
                        //string can not be bigger than 5
                        if(!limits(input) && [input length] < 6){
                        
                            NSString *temp = input;
                            
                            NSMutableArray <NSNumber *> *array2 = [NSMutableArray new];
                            
                            int count = 0;
                        
                            for(int i = 0; i < [input length]; i++){
                            
                                if(i == 0){
                                    count++;
                                    
                                    [array2 addObject:[NSNumber numberWithInt:[[temp substringToIndex:1]intValue]]];
                                    
                                    temp = [temp substringFromIndex:1];
                                }
                                else if(i == 1){
                                    count++;
                                    
                                    [array2 addObject:[NSNumber numberWithInt:[[temp substringToIndex:1]intValue]]];
                                    
                                    temp = [temp substringFromIndex:1];
                                }
                                else if(i == 2){
                                    count++;
                                    
                                    [array2 addObject:[NSNumber numberWithInt:[[temp substringToIndex:1]intValue]]];
                                    
                                    temp = [temp substringFromIndex:1];
                                }
                                else if(i == 3){
                                    count++;
                                    
                                    [array2 addObject:[NSNumber numberWithInt:[[temp substringToIndex:1]intValue]]];
                                    
                                    temp = [temp substringFromIndex:1];
                                }
                                else if(i == 4){
                                    count++;
                                    
                                    [array2 addObject:[NSNumber numberWithInt:[[temp substringToIndex:1]intValue]]];
                                    
                                    temp = [temp substringFromIndex:1];
                                }
                            
                            }//for
                            
                            if(!holdVSunhold(count,array2)){ //YES if wrong, NO otherwise
                                
                                exit = NO;
                                
                            }
                            
                            //end of the game -> winning!
                            if((round == 5 && [[gm heldDice] count] == 5) || [[gm heldDice] count] == 5){
                                    
                                int total = 0;
                                    
                                for(int i = 0; i < [[gm heldDice] count]; i++){
                                        
                                    if([[[gm heldDice] objectAtIndex:i].value intValue] == 3){
                                            
                                        total = total;
                                            
                                    }
                                    else{
                                            
                                        total = total + [[[gm heldDice] objectAtIndex:i].value intValue];
                                            
                                    }
                                        
                                }
                                    
                                [InputCollector printToPrompt:[NSString stringWithFormat:@"\n[Round %ld]", round]];
                                [gm printDice];
                                    
                                [InputCollector printToPrompt:[NSString stringWithFormat:@"Score: %d", total]];
                                
                                [InputCollector printToPrompt:@"\nStarting new game...\n"];
                                
                                exit = NO;
                                newGame = YES;
                                round = 0;
                                [[gm heldDice] removeAllObjects];
                                [gm resetDice];
                                
                                for(int i = 0; i < [[gm dice] count]; i++){
                                        
                                    if(![[gm dice]objectAtIndex:i].hold){
                                            
                                        Dice *new = [[Dice alloc] initWithRandomValue];
                                        [[gm dice]replaceObjectAtIndex:i withObject:new];
                                            
                                    }
                                        
                                }
                                
                            }
                            
                            //end of the game -> losing
                            if((round == 5 && [[gm heldDice] count] != 5)){
                                
                                [InputCollector printToPrompt:[NSString stringWithFormat:@"\n[Round %ld]", round]];
                                [gm printDice];
                                
                                [InputCollector printToPrompt:@"Game Over!"];
                                
                                [InputCollector printToPrompt:@"\nStarting new game...\n"];
                                
                                exit = NO;
                                newGame = YES;
                                round = 0;
                                [[gm heldDice] removeAllObjects];
                                [gm resetDice];
                                
                                for(int i = 0; i < [[gm dice] count]; i++){
                                    
                                    if(![[gm dice]objectAtIndex:i].hold){
                                        
                                        Dice *new = [[Dice alloc] initWithRandomValue];
                                        [[gm dice]replaceObjectAtIndex:i withObject:new];
                                        
                                    }
                                    
                                }
                            
                            }
                            
                        }//limits and length
                        
                    }//only numbers
                    
                }while(exit);
                
                if(!newGame){
                    
                    [InputCollector printToPrompt:[NSString stringWithFormat:@"\n[Round %ld]", round]];
                    [gm printDice];
                
                }
                
            }
            else if([[input lowercaseString]isEqualToString:@"reset"]){
                
                if(round > 0){
                    
                    [gm resetDice];
                    [InputCollector printToPrompt:[NSString stringWithFormat:@"\n[Round %ld]", round]];
                    [gm printDice];
                
                }
                else{
                    
                    [InputCollector printToPrompt:@"\nThe game haven't started yet.\n"];
                    
                }
                
            }
            else if(![[input lowercaseString]isEqualToString:@"quit"]){
                
                [InputCollector printToPrompt:@"\nWrong command, try it again!\n"];
                
            }
        
        }while(![[input lowercaseString]isEqualToString:@"quit"]);
        
    }
    
    return 0;
}
