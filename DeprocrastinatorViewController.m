//
//  DeprocrastinatorViewController.m
//  Deprocrastinator
//
//  Created by ALIREZA TABRIZI on 3/21/16.
//  Copyright © 2016 AR-T.com, Inc. All rights reserved.
//

#import "DeprocrastinatorViewController.h"

@interface DeprocrastinatorViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textFieldLabel;
@property NSMutableArray *toDo;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation DeprocrastinatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.toDo = [[NSMutableArray alloc]init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.toDo objectAtIndex:indexPath.row];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.toDo.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.highlightedTextColor = [UIColor greenColor];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)onAddButtonPressed:(UIBarButtonItem *)sender {
    //self.textField.text =
    [self getTextFromTextField];
    [self.tableView reloadData];
    [self.textFieldLabel resignFirstResponder];
    
}
- (IBAction)onEditButtonPressed:(id)sender {
    //setLeftBarButtonItem:<#(nullable UIBarButtonItem *)#> animated:YES];
    //self.navigationItem.leftBarButtonItem.title = @"Done";

    if ([self.navigationItem.leftBarButtonItem.title isEqualToString:@"Edit"])
    {NSLog(@"inside the if statemenet");
        self.navigationItem.leftBarButtonItem.title= @"Done";
    }
}


//tableView, canMove
//tabeView, canEdit

-(void)getTextFromTextField
{
    NSString *newText = self.textFieldLabel.text;
    [self.toDo addObject:newText];
    //NSLog(@"%@", newText);
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
