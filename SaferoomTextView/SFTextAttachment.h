//
//  SFTextAttachment.h
//  SaferoomTextView
//
//  Created by ilia on 14/10/15.
//  Copyright © 2015 Secomsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFTextAttachment : NSTextAttachment

@property (strong, nonatomic) NSString *mimeType;
@property (strong, nonatomic) NSData *attachmentData;
@property (strong, nonatomic) NSString *attachmentFilename;
@property (strong, nonatomic) NSFileWrapper *sfFileWrapper;


@end
