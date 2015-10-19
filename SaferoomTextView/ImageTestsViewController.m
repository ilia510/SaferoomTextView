//
//  ImageTestsViewController.m
//  SaferoomTextView
//
//  Created by ilia on 17/10/15.
//  Copyright © 2015 Secomsoft. All rights reserved.
//

#import "ImageTestsViewController.h"

@interface ImageTestsViewController ()

@property (strong, nonatomic) NSString *textString;
@property (weak, nonatomic) IBOutlet UITextField *textX;
@property (weak, nonatomic) IBOutlet UITextField *textY;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *drawText;
- (IBAction)drawText:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;


@end

@implementation ImageTestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textString = @"document folder.pdf";
    self.textX.text = @"0";
    self.textY.text = @"0";
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(UIImage*)drawFront:(UIImage*)image text:(NSString*)text atPoint:(CGPoint)point
{
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:12];
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    
    [image drawInRect:CGRectMake(0,0,image.size.width,image.size.height)];
    
    CGRect rect = CGRectMake(point.x, (point.y - 5), image.size.width, image.size.height);
    
    [[UIColor whiteColor] set];
    
    NSMutableAttributedString* attString = [[NSMutableAttributedString alloc] initWithString:text];
    NSRange range = NSMakeRange(0, [attString length]);
    
    [attString addAttribute:NSFontAttributeName value:font range:range];
    [attString addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:range];
    
    /*
    NSShadow* shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor darkGrayColor];
    shadow.shadowOffset = CGSizeMake(1.0f, 1.5f);
    [attString addAttribute:NSShadowAttributeName value:shadow range:range];
    */
    
    [attString drawInRect:CGRectIntegral(rect)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}
- (IBAction)drawText:(id)sender {
    
    UIImage *newImage = [self drawFront:self.imageView.image text:self.textString atPoint:CGPointMake([self.textX.text integerValue], [self.textY.text integerValue])];
    
    
    
    [[self imageView] setImage:newImage];
    
    UIImage *newImage2 = [self drawFront:self.imageView2.image text:self.textString atPoint:CGPointMake([self.textX.text integerValue], [self.textY.text integerValue])];
    
    
    
    [[self imageView2] setImage:newImage2];
    
}
@end
