import UIKit
import PlaygroundSupport

var str = "Hello, playground"

let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 300))
PlaygroundPage.current.liveView = view

// set up view hierarchy
view.backgroundColor = .blue
let label = UILabel()
label.translatesAutoresizingMaskIntoConstraints = false
view.addSubview(label)
view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[label]-|", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: ["label": label]))
view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[label]-|", options: NSLayoutFormatOptions(rawValue:0), metrics: nil, views: ["label": label]))

// set up atributes
let currencyAttributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20), NSForegroundColorAttributeName: UIColor.white]
let integerAmountAttributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 30), NSForegroundColorAttributeName: UIColor.white]
let decimalAmountAttributes = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16), NSForegroundColorAttributeName: UIColor(white: 1, alpha: 0.7)]

// set up formatter
let formatter = NumberFormatter()
formatter.numberStyle = NumberFormatter.Style.currency
formatter.locale = Locale(identifier: "en_GB")

let amount = 8001.9
let text = formatter.string(from: NSNumber(value: amount))!
let nsText = text as NSString

// calculate ranges
let currencyRange = NSRange(location: 0, length: 1)
let decimalPointRange = nsText.range(of: ".")
var integerAmountLocation = currencyRange.location + currencyRange.length
var integerAmountLength = decimalPointRange.location - integerAmountLocation
var integerAmountRange = NSRange(location: integerAmountLocation, length: integerAmountLength)

// configure attributed string
var attributedText = NSMutableAttributedString(string: text, attributes: decimalAmountAttributes)
attributedText.setAttributes(currencyAttributes, range: currencyRange)
attributedText.setAttributes(integerAmountAttributes, range: integerAmountRange)

label.attributedText = attributedText
