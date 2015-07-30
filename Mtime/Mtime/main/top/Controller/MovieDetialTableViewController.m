//
//  MovieDetialTableViewController.m
//  Mtime
//
//  Created by Mee Leo on 28/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "MovieDetialTableViewController.h"
#import "ChatModel.h"
#import "TopDetailTableViewCell.h"
#import "HeaderView.h"

@interface MovieDetialTableViewController ()
@property (nonatomic,strong)NSMutableArray* boolArray;
@end

@implementation MovieDetialTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_bg_all"]];
    self.navigationController.title = @"电影详情";
    _labelHeight = 24;
    
    
    NSDictionary* JsonDict = [self loadJson:@"movie_comment.json"];
    
    _chatModelArray = [self _creatChatModel:JsonDict ModelName:@"list"];
//    NSLog(@"%@",_chatModelArray);
    
    UINib* nib = [UINib nibWithNibName:@"TopDetailTableViewCell" bundle:[NSBundle mainBundle]];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"topDetialCell"];
    [self isLongArray];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)isLongArray{
    _boolArray = [NSMutableArray array];
    for (NSInteger i = 0; i< _chatModelArray.count; i++) {
        [_boolArray addObject:@"1"];
    }
    
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _chatModelArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 200;
}


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TopDetailTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"topDetialCell" forIndexPath:indexPath];
 
     cell.chatModel = _chatModelArray[indexPath.row];
 // Configure the cell...
 
     return cell;
 }

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    HeaderView* headerView = [[HeaderView alloc]init];
    return headerView;
    
    
}
#pragma mark - TableView Delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString* content =     ((ChatModel*)_chatModelArray[indexPath.row]).content;
    _labelHeight= [content boundingRectWithSize:CGSizeMake(230, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil].size.height ;
    if ([_boolArray[indexPath.row] isEqualToString:@"1"]) {
        return 60;
    }
    if ([_boolArray[indexPath.row] isEqualToString:@"2"]) {
        return _labelHeight+32;
    }
  
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_boolArray[indexPath.row] isEqualToString:@"1"]) {
   
    
        _boolArray[indexPath.row] = @"2" ;
    }else{
        
        _boolArray[indexPath.row] = @"1";
        
        
    }
    [self.tableView reloadData];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

/*
 NSString* str = dict[@"content"];
 NSLog(@"%@ 1111111",str );
 NSLog(@"%@",dict[@"content"]);
 CGSize size = [str boundingRectWithSize:CGSizeMake(Swidth-80, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil].size;
 NSLog(@"%lf",size.height);
 return size.height +40;
 */





#pragma mark - Json数据处理

-(NSDictionary*)loadJson:(NSString*)JsonName{
    NSString* filePath = [[NSBundle mainBundle]pathForResource:JsonName ofType:nil];
    
    NSData* data = [NSData dataWithContentsOfFile:filePath];
    
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    return dict;
    
    
}



-(NSMutableArray*)_creatChatModel:(NSDictionary*)JsonDict ModelName:(NSString*) modelName{
    
    NSMutableArray* array = [NSMutableArray array];
    NSArray* chatDictList = JsonDict[modelName];
    
    for (NSDictionary* list in chatDictList) {
        
        ChatModel* model = [[ChatModel alloc]init];
        [model setValuesForKeysWithDictionary:list];
        [array addObject:model];
        
    }
    return array;
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
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
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
