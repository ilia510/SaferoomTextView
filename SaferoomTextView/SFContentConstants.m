//
//  SFContentConstants.m
//  SaferoomTextView
//
//  Created by ilia on 19/10/15.
//  Copyright © 2015 Secomsoft. All rights reserved.
//
//  IT IS A COPY FROM EDAMLIMITSCONSTANTS
//

#import "SFContentConstants.h"




static int32_t SFSF_MIME_LEN_MIN = 3;
static int32_t SFSF_MIME_LEN_MAX = 255;
static NSString * SFSF_MIME_REGEX = @"^[A-Za-z]+/[A-Za-z0-9._+-]+$";
static NSString * SFSF_MIME_TYPE_GIF = @"image/gif";
static NSString * SFSF_MIME_TYPE_JPEG = @"image/jpeg";
static NSString * SFSF_MIME_TYPE_PNG = @"image/png";
static NSString * SFSF_MIME_TYPE_WAV = @"audio/wav";
static NSString * SFSF_MIME_TYPE_MP3 = @"audio/mpeg";
static NSString * SFSF_MIME_TYPE_AMR = @"audio/amr";
static NSString * SFSF_MIME_TYPE_AAC = @"audio/aac";
static NSString * SFSF_MIME_TYPE_M4A = @"audio/mp4";
static NSString * SFSF_MIME_TYPE_MP4_VIDEO = @"video/mp4";
static NSString * SFSF_MIME_TYPE_INK = @"application/vnd.evernote.ink";
static NSString * SFSF_MIME_TYPE_PDF = @"application/pdf";
static NSString * SFSF_MIME_TYPE_DEFAULT = @"application/octet-stream";
static NSString * SFSF_THUMBNAIL_FILENAME_PREFIX = @"thumbnail_";
static NSMutableSet * SFSF_MIME_TYPES;
static NSMutableSet * SFSF_INDEXABLE_RESOURCE_MIME_TYPES;



@implementation SFContentConstants

+ (void) initialize {
    SFSF_MIME_TYPES = [[NSMutableSet alloc] initWithCapacity:11];
    [SFSF_MIME_TYPES addObject:@"image/gif"];
    [SFSF_MIME_TYPES addObject:@"image/jpeg"];
    [SFSF_MIME_TYPES addObject:@"image/png"];
    [SFSF_MIME_TYPES addObject:@"audio/wav"];
    [SFSF_MIME_TYPES addObject:@"audio/mpeg"];
    [SFSF_MIME_TYPES addObject:@"audio/amr"];
    [SFSF_MIME_TYPES addObject:@"application/vnd.evernote.ink"];
    [SFSF_MIME_TYPES addObject:@"application/pdf"];
    [SFSF_MIME_TYPES addObject:@"video/mp4"];
    [SFSF_MIME_TYPES addObject:@"audio/aac"];
    [SFSF_MIME_TYPES addObject:@"audio/mp4"];
    
    ;
    SFSF_INDEXABLE_RESOURCE_MIME_TYPES = [[NSMutableSet alloc] initWithCapacity:15];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/msword"];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/mspowerpoint"];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/excel"];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/vnd.ms-word"];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/vnd.ms-powerpoint"];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/vnd.ms-excel"];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/vnd.openxmlformats-officedocument.wordprocessingml.document"];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/vnd.openxmlformats-officedocument.presentationml.presentation"];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/vnd.apple.pages"];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/vnd.apple.numbers"];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/vnd.apple.keynote"];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/x-iwork-pages-sffpages"];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/x-iwork-numbers-sffnumbers"];
    [SFSF_INDEXABLE_RESOURCE_MIME_TYPES addObject:@"application/x-iwork-keynote-sffkey"];
    
    ;

}

+ (int32_t) SF_MIME_LEN_MIN{
    return SFSF_MIME_LEN_MIN;
}
+ (int32_t) SF_MIME_LEN_MAX{
    return SFSF_MIME_LEN_MAX;
}
+ (NSString *) SF_MIME_REGEX{
    return SFSF_MIME_REGEX;
}
+ (NSString *) SF_MIME_TYPE_GIF{
    return SFSF_MIME_TYPE_GIF;
}
+ (NSString *) SF_MIME_TYPE_JPEG{
    return SFSF_MIME_TYPE_JPEG;
}
+ (NSString *) SF_MIME_TYPE_PNG{
    return SFSF_MIME_TYPE_PNG;
}
+ (NSString *) SF_MIME_TYPE_WAV{
    return SFSF_MIME_TYPE_WAV;
}
+ (NSString *) SF_MIME_TYPE_MP3{
    return SFSF_MIME_TYPE_MP3;
}
+ (NSString *) SF_MIME_TYPE_AMR{
    return SFSF_MIME_TYPE_AMR;
}
+ (NSString *) SF_MIME_TYPE_AAC{
    return SFSF_MIME_TYPE_AAC;
}
+ (NSString *) SF_MIME_TYPE_M4A{
    return SFSF_MIME_TYPE_M4A;
}
+ (NSString *) SF_MIME_TYPE_MP4_VIDEO{
    return SFSF_MIME_TYPE_MP4_VIDEO;
}
+ (NSString *) SF_MIME_TYPE_INK{
    return SFSF_MIME_TYPE_INK;
}
+ (NSString *) SF_MIME_TYPE_PDF{
    return SFSF_MIME_TYPE_PDF;
}
+ (NSString *) SF_MIME_TYPE_DEFAULT{
    return SFSF_MIME_TYPE_DEFAULT;
}

+ (NSString *) SF_THUMBNAIL_FILENAME_PREFIX{
    return SFSF_THUMBNAIL_FILENAME_PREFIX;
}

+ (NSMutableSet *) SF_MIME_TYPES{
    return SFSF_MIME_TYPES;
}
+ (NSMutableSet *) SF_INDEXABLE_RESOURCE_MIME_TYPES{
    return SFSF_INDEXABLE_RESOURCE_MIME_TYPES;
}

@end
