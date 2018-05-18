
#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Kitchen.h"
#import "ManagerOne.h"
#import "ManagerTwo.h"
#import "DeliveryService.h"

DeliveryService *ds;

int getSize(NSString *s){
    
    int result = -1;
    
    if([s isEqualToString:@"small"]){
        
        result = 0;
        
    }
    else if([s isEqualToString:@"medium"]){
        
        result = 1;
        
    }
    else{
        
        result = 2;
        
    }
    
    return result;
    
}

NSMutableArray* pepperoni(){
    
    NSMutableArray <NSString *> *pepperoni = [NSMutableArray new];
    
    [pepperoni addObject:@"tomato"];
    [pepperoni addObject:@"cheese"];
    [pepperoni addObject:@"oregano"];
    [pepperoni addObject:@"pepperoni"];
    
    return pepperoni;
    
}

NSMutableArray* meatLovers(){
    
    NSMutableArray <NSString *> *meatLovers = [NSMutableArray new];
    
    [meatLovers addObject:@"tomato"];
    [meatLovers addObject:@"cheese"];
    [meatLovers addObject:@"oregano"];
    [meatLovers addObject:@"pepperoni"];
    [meatLovers addObject:@"bacon"];
    [meatLovers addObject:@"jam"];
    
    return meatLovers;
    
}

void checkM1(ManagerOne *m, Pizza *p){
    
    SEL selector = @selector(kitchenDidMakePizza:);
    BOOL respond = [m respondsToSelector:selector];
    
    if (respond) { //respond is false because the method is not implemented
        
        [m kitchenDidMakePizza:p];
        [InputCollector printToPrompt:@"Implements kitchenDidMakePizza!"];
        
        //manager1 doesn't have delivery service because the code will never reach this block
        
    }
    else {
        
        [InputCollector printToPrompt:@"Does NOT implements kitchenDidMakePizza!"];
        
    }
    
}

void checkM2(ManagerTwo *m, Pizza *p){
    
    SEL selector = @selector(kitchenDidMakePizza:);
    BOOL respond = [m respondsToSelector:selector];
    
    if (respond) { //respond is true because the method is implemented
        
        [m kitchenDidMakePizza:p];
        //[InputCollector printToPrompt:@"Implements kitchenDidMakePizza!"];
        
        //manager2 has delivery service because the code reachs this block
        
        [m setDelegate:ds];
        
        [m.delegate deliverPizza:p];
        
    }
    else {
        
        [InputCollector printToPrompt:@"Does NOT implements kitchenDidMakePizza!"];
        
    }
    
}

