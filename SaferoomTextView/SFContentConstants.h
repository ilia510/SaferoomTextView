//
//  SFContentConstants.h
//  SaferoomTextView
//
//  Created by ilia on 19/10/15.
//  Copyright © 2015 Secomsoft. All rights reserved.
//
//  IT IS A COPY FROM EDAMLimitsConstants CLASS
//
#import <Foundation/Foundation.h>

@interface SFContentConstants : NSObject


+ (NSString *) SF_MIME_REGEX;
+ (NSString *) SF_MIME_TYPE_GIF;
+ (NSString *) SF_MIME_TYPE_JPEG;
+ (NSString *) SF_MIME_TYPE_PNG;
+ (NSString *) SF_MIME_TYPE_WAV;
+ (NSString *) SF_MIME_TYPE_MP3;
+ (NSString *) SF_MIME_TYPE_AMR;
+ (NSString *) SF_MIME_TYPE_AAC;
+ (NSString *) SF_MIME_TYPE_M4A;
+ (NSString *) SF_MIME_TYPE_MP4_VIDEO;
+ (NSString *) SF_MIME_TYPE_INK;
+ (NSString *) SF_MIME_TYPE_PDF;
+ (NSString *) SF_MIME_TYPE_DEFAULT;
+ (NSMutableSet *) SF_MIME_TYPES;
+ (NSMutableSet *) SF_INDEXABLE_RESOURCE_MIME_TYPES;

@end
