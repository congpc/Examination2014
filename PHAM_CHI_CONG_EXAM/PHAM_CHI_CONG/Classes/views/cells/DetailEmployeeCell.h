//
//  DetailEmployeeCell.h
//  PHAM_CHI_CONG
//
//  Created by TTA-Brown-006 on 4/16/15.
//  Copyright (c) 2015 Pham Chi Cong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailEmployeeCell : UITableViewCell {
    
}
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@end
