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

#pragma mark - tableView must functions
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.toDo objectAtIndex:indexPath.row];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.toDo.count;
}

#pragma mark

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.highlightedTextColor = [UIColor greenColor];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark- actions

- (IBAction)onAddButtonPressed:(UIBarButtonItem *)sender {
    //self.textField.text =
    [self getTextFromTextField];
    [self.tableView reloadData];
    [self.textFieldLabel resignFirstResponder];
    
}
- (IBAction)onSwipredRight:(UISwipeGestureRecognizer *)sender {
   //[]
}



#pragma mark - edit selected, delete and swap rows

- (IBAction)onEditButtonPressed:(id)sender {                ///- (IBAction)onEditButtonPressed:(UIBarButtonItem *)sender {
    
    //setLeftBarButtonItem: animated:YES];
    //self.navigationItem.leftBarButtonItem.title = @"Done";
        self.navigationItem.leftBarButtonItem.title = @"Edit";                               ///    if (self.editing){
        if (self.editing) {                                     ///        self.editing = false;
            self.editing = NO;                                  ///        [self.tableView setEditing:false animated:true];
            [self.tableView setEditing:NO animated:YES];
            self.navigationItem.leftBarButtonItem.title = @"Edit";///        sender.style = UIBarButtonItemStylePlain;
        } else{                                                 ///        sender.title = @"Edit";
            self.editing = YES;                                 ///    } esle {
            [self.tableView setEditing:YES animated:YES];
            self.navigationItem.leftBarButtonItem.title = @"Done";///        self.editing = true;
        }                                                       ///        [self.tableView setEditing:true animated:true];
                                                               ///        sender.title = @"Done";
                                                               ///        sender.style =  UIBarButtonItemStyleDone;
    [self.tableView reloadData];                                ///    }
                                                                ///    [self.tableView reloadData];
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    
    NSString *stringToMove = self.toDo[sourceIndexPath.row];
    [self.toDo removeObjectAtIndex:sourceIndexPath.row];
    [self.toDo insertObject:stringToMove atIndex:destinationIndexPath.row];
}

#pragma Mark - swipe and edit/delete

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.toDo removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
}


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
