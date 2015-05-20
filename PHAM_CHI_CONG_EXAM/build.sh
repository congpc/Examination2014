#!/bin/sh
# First Run Tests
xcodebuild test -project PHAM_CHI_CONG.xcodeproj/ -scheme 'PHAM_CHI_CONG' -configuration Debug -destination 'platform=iOS Simulator,name=iPhone 6,OS=8.3' | xcpretty -c --report junit

#Above we're piping output through xcpretty, which is not required but very nice!
#(gem install xcpretty)

#Using locally
#curl -SSL http://frankencover.it/with > frankencover && chmod +x frankencover

# Now Produce Test Coverage Report
#groovy http://frankencover.it/with -source-dir PHAM_CHI_CONG/Classes -required-coverage 80
groovy frankencover -source-dir "PHAM_CHI_CONG" -required-coverage 80
#frankencover && chmod +x frankencover
#We set required coverage to 85% - build fails if coverage falls below this value.