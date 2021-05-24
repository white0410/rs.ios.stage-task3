#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *_string1 = [NSMutableString stringWithString:string1];
    NSMutableString *_string2 = [NSMutableString stringWithString:string2];
    
    NSMutableString *result = [NSMutableString stringWithString:@""];
    
    while(_string1.length != 0 || _string2.length != 0) {
        if (_string1.length == 0) {
            [result appendString:_string2];
            break;
        } else if (_string2.length == 0) {
            [result appendString:_string1];
            break;
        }
        if ([[_string1 substringToIndex:1] UTF8String][0] <= [[_string2 substringToIndex:1] UTF8String][0]) {
            [result appendString: [_string1 substringToIndex:1]];
            _string1 = [[_string1 substringFromIndex:1] mutableCopy];
        } else {
            [result appendString: [_string2 substringToIndex:1]];
            _string2 = [[_string2 substringFromIndex:1] mutableCopy];
        }
    }
    return [result copy];
}

@end