void orderHistory(NSMutableArray <Pizza *> *pd){

    int o = 0;
    
    for(Pizza *p in pd){

        NSString *size;

        if([p size] == 0){

            size = @"small";

        }
        else if([p size] == 1){

            size = @"hola";

        }
        else if([p size] == 2){

            size = @"large";

        }
        
        o++;
        
        [InputCollector printToPrompt:[NSString stringWithFormat:@"[Order %d]", o]];
        
        [InputCollector printToPrompt:[NSString stringWithFormat:@"Pizza size: %@", size]];
        
        int i = 1;

        for(NSString *s in [p toppings]){

            [InputCollector printToPrompt:[NSString stringWithFormat:@"Topping %d: %@",i++,s]];

        }
        
        [InputCollector printToPrompt:@""];

    }
        
}

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        NSMutableArray <NSString *> *toppings = [NSMutableArray new];
        Pizza *pizza = [Pizza new];

        
        NSString *order = [NSString new];
        NSString *input;
        NSString *size;
        BOOL topping;
        int t = 1;
        
        Kitchen *k = [Kitchen new];
        ManagerOne *m1 = [ManagerOne new];
        ManagerTwo *m2 = [ManagerTwo new];
        //DeliveryService *ds = [DeliveryService new];
        ds = [DeliveryService new];
        
        do{
            
            do{
                
                order = [InputCollector inputForPrompt:@"Who should take care of your order? (kitchen/manager1/manager2): "];
                
            }while(![[order lowercaseString]isEqualToString:@"kitchen"] &&
                   ![[order lowercaseString]isEqualToString:@"manager1"] &&
                   ![[order lowercaseString]isEqualToString:@"manager2"]);
            
            do{
                
                input = [InputCollector inputForPrompt:@"New order (special/own): "];
            
            }while(![[input lowercaseString]isEqualToString:@"special"] &&
                   ![[input lowercaseString]isEqualToString:@"own"]);
            
            if([[input lowercaseString]isEqualToString:@"special"]){ //special pizza
                
                [InputCollector printToPrompt:@"Special pizzas: Pepperonni (large) or MeatLovers (any size)"];
                
                do{
                    
                    input = [InputCollector inputForPrompt:@"Which one would you like to order: "];
                    
                }while(![[input lowercaseString]isEqualToString:@"pepperoni"] &&
                       ![[input lowercaseString]isEqualToString:@"meatlovers"]);
                
                if([[input lowercaseString]isEqualToString:@"pepperoni"]){ //pepperoni
                    
                    if([[order lowercaseString]isEqualToString:@"manager1"]){ //manager1
                     
                        [k setDelegate:m1];
                        
                        if([k.delegate kitchen:k shouldMakePizzaOfSize:large andToppings:pepperoni()]){
                            
                            pizza = [k makePepperoniPizza];
                            [InputCollector printToPrompt:@"Pepperoni pizza done by Manager 1!"];
                            
                        }
                        
                        checkM1(m1, pizza);
                        
                    }
                    else if([[order lowercaseString]isEqualToString:@"manager2"]){ //manager2
                        
                        [k setDelegate:m2];
                        
                        if([k.delegate kitchen:k shouldMakePizzaOfSize:large andToppings:pepperoni()]){
                            
                            pizza = [k makePepperoniPizza];
                            [InputCollector printToPrompt:@"Pepperoni pizza done by Manager 2!"];
                            
                        }
                        
                        checkM2(m2, pizza);
                        
                    }
                    else{ //kitchen
                        
                        pizza = [k makePepperoniPizza];
                        [InputCollector printToPrompt:@"Pepperoni pizza done by kitchen!"];
                        
                    }
                    
                }
                
                if([[input lowercaseString]isEqualToString:@"meatlovers"]){ //meatlovers
                    
                    do{
                        
                        size = [InputCollector inputForPrompt:@"Meat Lovers pizza size: "];
                        
                    }while(![[size lowercaseString] isEqualToString:@"small"] &&
                           ![[size lowercaseString] isEqualToString:@"medium"] &&
                           ![[size lowercaseString] isEqualToString:@"large"]);
                    
                    int s = getSize(size);
                    
                    if([[order lowercaseString]isEqualToString:@"manager1"]){ //manager1
                        
                        [k setDelegate:m1];
                        
                        if(![k.delegate kitchenShouldUpgradeOrder:k]){
                            
                            if(s == 0 || s == 1){
                            
                                [InputCollector printToPrompt:@"Your order wasn't upgrade because manager 1 can not upgrade any order."];
                            
                            }
                            
                        }
                        
                        if([k.delegate kitchen:k shouldMakePizzaOfSize:s andToppings:meatLovers()]){
                            
                            pizza = [k makeMeatLoversPizzaWithSize:s];
                            [InputCollector printToPrompt:@"MeatLover pizza done by Manager 1!"];
                            
                        }
                        
                        checkM1(m1, pizza);
                        
                    }
                    else if([[order lowercaseString]isEqualToString:@"manager2"]){ //manager2
                     
                        [k setDelegate:m2];
                            
                        if([k.delegate kitchenShouldUpgradeOrder:k]){
                            
                            if(s == 0 || s == 1){
                                    
                                s = 2;
                                pizza = [k makeMeatLoversPizzaWithSize:s];
                                [InputCollector printToPrompt:@"Manager 2 is too generous, order upgraded to large size!"];
                                
                            }
                                
                        }
                            
                        if([k.delegate kitchen:k shouldMakePizzaOfSize:s andToppings:meatLovers()]){
                                
                            pizza = [k makeMeatLoversPizzaWithSize:s];
                            [InputCollector printToPrompt:@"MeatLover pizza done by Manager 2!"];
                                
                        }
                        
                        checkM2(m2, pizza);
                        
                    }
                    else{ //kitchen
                        
                        pizza = [k makeMeatLoversPizzaWithSize:s];
                        [InputCollector printToPrompt:@"MeatLover pizza done by kitchen!"];
                    
                    }
                    
                }
                
            }
            else{ //own pizza
            
                do{
                    
                    size = [InputCollector inputForPrompt:@"Pizza size: "];
                
                }while(![[size lowercaseString] isEqualToString:@"small"] &&
                       ![[size lowercaseString] isEqualToString:@"medium"] &&
                       ![[size lowercaseString] isEqualToString:@"large"]);
                
                do{
                    
                    topping = YES;
                   
                    input = [InputCollector inputForPrompt:[NSString stringWithFormat:@"Topping %d: ", t]];
                    [toppings addObject:input];
                    t++;
                    
                    do{
                        
                        input = [InputCollector inputForPrompt:@"New topping? (y/n): "];
                    
                    }while([[input lowercaseString]characterAtIndex:0] != 'y' &&
                           [[input lowercaseString]characterAtIndex:0] != 'n');
                    
                    if([[input lowercaseString]characterAtIndex:0] == 'n'){
                        
                        topping = NO;
                        
                    }
                    
                }while(topping);
                
                int s = getSize(size);
                
                if([[order lowercaseString]isEqualToString:@"manager1"]){ //manager1
                    
                    [k setDelegate:m1];
                    
                    if(![k.delegate kitchen:k shouldMakePizzaOfSize:s andToppings:toppings]){
                        
                        [InputCollector printToPrompt:@"Anchovies found, order refused!"];
                        pizza = nil;
                        
                    }
                    else{
                    
                        if(![k.delegate kitchenShouldUpgradeOrder:k]){
                            
                            if(s == 0 || s == 1){
                                
                                [InputCollector printToPrompt:@"Your order wasn't upgrade because manager 1 can not upgrade any order."];
                                
                            }
                            
                        }

                        pizza = [k makePizzaWithSize:s toppings:toppings];
                        [InputCollector printToPrompt:@"Own pizza done by Manager 1!"];
                        

                    }
                    
                    checkM1(m1, pizza);
                    
                }
                else if([[order lowercaseString]isEqualToString:@"manager2"]){ //manager2
                    
                    [k setDelegate:m2];
                        
                    if([k.delegate kitchenShouldUpgradeOrder:k]){
                        
                        if(s == 0 || s == 1){
                            
                            s = 2;
                            pizza = [k makePizzaWithSize:s toppings:toppings];
                            [InputCollector printToPrompt:@"Manager 2 is too generous, order upgraded to large size!"];
                            
                        }
                        
                    }
                        
                    if([k.delegate kitchen:k shouldMakePizzaOfSize:s andToppings:toppings]){

                        pizza = [k makePizzaWithSize:s toppings:toppings];
                        [InputCollector printToPrompt:@"Own pizza done by Manager 2!"];

                    }
                    
                    checkM2(m2, pizza);
                    
                }
                else{ //kitchen
                
                    pizza = [k makePizzaWithSize:s toppings:toppings];
                    [InputCollector printToPrompt:@"Own pizza done by kitchen!"];
                
                }
                
                t = 1;
                
            }
            
            [InputCollector printToPrompt:@""];
            
            orderHistory([ds pizzaDescription]);
            
        }while(1);
        
    }
    
    return 0;

}
