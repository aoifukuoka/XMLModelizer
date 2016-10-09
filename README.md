# XMLModelizer

[![Version](https://img.shields.io/cocoapods/v/XMLModelizer.svg?style=flat)](http://cocoapods.org/pods/XMLModelizer)
[![License](https://img.shields.io/cocoapods/l/XMLModelizer.svg?style=flat)](http://cocoapods.org/pods/XMLModelizer)
[![Platform](https://img.shields.io/cocoapods/p/XMLModelizer.svg?style=flat)](http://cocoapods.org/pods/XMLModelizer)

![sample](https://github.com/aoifukuoka/XMLModelizer/raw/master/sample.gif)  

[japanese README](http://qiita.com/aoifukuoka/items/936fb2f9c631d26ad770)

**XMLModelizer** is a simple XML Parser and Modelizer.  
Once you give model class and XML URL to **XMLModelizer**, you can get model instances that have XML elements which you need.  

## Example

In case you want to get `title`, `link`, `content:media`, `category`, and `pubDate` values of each item tag in the xml below.

```xml
<rss xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:media="http://search.yahoo.com/mrss/" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:nyt="http://www.nytimes.com/namespaces/rss/2.0" version="2.0">
    <channel>
        <item>
            <title>
                Xi Jinping May Delay Picking China’s Next Leader, Stoking Speculation
            </title>
            <link>
                http://www.nytimes.com/2016/10/05/world/asia/china-president-xi-jinping-successor.html?partner=rss&emc=rss
            </link>
            <guid isPermaLink="true">
                http://www.nytimes.com/2016/10/05/world/asia/china-president-xi-jinping-successor.html
            </guid>
            <atom:link rel="standout" href="http://www.nytimes.com/2016/10/05/world/asia/china-president-xi-jinping-successor.html?partner=rss&emc=rss"/>
            <media:content url="https://static01.nyt.com/images/2016/10/03/world/04CHINA-XI-web1/04CHINA-XI-web1-moth.jpg" medium="image" height="151" width="151"/>
            <media:description>
                President Xi Jinping of China during a ceremony observing Martyrs’ Day, a holiday that memorializes Chinese who died in battle against foreign powers, at Tiananmen Square in Beijing last week.
            </media:description>
            <media:credit>Mark Schiefelbein/Associated Press</media:credit>
            <description>
                The apparent plan by the Chinese president has unsettled the party elite and created uncertainty over whether Mr. Xi will try to stay in power beyond the usual two terms.
            </description>
            <dc:creator>CHRIS BUCKLEY</dc:creator>
            <pubDate>Tue, 04 Oct 2016 23:59:10 GMT</pubDate>
            <category domain="http://www.nytimes.com/namespaces/keywords/nyt_per">Xi Jinping</category>
            <category domain="http://www.nytimes.com/namespaces/keywords/nyt_org_all">Communist Party of China</category>
            <category domain="http://www.nytimes.com/namespaces/keywords/nyt_geo">China</category>
            <category domain="http://www.nytimes.com/namespaces/keywords/des">Appointments and Executive Changes</category>
            <category domain="http://www.nytimes.com/namespaces/keywords/nyt_per">Li Keqiang</category>
            <category domain="http://www.nytimes.com/namespaces/keywords/nyt_org_all">
                Politburo Standing Committee of the Communist Party of China
            </category>
        </item>
        <item>...
```



**First**, define your custom model extends `XMLModelizerModel` and override `xmlModelizerXpathKeyMap` function and add properties you want.

```Swift

import XMLModelizer

class NYTimesArticle: XMLModelizerModel {
    
    //Add properties you want to get from xml.
    var title: [String]! // please define properties as [String]!
    var link: [String]!
    var media: [String]!
    var category: [String]!
    var pubDate: [String]!
    
    //Please define xpath to get contents of xml.
    //In dictionary, key is your property, and value is xpath of its key.
    // [property : xpath]
    override class func xmlModelizerXpathKeyMap() -> [String:String] {
        return [
            "title":"//item/title",
            "link":"//item/link",
            "media":"//item/media:content/@url",
            "category":"//item/category",
            "pubDate":"//item/pubDate",
        ]
    }
}
```

**Finally**, you can get `Array<NYTimesArticle>` by
```Swift
import XMLModelizer
// open static func modelize(modelClass: XMLModelizerModel.Type, urlString: String) -> [AnyObject]
let nytimesArticles: Array<NYTimesArticle> = XMLModelizer.modelize(NYTimesArticle.self, "http://rss.nytimes.com/services/xml/rss/nyt/World.xml")

let article: NYTimesArticle = nytimesArticles.first
print(article.title.first) // "Xi Jinping May Delay Picking China’s Next Leader, Stoking Speculation"
print(article.category[1])// "Communist Party of China"

```

## Note

If you get error `“Use Legacy Swift Language Version” (SWIFT_VERSION) is required to be configured correctly for targets which use Swift. Use the [Edit > Convert > To Current Swift Syntax…] menu to choose a Swift version or use the Build Settings editor to configure the build setting directly.` in Xcode8, please set XMLModelizer's plist's “Use Legacy Swift Language Version” **No** in your Pods project.

## Requirements

iOS 8.0 or above.

## Installation

**XMLModelizer** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "XMLModelizer"
```

## Author

Aoi Fukuoka, aoponaopon85746@gmail.com

## License

XMLModelizer is available under the MIT license. See the LICENSE file for more info.
