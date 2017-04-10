//
//  ViewController.m
//  PygLatin
//
//  Created by Arkadijs Makarenko on 15/03/2017.
//  Copyright © 2017 ArchieApps. All rights reserved.


#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.button addTarget:self action:@selector(converter) forControlEvents:UIControlEventTouchUpInside];
}
-(void) converter {
    NSString *word = self.textField.text;
    // yes -> es y ey
    // 1. get first character
    NSString *first = [word substringToIndex:1];
    NSString *vowel = @"aiueo";
    NSRange foundRange = [vowel rangeOfString:first];
    if (foundRange.location< vowel.length) {
        self.label.text = word;
        return;
    }
    for(NSInteger i = 1; i<word.length; i++) {
        //get the next character
        NSRange nextRange = NSMakeRange(i, 1);
        NSString *next = [word substringWithRange:nextRange];
        NSRange foundRange = [vowel rangeOfString:next];
        //check if the character is vowel
        if (foundRange.location< vowel.length) {
            //split the char
            //before vowel
            NSString *before = [word substringToIndex:i];
            //from vowel till the last
            NSString *reminder = [word substringFromIndex:i];
            //arrange =from vowel+before+ey
            self.label.text = [NSString stringWithFormat:@"%@%@ey", reminder,before];
            //return arrange
            return;
        }
    }
}
@end
