/*
 
 NSDate+PrettyTimestamp.m
 Jon Hocking
 
 Created by Jon Hocking on 15/04/2013.
 
 @jonhocking
 
 
 Copyright (c) 2013 Jon Hocking. All rights reserved.
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 */

#import "NSDate+PrettyTimestamp.h"

@implementation NSDate (PrettyTimestamp)

+ (NSString*)prettyTimestampSinceDate:(NSDate*)date
{
    return [[NSDate date] prettyTimestampSinceDate:date];
}

- (NSString*)prettyTimestampSinceNow
{
    return [self prettyTimestampSinceDate:[NSDate date]];
}

- (NSString*)prettyTimestampSinceDate:(NSDate*)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSMinuteCalendarUnit | NSHourCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    NSDate *earliest = [self earlierDate:date];
    NSDate *latest = (earliest == self) ? date : self;
    NSDateComponents *components = [calendar components:unitFlags fromDate:earliest toDate:latest options:0];
    
    if (components.year >= 1) {
        return NSLocalizedString(@"over a year ago", nil);
    }
    if (components.month >= 1) {
        if (components.month == 1) {
            return [self stringForComponentValue:components.month withName:NSLocalizedString(@"month", nil)];
        }
        else{
            return [self stringForComponentValue:components.month withName:NSLocalizedString(@"months", nil)];
        }
    }
    if (components.week >= 1) {
        if (components.week == 1) {
            return [self stringForComponentValue:components.week withName:NSLocalizedString(@"week", nil)];
        }
        else {
            return [self stringForComponentValue:components.week withName:NSLocalizedString(@"weeks", nil)];
        }
    }
    if (components.day >= 1) {
        if (components.day == 1) {
            return [self stringForComponentValue:components.day withName:NSLocalizedString(@"day", nil)];
        }
        else {
            return [self stringForComponentValue:components.day withName:NSLocalizedString(@"days", nil)];
        }
    }
    if (components.hour >= 1) {
        if (components.hour == 1) {
            return [self stringForComponentValue:components.hour withName:NSLocalizedString(@"hour", nil)];
        }
        else {
            return [self stringForComponentValue:components.hour withName:NSLocalizedString(@"hours", nil)];
        }
    }
    if (components.minute >= 1) {
        if (components.minute == 1) {
            return [self stringForComponentValue:components.minute withName:NSLocalizedString(@"minute", nil)];
        }
        else {
            return [self stringForComponentValue:components.minute withName:NSLocalizedString(@"minutes", nil)];
        }
    }
    return NSLocalizedString(@"just now", nil);
}

- (NSString*)stringForComponentValue:(NSInteger)componentValue withName:(NSString*)name
{
    return [NSString stringWithFormat:@"%d %@ %@", componentValue, name, NSLocalizedString(@"ago", nil)];
}

@end
