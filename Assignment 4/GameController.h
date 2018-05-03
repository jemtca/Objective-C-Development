
#import <Foundation/Foundation.h>
#import "Dice.h"
#import "InputCollector.h"

@interface GameController : NSObject // : == extends

#pragma mark - Public Properties
@property NSMutableArray <Dice *> *dice;
@property NSMutableArray <Dice *> *heldDice;

#pragma mark - Public Methods
- (instancetype) init;
- (void) holdDie:(Dice *) die;
- (void) resetDice;
- (void) printDice;

@end
