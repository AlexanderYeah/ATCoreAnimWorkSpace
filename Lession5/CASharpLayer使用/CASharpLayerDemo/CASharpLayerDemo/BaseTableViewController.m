//
//  BaseTableViewController.m
//  CASharpLayerDemo
//
//  Created by AY on 2018/3/7.
//  Copyright © 2018年 AY. All rights reserved.
//

#import "BaseTableViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"

@interface BaseTableViewController ()



@end

@implementation BaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.navigationItem.title = @"CASharpLayer 😈";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellID"];
	self.tableView.rowHeight  = 66;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID" forIndexPath:indexPath];
    
    // Configure the cell...
	
	
	if (indexPath.row == 0) {
		cell.textLabel.text = @"基本使用";
	}else if(indexPath.row == 1){
		cell.textLabel.text = @"红包曲线背景";
	}else if(indexPath.row == 2){
		cell.textLabel.text = @"圆形进度环";
	}else if(indexPath.row == 3){
		cell.textLabel.text = @"录音的动画效果";
	}else if(indexPath.row == 4){
		cell.textLabel.text = @"水波纹动画";
	}else{
	
	}
	
	
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

	if (indexPath.row == 0) {
	
		OneViewController *oneVC = [[OneViewController alloc]init];
		oneVC.view.backgroundColor = [UIColor whiteColor];
		[self.navigationController pushViewController:oneVC animated:YES];
		
	}else if(indexPath.row == 1){
		TwoViewController *twoVC = [[TwoViewController alloc]init];
		twoVC.view.backgroundColor = [UIColor whiteColor];
		[self.navigationController pushViewController:twoVC animated:YES];
		
	}else if(indexPath.row == 2){
		ThreeViewController *threeVC = [[ThreeViewController alloc]init];
		threeVC.view.backgroundColor = [UIColor whiteColor];
		[self.navigationController pushViewController:threeVC animated:YES];
		
	}else if(indexPath.row == 3){
		FourViewController *fourVC = [[FourViewController alloc]init];
		fourVC.view.backgroundColor = [UIColor whiteColor];
		[self.navigationController pushViewController:fourVC animated:YES];
	}else if(indexPath.row == 4){
		FiveViewController *fiveVC = [[FiveViewController alloc]init];
		fiveVC.view.backgroundColor = [UIColor whiteColor];
		[self.navigationController pushViewController:fiveVC animated:YES];
		
	}else{
		
	}
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
