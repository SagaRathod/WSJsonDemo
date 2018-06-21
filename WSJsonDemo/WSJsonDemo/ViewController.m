//
//  ViewController.m
//  WSJsonDemo
//
//  Created by Sagar on 15/06/18.
//  Copyright © 2018 sagar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableData *resData;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)parse:(id)sender
{
    NSURL *url=[NSURL URLWithString:@"http://rest-service.guides.spring.io/greeting"];
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:req delegate:self];
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(nonnull NSURLResponse *)response
{
    NSLog(@"Response::%@",response);
    resData=[[NSMutableData alloc]init];
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(nonnull NSData *)data
{
    NSLog(@"Data::%@",data);
    [resData appendData:data];
    NSLog(@"data:%@",resData);
   // NSString *String=[[NSString alloc]initWithData:resData encoding:NSUTF8StringEncoding];
    if(resData.length>0)
    {
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:resData options:0 error:NULL];
        self.id.text=[NSString stringWithFormat:@"%@",[dic valueForKey:@"id"]];
        self.con.text=[NSString stringWithFormat:@"%@",[dic valueForKey:@"content"]];
    }
}

-(void)connection:(NSURLConnection *)connection didFinishLoading:(NSConnection *)connection
{
    NSLog(@"didfinish");
    
}


-(void)connection:(NSURLConnection *)connection didFailWithError:(nonnull NSError *)error
{
    NSLog(@"Error::%@",error);
}
@end
