//
//  SFAttachmentThumbnailer.h
//  SaferoomTextView
//
//  Created by ilia on 19/10/15.
//  Copyright © 2015 Secomsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface SFAttachmentThumbnailer : NSObject

@property (assign, nonatomic) CGSize attachmentSize;
@property (strong, nonatomic) NSString *mimeType;
@property (strong, nonatomic) NSString *fileName;
@property (assign, nonatomic) CGFloat textHeight;



/**
 *  This the init method where we will build UIView that will hold a picture and text string.
 *
 *  @param filename Name of the file or the text to be displayed
 *  @param mime     This is mime type of the attachment. We will use to select appropriate image
 *  @param attSize  This is the size of final image that will be used as placeholder
 *
 *  @return self
 */
-(id)initWithAttachmentFilename:(NSString *)filename withFileType:(NSString *)mime andSize:(CGSize)attSize;

/**
 *  This method will return the image for the placeholder for the attachment
 *
 *  @return UIImage for placeholder
 */
-(UIImage *)buildImageForFilename;

@end
