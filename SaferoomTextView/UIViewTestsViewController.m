//
//  UIViewTestsViewController.m
//  SaferoomTextView
//
//  Created by ilia on 17/10/15.
//  Copyright © 2015 Secomsoft. All rights reserved.
//

#import "UIViewTestsViewController.h"
#import "SFAttachmentThumbnailer.h"

@interface UIViewTestsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *viewToImage;

@end

@implementation UIViewTestsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //UIImage *testImage = [self getUIImageFromThisUIView:self.viewToImage];
    
    //self.imageView.image = testImage;
    
    UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(0, 70, 150, 60)];
    newView.backgroundColor = [UIColor redColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    imageView.image = [UIImage imageNamed:@"zip"];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [imageView setCenter:CGPointMake(CGRectGetMidX([newView bounds]),CGRectGetMinY([newView bounds])+17)];
    
    
    
    [newView addSubview:imageView];
    
    UILabel *fileName = [[UILabel alloc] initWithFrame:CGRectMake(0, 45, 140, 15)];
    
    [fileName setTextColor:[UIColor grayColor]];
    [fileName setBackgroundColor:[UIColor greenColor]];
    [fileName setFont:[UIFont systemFontOfSize:12.0f]];
    fileName.text = @"filename docum.pdf";
    [fileName setTextAlignment:NSTextAlignmentCenter];
    
    [newView addSubview:fileName];
    [self.view addSubview:newView];
    
    UIImage *imageFromView = [self getUIImageFromThisUIView:newView];
    
    //[[self imageView] setImage:imageFromView];
    
    
    
    //Running a thumbnailer
    
    SFAttachmentThumbnailer *thumber = [[SFAttachmentThumbnailer alloc]  initWithAttachmentFilename:@"filename docum.pdf"
                                                                                       withFileType:@"image/png"
                                                                                            andSize:CGSizeMake(150, 60)];
    [[self imageView] setImage:[thumber buildImageForFilename]];
    [self.imageView setContentMode:UIViewContentModeScaleAspectFit];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImage*)getUIImageFromThisUIView:(UIView*)aUIView
{
    UIGraphicsBeginImageContextWithOptions(aUIView.bounds.size, NO, 0.0);
    
    
    [aUIView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return viewImage;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
