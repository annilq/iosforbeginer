## 精通iOS开发（第六版）小记
1. 所有的UIView子类都有tag属性,可以用来检索子视图
```obejective-c
    UIView *redView = [[UIView alloc]initWithFrame:CGRectZero;
    redView.tag = 1000;
    [self.window addSubview:redView];
    UIView *getView = [self.window viewWithTag:1000];
```
2. 从storyboard中加载controller(参考第12章)
```
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SettingController *settingVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"settingVC"];
    [settingVC setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    
    [self presentViewController:settingVC animated:YES completion:nil];

```
3. 弹出指定样式的modal controller
```
LanguageListController *lanCon=[[LanguageListController alloc] init];
lanCon.detailViewController=self;
lanCon.modalPresentationStyle                   = UIModalPresentationPopover;
lanCon.popoverPresentationController.barButtonItem = self.languageButton;
[self presentViewController:lanCon animated:YES completion:nil];
```
4. 本地化
    1. [iOS的Internationalization和localization](https://www.jianshu.com/p/ec7065083a0c)
    2. [Localizing Your App](https://developer.apple.com/library/archive/documentation/MacOSX/Conceptual/BPInternational/LocalizingYourApp/LocalizingYourApp.html)
5. 视频音频
    1. [音频视频播放](https://www.jianshu.com/p/3fd369524622)
6. gcd相关
    1. [block中使用weakSelf/strongSelf](http://blog.lessfun.com/blog/2014/11/22/when-should-use-weakself-and-strongself-in-objc-block/)
    ```
    - (void)makeAsyncNetworkCall
    {
     __weak typeof(self) weakSelf = self;
    [self.networkService performAsyncNetworkCallWithCompletion:^{
        typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        dispatch_async(dispatch_get_main_queue(), ^{
                [strongSelf.activityIndicatorView stopAnimating];
            }
        });
        }];
    }
    ```
7. 各个组件默认高度
    1. ```statusbar```:20
    2. ```navigationbar``` :44
    3. ```UISegmentedControl``` :44
    4. ```tabbar``` :49

8. UIView通过给UIView的layer新增layer来为UIView新增bolder
```
CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame =CGRectMake(0, userinput.frame.size.height , userinput.frame.size.width, 1);
    bottomBorder.backgroundColor = bdcolor.CGColor;
    [userinput.layer addSublayer:bottomBorder];
```
9. 给UIView设置圆角
```
- (void)setupView
{
    self.clipsToBounds = YES;
    self.layer.cornerRadius = self.bounds.size.width / 2;
    self.layer.borderWidth = 3;
    self.layer.borderColor = [UIColor darkGrayColor].CGColor;
}
```
410 在其他view controller中改变当前app 的rootViewcontroller
    1. 通过如下代码解决
    ```
    mainViewController *main=[[mainViewController alloc] init];
    UINavigationController *Maincon= [[UINavigationController alloc] initWithRootViewController:main];
    AppDelegate *app=[[UIApplication sharedApplication] delegate];
    app.window.rootViewController=Maincon;
    ```

11. 为UIImageView添加Tap手势
```
UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    imageView.image=[UIImageimageNamed:@"filter_laozhaopian_a.png"];
    imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizeralloc] initWithTarget:selfaction:@selector(UesrClicked:)];
    [imageView addGestureRecognizer:singleTap];
    [singleTap release];
    [self.view addSubview:imageView];
```
12. 与后台交互后回到主进程
```
dispatch_async(dispatch_get_main_queue(), ^{

});
```

13. block的定义与使用
```
void (^printBlock)(NSString *x) = ^(NSString* str){
            NSLog(@"print:%@", str);
    };
+(void) getDataFrom:(NSString*)httpurl withParams:(NSDictionary *)params andBlock:(void (^)(NSDictionary *))success{}
 [AppUtil getDataFrom:urlString withParams:nil andBlock:^(NSDictionary *data) {
        self.catlists=[data valueForKey:@"result"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView reloadData];
        });
    }];
```