//
//  SFAttachmentThumbnailer.m
//  SaferoomTextView
//
//  Created by ilia on 19/10/15.
//  Copyright © 2015 Secomsoft. All rights reserved.
//

#import "SFAttachmentThumbnailer.h"
#import "SFMIMEUtils.h"

@interface SFAttachmentThumbnailer ()

@property (strong,nonatomic) UIView *attachmentView;
@property (strong,nonatomic) UIImageView *thumbnail;
@property (strong,nonatomic) UILabel *attachmentTextLabel;

@end

@implementation SFAttachmentThumbnailer


/**
 *  This the init method where we will build UIView that will hold a picture and text string.
 *
 *  @param mime    This is mime type of the attachment. We will use to select appropriate image
 *  @param attSize This is the size of final image that will be used as placeholder
 */
-(id)initWithAttachmentFilename:(NSString *)filename withFileType:(NSString *)mime andSize:(CGSize)attSize {
    
    self = [super init];
    
    if (self) {
        
        self.mimeType = mime;

        //Are we secure for nils?
        self.attachmentSize = attSize;
        
        self.fileName = filename;
        
        //Build main view based on attSize
        [self buildMainView];
        
        //Add image view with icon
        [self buildImageView];
        
        //add text label
        
        [self buildTextView];
        
        return self;
        
    } else {
        
        return nil;
    }
   
    
}

/**
 *  This method will return the image for the placeholder for the attachment
 *
 *  @param filename - This parameter sets the text on the image (we need to use a filename here)
 */
-(UIImage *)buildImageForFilename {
    
    UIGraphicsBeginImageContextWithOptions(self.attachmentView.bounds.size, NO, 0.0);
    
    
    [self.attachmentView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *thumbnailImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return thumbnailImage;
    
}

#pragma Constructing views

/**
 *  This method builds main view. ALWAYS THE FIRST METHOD.
 */

-(void)buildMainView {
    
    self.attachmentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.attachmentSize.width, self.attachmentSize.height)];
    
}

/**
 *  This method builds image view and centers it. RUN ONLY AFTER buildMainView has been executed
 */

-(void)buildImageView {
    
    self.thumbnail = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [self.thumbnail setImage:[self imageForMime]];
    
    [self.thumbnail setContentMode:UIViewContentModeScaleAspectFit];

    [self.thumbnail setCenter:CGPointMake(CGRectGetMidX([self.attachmentView bounds]),CGRectGetMinY([self.attachmentView bounds])+20)];

    [self.attachmentView addSubview:self.thumbnail];
    
}

/**
 *  This method adds our text to the view
 */

-(void)buildTextView{
    
    
    if (self.textHeight == 0) {
        
        self.textHeight = 10;//default is 15
    }
    
    
    self.attachmentTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.attachmentSize.height-self.textHeight, self.attachmentSize.width,self.textHeight)];
    
    [self.attachmentTextLabel setTextColor:[UIColor blackColor]];
    [self.attachmentTextLabel setBackgroundColor:[UIColor clearColor]];
    [self.attachmentTextLabel setFont:[UIFont systemFontOfSize:10.0f]];
    
    [self.attachmentTextLabel setText:self.fileName];
    
    [self.attachmentTextLabel setTextAlignment:NSTextAlignmentCenter];
    [self.attachmentTextLabel setLineBreakMode:NSLineBreakByTruncatingMiddle];
    
    [self.attachmentView addSubview:self.attachmentTextLabel];
    
}

#pragma Auxiliary methods

-(UIImage *)imageForMime {
    
    return [UIImage imageNamed:[SFMIMEUtils thumbnailNameForMime:self.mimeType]];
}

@end
