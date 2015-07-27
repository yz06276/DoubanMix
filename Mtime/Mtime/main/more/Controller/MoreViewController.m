//
//  MoreViewController.m
//  Mtime
//
//  Created by Mee Leo on 17/7/15.
//  Copyright (c) 2015年 Mee Leo. All rights reserved.
//

#import "MoreViewController.h"
#import "SDImageCache.h"
@interface MoreViewController ()<UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self _creatTableView];

    
    
//    NSFileManager* manager = [[NSFileManager alloc]init];
//    NSString* homePath = NSHomeDirectory();
//    NSString* tmpPath = [homePath stringByAppendingPathComponent:@"tmp"];
//    
//    NSDictionary* attr = [manager attributesOfItemAtPath:tmpPath error:nil];
//    NSLog(@"%@",attr);
//    
  
    
    // Do any additional setup after loading the view.
}

-(void)_creatTableView{
    
        UITableView* moreTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    moreTableView.delegate = self;
    moreTableView.dataSource = self;
    [self.view  addSubview:moreTableView];
 
    _moreTableView = moreTableView;
    moreTableView.backgroundColor = [UIColor clearColor];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"moreCell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"moreCell"];
        UIImageView* icon = [[UIImageView alloc]initWithFrame:CGRectMake(15, 15, 40, 40)];
        icon.backgroundColor = [UIColor lightGrayColor];
        
        UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(75, 15, 100, 40)];
        _label = label;
    label.textColor = [UIColor whiteColor];
        [cell.contentView addSubview:icon];
        [cell.contentView addSubview:label];
    cell.backgroundColor = [UIColor clearColor];

        if (indexPath.row == 0) {
            
            UILabel* cacheLabel = [[UILabel alloc]initWithFrame:CGRectMake(Swidth-100, 20, 100, 40)];
            cacheLabel.textColor = [UIColor whiteColor];
            [cell.contentView addSubview:cacheLabel];
            _cacheLabel = cacheLabel;

        }
        
    }
    
   const NSArray* array = @[@"清除缓存",@"给个评价",@"检查新版本",@"商务合作",@"欢迎页",@"关于"];
    _label.text = array[indexPath.row];
    if (indexPath.row == 0) {
        SDImageCache* cache = [SDImageCache sharedImageCache];
        _cache = cache;
        float cacheSize =[cache getSize]/1000000;
        NSLog(@"%.3f",cacheSize);
        self.cacheSize = cacheSize;
        _cacheLabel.text = [NSString stringWithFormat:@"%.2f MB",cacheSize];
    }
    
    return cell;
    
}
-(void)viewWillAppear:(BOOL)animated{
    
    [_moreTableView reloadData];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        UIAlertView* alert = [[UIAlertView alloc]initWithTitle:@"清除缓存" message: [NSString stringWithFormat:@"当前缓存为%.2f MB ,是否要清除?",_cacheSize] delegate: self cancelButtonTitle:@"取消" otherButtonTitles:@"好", nil];
        [alert show];
        
    }
    
}


-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    [_cache clearDisk];
    
    [_moreTableView reloadData];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
