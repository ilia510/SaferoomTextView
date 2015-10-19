//
//  SFTextAttachment.m
//  SaferoomTextView
//
//  Created by ilia on 14/10/15.
//  Copyright © 2015 Secomsoft. All rights reserved.

//
//

/*
 
The problem with standard NSTextAttachment is that once you set a .image property, all other properties become nil.
 So you can use a placeholder image on that.
 
 We will use our own properties to store original attachment data.
 
 */

#import "SFTextAttachment.h"
#import "SFAttachmentThumbnailer.h"
#import "SFMIMEUtils.h"

@implementation SFTextAttachment

- (id)initWithData:(NSData *)contentData ofType:(NSString *)mime {
    //FLOG(@"initWithData called");
    //FLOG(@"uti is %@", uti);
    self = [super initWithData:contentData ofType:mime];
    
    if (self) {
        
        NSLog(@"uti is:%@",mime);
        
        if (![mime containsString:@"image"]) {
            NSLog(@"Attachment is other type.");
            
            self.attachmentData = contentData;
            self.fileType = mime;
            self.sfFileWrapper = self.fileWrapper;
            self.attachmentFilename = self.fileWrapper.filename;
            
            if (!self.attachmentFilename || [self.attachmentFilename isEqualToString:@""]) {
                
                self.attachmentFilename = [NSString stringWithFormat:@"document.%@",[SFMIMEUtils fileExtensionForMIMEType:self.fileType]];
            }
            
            SFAttachmentThumbnailer *thumbnail = [[SFAttachmentThumbnailer alloc] initWithAttachmentFilename:self.attachmentFilename
                                                                                                withFileType:mime
                                                                                                     andSize:CGSizeMake(150, 60)];
            //after this method all original NSTextAttachment fields will be nulled
            self.image = [thumbnail buildImageForFilename];
            
            
        } else {
            
            NSLog(@"Attachment is image.");
            
            UIImage *img = [UIImage imageWithData:contentData];
            self.image = img;
            self.attachmentData = contentData;
        
            self.mimeType = self.fileType;
            self.attachmentFilename = self.fileWrapper.filename;

        }
        
    }
    return self;
}


- (CGRect)attachmentBoundsForTextContainer:(NSTextContainer *)textContainer proposedLineFragment:(CGRect)lineFrag glyphPosition:(CGPoint)position characterIndex:(NSUInteger)charIndex {
    
    //FLOG(@"attachmentBoundsForTextContainer:proposedLineFragment:glyphPosition:characterIndex: called");
    float width = lineFrag.size.width;
    
    return [self scaleImageSizeToWidth:width];
}

// Scale the image to fit the line width less 10%
- (CGRect)scaleImageSizeToWidth:(float)width {
    
    float scalingFactor = 1.0;
    
    CGSize imageSize = [self.image size];
    
    if (width < imageSize.width)
        scalingFactor = (width*0.9) / imageSize.width;
    
    CGRect rect = CGRectMake(0, 0, imageSize.width * scalingFactor, imageSize.height * scalingFactor);
    
    return rect;
    
}
@end
