#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    NSDictionary *month = [[NSDictionary alloc] init];
    month = @{@1 : @"January",@2 : @"February",@3 : @"March",@4 : @"April",@5 : @"May",@6 : @"June",@7 : @"July",@8 : @"August",@9 : @"September",@10 : @"October",@11 : @"November",@12 : @"December",};
    for (int i = 0; i < month.count; i++) {
        if (monthNumber == i) {
            return [month objectForKey:@(i)];
        }
    }
    return nil;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    NSDate * correctDate = [dateFormatter dateFromString:date];
    dateFormatter.dateFormat = @"dd";
    return [[dateFormatter stringFromDate:correctDate] integerValue];
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_BY"];
    dateFormatter.dateFormat = @"E";
    return [dateFormatter stringFromDate:date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:2];
    NSDate * actualDate = [NSDate now];
    
    NSDateComponents *componentActualWeek = [calendar components:NSCalendarUnitWeekOfYear fromDate:actualDate];
    NSDateComponents *componentsDateWeek = [calendar components:NSCalendarUnitWeekOfYear fromDate:date];
    
    NSDateComponents *componentsActualYear = [calendar components:NSCalendarUnitYear fromDate:actualDate];
    NSDateComponents *componentsDateYear = [calendar components:NSCalendarUnitYear fromDate:date];
    
    if ([componentsDateYear year] == [componentsActualYear year]) {
        if ([componentActualWeek weekOfYear] == [componentsDateWeek weekOfYear]) {
            return YES;
        } else {
            return NO;
        }
    } else {
        return NO;
    }
}

@end
