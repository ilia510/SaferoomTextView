//
//  SFTextView.m
//  SaferoomTextView
//
//  Created by ilia on 14/10/15.
//  Copyright © 2015 Secomsoft. All rights reserved.
//

#import "SFTextView.h"
#import "SFTextAttachment.h"
#import <QuartzCore/QuartzCore.h>

#define MAXFONTSIZE 256
#define MINFONTSIZE 4
#define FONT_NORMAL             @"Helvetica"
#define FONT_BOLD               @"Helvetica-Bold"
#define FONT_HEADING1           @"Helvetica-Bold"
#define FONT_HEADING2           @"Helvetica-Bold"
#define FONT_HEADING3           @"Helvetica-Bold"
#define FONT_HEADINGDOC         @"Helvetica"
#define FONT_TABLE_HEADING      @"Helvetica-Bold"
#define FONT_TABLE_NORMAL       @"Helvetica"
#define FONT_SIZE_TABLE         10
#define FONT_SIZE_NORMAL        12
#define FONT_SIZE_HEADING1      16
#define FONT_SIZE_HEADING2      14
#define FONT_SIZE_HEADING3      13

@implementation SFTextView 

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initialize];
    }
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self){
        // Initialization code
        //FLOG(@"initWithCoder called");
        [self initialize];
    }
    return self;
}
- (void)initialize
{
    NSLog(@"initialize called");
    
    //Can we set our own LayoutManager here ?
    /*
     OSLayoutManager *layoutManager = [[OSLayoutManager alloc] init];
     [layoutManager addTextContainer:self.textContainer];
     [self.textStorage removeLayoutManager:[self.textStorage.layoutManagers objectAtIndex:0]];
     [self.textStorage addLayoutManager:layoutManager];
     */

    [self.textStorage setDelegate:self];

    
}


/**
 *  This method will do all the heavy lifting in converting standard NSTextAttachment into SFTextAttachment.
 *
 *  @param textStorage - textStorage of the textView
 *  @param editedMask  - edited mask
 *  @param editedRange - range of edited text
 *  @param delta       - was a change in length
 */

- (void)textStorage:(NSTextStorage *)textStorage didProcessEditing:(NSTextStorageEditActions)editedMask range:(NSRange)editedRange changeInLength:(NSInteger)delta {
    NSLog(@"textStorage:didProcessEditing:range:changeInLength: called. ChangeInLength:%ld",(long)delta);
    __block NSMutableDictionary *dict;
    
    
    [textStorage enumerateAttributesInRange:editedRange options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:
     ^(NSDictionary *attributes, NSRange range, BOOL *stop) {
         
         dict = [[NSMutableDictionary alloc] initWithDictionary:attributes];
         
         // Iterate over each attribute and look for attachments
         [dict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
             
             if ([[key description] isEqualToString:NSAttachmentAttributeName]) {
                 //FLOG(@" textAttachment found");
                 NSLog(@" textAttachment class is %@", [obj class]);
                 
                 //Here we need to avoid transforming already created SFTextAttachments
                 
                 if ([obj class] == [NSTextAttachment class]) {
                     
                     NSTextAttachment *attachment = obj;
                     
                     NSLog(@"Added attachment. \nContent size:%lu \nFile type:%@ \nFilename:%@ ",[attachment.contents length],attachment.fileType,attachment.fileWrapper.filename);
                     
                     SFTextAttachment *sfAttachment = [[SFTextAttachment alloc] initWithData:attachment.contents ofType:attachment.fileType];
                     
                     
                     
                     /*
                      
                      This is the code used by Duncan - it adds an image to .image property.
                      
                      if (attachment.image) {
                      NSLog(@" attachment.image found");
                      sfAttachment = [[SFTextAttachment alloc] initWithData:UIImagePNGRepresentation(attachment.image) ofType:attachment.fileType];
                      }
                      else {
                      NSLog(@" attachment.image is nil");
                      sfAttachment = [[SFTextAttachment alloc] initWithData:attachment.fileWrapper.regularFileContents ofType:attachment.fileType];
                      }
                      */
                     
                     
                     [dict setValue:sfAttachment forKey:key];
                     
                 } else {
                     
                     NSLog(@"Attachment is SFTextAttachment. No need to convert.");
                 }
                     

             }
             
         }];
         
         [textStorage setAttributes:dict range:range];
         
     }];
    
}


@end
