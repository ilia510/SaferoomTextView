//
//  SFTextView.h
//  SaferoomTextView
//
//  Created by ilia on 14/10/15.
//  Copyright © 2015 Secomsoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFTextView : UITextView <UITextViewDelegate, UIScrollViewDelegate, NSTextStorageDelegate> {
    
    float fontSizeCount;
    float _originalHeight;
    float _viewWidth;
    float _scale;
    long _firstLineCharsInserted;
}
/*
- (void)sizeText:(id)sender;
- (void)formatText:(id)sender;
- (void)adjustHeight:(float)height;
- (void)restoreHeight;
*/
@end
