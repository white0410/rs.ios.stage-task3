#import "PlayersSeparator.h"

@implementation PlayersSeparator

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    NSInteger player1, player2, player3;
       if (ratingArray.count < 3) {
               return 0;
           }
           int result = 0;
           for (int i = 0; i < ratingArray.count - 2; i++) {
               for (int j = i+1; j < ratingArray.count - 1; j++) {
                   for (int k = j+1; k < ratingArray.count; k++) {
                       player1 = ratingArray[i].integerValue;
                       player2 = ratingArray[j].integerValue;
                       player3 = ratingArray[k].integerValue;

                       if (player1 < player2 == player2 < player3) {
                           result++;
                   
               }
                   }
           }
           }
    return result;
}

@end
