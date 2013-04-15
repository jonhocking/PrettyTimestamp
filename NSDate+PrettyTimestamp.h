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

@end
