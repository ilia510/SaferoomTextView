//
//  SFMIMEUtils.h
//  SaferoomTextView
//
//  Created by ilia on 19/10/15.
//  Copyright © 2015 Secomsoft. All rights reserved.
//
//  THIS IS A COPY OF ENMIMEUTILS from Evernote SDK
//
/*
 * ENMIMEUtils.h
 * evernote-sdk-ios
 *
 * Copyright 2012 Evernote Corporation
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
 * IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
 * ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import <Foundation/Foundation.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface SFMIMEUtils : NSObject {
    
}

/**
 *  This method returns us the file extension that corresponds to a certain mime type
 *
 *  @param mime - mime type in standard format
 *
 *  @return file extension based on mime type
 */
+ (NSString *) fileExtensionForMIMEType: (NSString *) mime;

/**
 *  Using this method we will get a Mime type based on filename (using extension)
 *
 *  @param filename - filename with extension
 *
 *  @return - mime type for filename
 */
+ (NSString *) determineMIMETypeForFile: (NSString *) filename;

/**
 *  This method gives us mime type for UTI (Universal Type Identifier)
 *
 *  @param uti - UTI for a content
 *
 *  @return - mime type corresponding to UTI
 */
+ (NSString *) mimeTypeForUTI:(NSString *)uti;

/**
 *  This method mainly works in Saferoom. It return the name of image that will be used as thumbnail. The image name is "file_<type>"
 *
 *  @param mime - mime type for thumbnail
 *
 *  @return - name of the image
 */
+ (NSString *) thumbnailNameForMime:(NSString *) mime;
@end
