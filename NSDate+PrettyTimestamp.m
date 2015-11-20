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
  return [self prettyTimestampSinceDate:date withFormat:nil];
}

- (NSString*)prettyTimestampSinceDate:(NSDate*)date withFormat:(NSString *)format
{
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSUInteger unitFlags = NSCalendarUnitMinute | NSCalendarUnitHour | NSCalendarUnitDay | NSCalendarUnitWeekOfYear | NSCalendarUnitMonth | NSCalendarUnitYear;
  NSDate *earliest = [self earlierDate:date];
  NSDate *latest = (earliest == self) ? date : self;
  NSDateComponents *components = [calendar components:unitFlags fromDate:earliest toDate:latest options:0];
  
  if (!format) {
    format = @"%i %u %c";
  }
  
  if (components.year >= 1) {
    return NSLocalizedString(@"over a year ago", nil);
  }
  if (components.month >= 1) {
    return [self stringForComponentValue:components.month withName:@"month" andPlural:@"months" format:format];
  }
  if (components.weekOfYear >= 1) {
    return [self stringForComponentValue:components.weekOfYear withName:@"week" andPlural:@"weeks" format:format];
  }
  if (components.day >= 1) {
    return [self stringForComponentValue:components.day withName:@"day" andPlural:@"days" format:format];
  }
  if (components.hour >= 1) {
    return [self stringForComponentValue:components.hour withName:@"hour" andPlural:@"hours" format:format];
  }
  if (components.minute >= 1) {
    return [self stringForComponentValue:components.minute withName:@"minute" andPlural:@"minutes" format:format];
  }
  return NSLocalizedString(@"just now", nil);
}

- (NSString*)stringForComponentValue:(NSInteger)componentValue withName:(NSString*)name andPlural:(NSString*)plural format:(NSString*)format
{
  NSString *timespan = NSLocalizedString(componentValue == 1 ? name : plural, nil);
  
  NSMutableString *output = format.mutableCopy;
  [output replaceOccurrencesOfString:@"%i" withString:@(componentValue).stringValue options:0 range:NSMakeRange(0, output.length)];
  [output replaceOccurrencesOfString:@"%u" withString:timespan options:0 range:NSMakeRange(0, output.length)];
  [output replaceOccurrencesOfString:@"%c" withString:NSLocalizedString(@"ago", nil) options:0 range:NSMakeRange(0, output.length)];
  
  return output.copy;
}

@end
