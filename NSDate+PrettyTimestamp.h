/*
 
  NSDate+PrettyTimestamp.h
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

#import <Foundation/Foundation.h>

@interface NSDate (PrettyTimestamp)

/**
 Helper method for timestamps between now and the date provided
 @return lowercase string, see readme for examples
 */
+ (NSString*)prettyTimestampSinceDate:(NSDate*)date;

/**
 Timestamp between now and the NSDate instance
 @return lowercase string, see readme for examples
 */
- (NSString*)prettyTimestampSinceNow;

/**
 Timestamp between the date provided and the NSDate instance
 @return lowercase string, see readme for examples
 */
- (NSString*)prettyTimestampSinceDate:(NSDate*)date;

/**
 Timestamp between the date provided and the receiver, using the given format
 @param date The date to compare to the receiver
 @param format The format to print in. Format options are: %i for interval, e.g. "4"; %u for unit, e.g. "weeks"; %c for constant, e.g. "ago".
 Any other characters in the format will be left untouched, i.e. they will appear in the output.
 If the format is nil, then the default format is used, i.e. "%i %u %c", e.g. "4 weeks ago"
 @note Use this method if you don't want the default format, for example, if you don't want spaces between the components, or if you want to add other decorative text.
 @return lowercase string in the given format, see readme for examples
 */
- (NSString*)prettyTimestampSinceDate:(NSDate*)date withFormat:(NSString *)format;

@end
