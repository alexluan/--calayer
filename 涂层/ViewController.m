//
//  ViewController.m
//  涂层
//
//  Created by 栾有数 on 15/8/27.
//  Copyright (c) 2015年 栾有数. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ImageEffects.h"
@interface ViewController ()
@property (nonatomic, strong)CALayer * layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.layer = [CALayer layer];
    self.layer.frame = CGRectMake(80, 100, 160, 160);
    [self.imageView.layer addSublayer:self.layer];
    
    float scale = [UIScreen mainScreen].scale;
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, YES, scale);
    [self.view drawViewHierarchyInRect:self.view.frame afterScreenUpdates:NO];
    __block UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(self.layer.frame.origin.x*scale, self.layer.frame.origin.y*scale, self.layer.frame.size.width*scale, self.layer.frame.size.height *scale));
    image = [UIImage imageWithCGImage:imageRef];
    
    image = [image applyBlurWithRadius:50.0f tintColor:[UIColor colorWithRed:0 green:1 blue:0 alpha:0.1] saturationDeltaFactor:2 maskImage:nil];
    self.layer.contents = (__bridge id)(image.CGImage);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
