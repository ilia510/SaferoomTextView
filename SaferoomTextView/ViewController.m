//
//  ViewController.m
//  SaferoomTextView
//
//  Created by ilia on 14/10/15.
//  Copyright © 2015 Secomsoft. All rights reserved.
//

#import "ViewController.h"
#import "SFTextView.h"
#import "SFTextAttachment.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "SFMIMEUtils.h"

@interface ViewController () <UITextViewDelegate,NSTextStorageDelegate>
@property (weak, nonatomic) IBOutlet SFTextView *textView;
@property (strong, nonatomic) NSAttributedString *pdfAttach;
- (IBAction)addImage:(id)sender;
- (IBAction)processTextView:(id)sender;
- (IBAction)attachPDF:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.textView.delegate = self;
    
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UIImagePicker

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    //In this method we will select data from Library.
    // This data can contain Photos and also other files.
    
    //First let's assing to a variable what kind of MediaType we have selected.
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    
    //We need also to take a text from the textView which currently present.
    NSMutableAttributedString *currentString = [[NSMutableAttributedString alloc] initWithAttributedString:self.textView.attributedText];
    
    
    if ([info objectForKey:UIImagePickerControllerOriginalImage]) {
        
        //NSLog(@"%s:Attachment is image.",__PRETTY_FUNCTION__);
        //our media type is image (Core Type kUTTypeImage)
        
        //Getting an original of our image
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
       
        //Here we might need to place code for image optimization, right now original image is taken
        
        //Initialize NSTextAttachment for NSAttributedString
        NSData *imageData = UIImagePNGRepresentation(image);
        
        
        //NSLog(@"Selected image size:%lu",(unsigned long)[imageData length]);
        
       NSTextAttachment *attachment = [[NSTextAttachment alloc] initWithData:imageData ofType:@"image/png"];
        /*
         if ([[NSUserDefaults standardUserDefaults] integerForKey:@"scaleImages"] == 1) {
         
         attachment.image = [self scaleImage:image];
         
         } else {
         
         attachment.image = image;
         }*/
        
        //attachment.image = image;

        /**
         *  This is a testing of PDF data
        
        NSURL *pdfDoc = [[NSBundle mainBundle] URLForResource:@"text" withExtension:@"pdf"];
        
        
        NSData *pdfData = [NSData dataWithContentsOfURL:pdfDoc];
        
        NSLog(@"Size of pdf data:%lu",(unsigned long)[pdfData length]);
        
        NSTextAttachment *pdfAttach = [[NSTextAttachment alloc] initWithData:pdfData ofType:[SFMIMEUtils determineMIMETypeForFile:[pdfDoc lastPathComponent]]];
        
        //pdfAttach.image = imgText;
        
        //Adding image to the current cursor position
          */
        [currentString replaceCharactersInRange:self.textView.selectedRange withAttributedString:[NSAttributedString attributedStringWithAttachment:attachment]];
        
        
    } else if (CFStringCompare ((__bridge CFStringRef) mediaType, kUTTypeMovie, 0) == kCFCompareEqualTo) {
        
        //We have selected NOT an image in our imagepicker
        
        /*
         [info enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
         
         NSLog(@"%@:%@",key,obj);
         
         }];
         
         */
        
        //NSLog(@"Video is selected. URL is: %@", [info objectForKey:UIImagePickerControllerMediaURL]);
        
        //In this case we work with filewrappers
        
        //NSData *data = [[NSData alloc] initWithContentsOfURL:[info objectForKey:UIImagePickerControllerMediaURL]];
        
        NSURL *videoURL = [info objectForKey:UIImagePickerControllerMediaURL];
        
        //Allocating NSTextAttachment with data directly
        // NSTextAttachment *attachment = [[NSTextAttachment alloc] initWithData:data ofType:[info objectForKey:UIImagePickerControllerMediaType]];
        //attachment.image = image;
        
        
        //Here we try to put some placeholder in the area where the other RESOURCE should be present
        NSMutableAttributedString *stringForVideo = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"http://%@",[videoURL absoluteString]]];
        
        
        
        [currentString replaceCharactersInRange:self.textView.selectedRange withAttributedString:stringForVideo];
        
    }
    
    
    //Attaching attributed string to the view
    self.textView.attributedText = currentString;
    
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}



- (IBAction)addImage:(id)sender {
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        picker.delegate = self;
        
        picker.modalPresentationStyle = UIModalPresentationCurrentContext;
        //For now video attachments are switched off.
        //picker.mediaTypes = [NSArray arrayWithObjects:(NSString *)kUTTypeMovie,(NSString *)kUTTypeImage, nil];
        
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (IBAction)processTextView:(id)sender {
    
   //Let's enumerate attachments in text storage
    
    [self.textView.textStorage enumerateAttributesInRange:NSMakeRange(0, [self.textView.textStorage length])
                                                  options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(NSDictionary<NSString *,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
                                                      
                                                     
                                                      NSDictionary *dict = [[NSDictionary alloc] initWithDictionary:attrs];
                                                      
                                                      [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                                                          
                                                          //NSLog(@"key:%@ - obj:%@",key,obj);
                                                          
                                                          if ([[key description] isEqualToString:@"NSAttachment"]) {
                                                              
                                                              NSLog(@"We found attachment of class:%@",[obj class]);
                                                              
                                                              
                                                              SFTextAttachment *attachment = obj;
                                                              
                                                              NSLog(@"Size of attach:%lu",[[attachment attachmentData] length]);
                                                              
                                                              
                                                              NSLog(@"Size of image placed:%lu",[UIImagePNGRepresentation(attachment.image) length]);
                                                              
                                                          }
                                                          
                                                          
                                                      }];
                                                      
                                                      
                                                      
                                                  }];
}

- (IBAction)attachPDF:(id)sender {
    
    NSURL *pdfDoc = [[NSBundle mainBundle] URLForResource:@"text" withExtension:@"pdf"];
    
    
    NSData *pdfData = [NSData dataWithContentsOfURL:pdfDoc];
    
    NSLog(@"Size of pdf data:%lu",(unsigned long)[pdfData length]);
    
    NSTextAttachment *pdfAttach = [[NSTextAttachment alloc] initWithData:pdfData ofType:@"application/pdf"];
    
    // self.pdfAttach = ;
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithAttributedString:self.textView.attributedText];

    NSLog(@"Selected range is:%lu,%lu",(unsigned long)self.textView.selectedRange.location, (unsigned long)self.textView.selectedRange.length);
    
    NSAttributedString *strAttached = [NSAttributedString attributedStringWithAttachment:pdfAttach];
    
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:@"asjhfjkdshfj" attributes:NULL];
    
    [str replaceCharactersInRange:self.textView.selectedRange withAttributedString:strAttached];
    
    self.textView.attributedText = str;
    
}

-(UIImage *)addText:(UIImage *)image text:(NSString *)text{
    
    CGRect rect = CGRectMake(0,0,image.size.width,image.size.height);
    
    // create a context according to image size
    UIGraphicsBeginImageContext(rect.size);
    
    
    // draw image
    [image drawInRect:rect];
    
    
    UIFont* font = [UIFont systemFontOfSize:14.0];
    
    /// Make a copy of the default paragraph style
    NSMutableParagraphStyle* paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    /// Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    /// Set text alignment
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    NSDictionary *attributes = @{ NSFontAttributeName: font,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    //CGRect textRect = CGRectMake(0,0,);
    
    /// draw text
    [text drawInRect:rect withAttributes:attributes];
    
    // get as image
    UIImage * image2 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image2;
}
@end