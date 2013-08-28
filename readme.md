# AutoScrollTextView

Automatic scrolling ``UITextView`` subclass

## Installation

```
pod 'AutoScrollTextView', :git => "https://github.com/azu/AutoScrollTextView.git"
```

## Usage

``` objc
- (void)viewDidLoad {
    [super viewDidLoad];
    // setting
    self.autoScrollTextView.scrollingDelegate = self;
    self.autoScrollTextView.scrollingIncrement = 1;
}

- (void)viewWillAppear:(BOOL) animated {
    [super viewWillAppear:animated];
    // start auto scrolling
    [self.autoScrollTextView startAutoScroll];
}

- (void)willBeginScroll:(AutoScrollTextView *) scrollTextView {
    NSLog(@"willBeginScroll: %@", scrollTextView);
}

- (void)didEndScroll:(AutoScrollTextView *) scrollTextView {
    NSLog(@"didEndScroll: %@", scrollTextView);
}
```

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request :D

## License

MIT