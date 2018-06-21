//
//  ViewController.h
//  WSJsonDemo
//
//  Created by Sagar on 15/06/18.
//  Copyright © 2018 sagar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<NSURLConnectionDelegate>
@property (weak, nonatomic) IBOutlet UILabel *id;

@property (weak, nonatomic) IBOutlet UILabel *con;
- (IBAction)parse:(id)sender;

@end

