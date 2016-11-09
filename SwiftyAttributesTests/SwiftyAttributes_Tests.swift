//
//  SwiftyAttributesTests.swift
//  SwiftyAttributesTests
//
//  Created by Eddie Kaiger on 9/30/16.
//  Copyright © 2016 Eddie Kaiger. All rights reserved.
//

import XCTest
import SwiftyAttributes

class SwiftyAttributesTests: XCTestCase {

    func testString_withAttribute() {
        let subject = "Hello".withAttribute(.strokeWidth(4))
        let expected = NSAttributedString(string: "Hello", attributes: [NSStrokeWidthAttributeName: NSNumber(value: 4)])
        XCTAssertEqual(subject, expected)
    }
    
    func testAttribute_font() {
        let subject = "Hello".withFont(Font.boldSystemFont(ofSize: 26))
        let expected = NSAttributedString(string: "Hello", attributes: [NSFontAttributeName: Font.boldSystemFont(ofSize: 26)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_paragraphStyle() {
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 4
        style.lineBreakMode = .byTruncatingMiddle
        let subject = "Hello".withParagraphStyle(style)
        let expected = NSAttributedString(string: "Hello", attributes: [NSParagraphStyleAttributeName: style])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_textColor() {
        let subject = "Hello".withTextColor(.magenta)
        let expected = NSAttributedString(string: "Hello", attributes: [NSForegroundColorAttributeName: Color.magenta])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_backgroundColor() {
        let subject = "Hello".withBackgroundColor(.cyan)
        let expected = NSAttributedString(string: "Hello", attributes: [NSBackgroundColorAttributeName: Color.cyan])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_ligature() {
        let subject = "Hello".withLigatures(.none)
        let expected = NSAttributedString(string: "Hello", attributes: [NSLigatureAttributeName: NSNumber(value: Ligatures.none.rawValue)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_kern() {
        let subject = "Hello".withKern(12)
        let expected = NSAttributedString(string: "Hello", attributes: [NSKernAttributeName: NSNumber(value: 12)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_strikethroughStyle() {
        let subject = "Hello".withStrikethroughStyle(.patternDashDot)
        let expected = NSAttributedString(string: "Hello", attributes: [NSStrikethroughStyleAttributeName: NSNumber(value: UnderlineStyle.patternDashDot.rawValue)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_underlineStyle() {
        let subject = "Hello".withUnderlineStyle(.styleDouble)
        let expected = NSAttributedString(string: "Hello", attributes: [NSUnderlineStyleAttributeName: NSNumber(value: UnderlineStyle.styleDouble.rawValue)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_strokeColor() {
        let subject = "Hello".withStrokeColor(.orange)
        let expected = NSAttributedString(string: "Hello", attributes: [NSStrokeColorAttributeName: Color.orange])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_strokeWidth() {
        let subject = "Hello".withStrokeWidth(3.2)
        let expected = NSAttributedString(string: "Hello", attributes: [NSStrokeWidthAttributeName: NSNumber(value: 3.2)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_shadow() {
        let shadow = Shadow()
        shadow.shadowBlurRadius = 4
        shadow.shadowColor = Color.brown
        let subject = "Hello".withShadow(shadow)
        let expected = NSAttributedString(string: "Hello", attributes: [NSShadowAttributeName: shadow])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_textEffect() {
        let subject = "Hello".withTextEffect(.letterPressStyle)
        let expected = NSAttributedString(string: "Hello", attributes: [NSTextEffectAttributeName: NSTextEffectLetterpressStyle])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_attachment() {
        let attachment = TextAttachment(data: nil, ofType: nil)
        let subject = "Hello".withAttachment(attachment)
        let expected = NSAttributedString(string: "Hello", attributes: [NSAttachmentAttributeName: attachment])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_link() {
        let url = URL(string: "https://google.com")!
        let subject = "Hello".withLink(url)
        let expected = NSAttributedString(string: "Hello", attributes: [NSLinkAttributeName: url])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_baselineOffset() {
        let subject = "Hello".withBaselineOffset(5)
        let expected = NSAttributedString(string: "Hello", attributes: [NSBaselineOffsetAttributeName: NSNumber(value: 5)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_underlineColor() {
        let subject = "Hello".withUnderlineColor(.magenta)
        let expected = NSAttributedString(string: "Hello", attributes: [NSUnderlineColorAttributeName: Color.magenta])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_strikethroughColor() {
        let subject = "Hello".withStrikethroughColor(.brown)
        let expected = NSAttributedString(string: "Hello", attributes: [NSStrikethroughColorAttributeName: Color.brown])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_obliqueness() {
        let subject = "Hello".withObliqueness(4.5)
        let expected = NSAttributedString(string: "Hello", attributes: [NSObliquenessAttributeName: NSNumber(value: 4.5)])
        XCTAssertEqual(subject, expected)
    }

    func testAttribute_expansion() {
        let subject = "Hello".withExpansion(7)
        let expected = NSAttributedString(string: "Hello", attributes: [NSExpansionAttributeName: NSNumber(value: 7)])
        XCTAssertEqual(subject, expected)
    }

    func testMultipleAttributes_withSyntax() {
        let subject = "Hello".withTextColor(.darkGray).withBackgroundColor(.magenta).withStrikethroughStyle(.patternDashDotDot)
        let attrs: [String: Any] = [
            NSForegroundColorAttributeName: Color.darkGray,
            NSBackgroundColorAttributeName: Color.magenta,
            NSStrikethroughStyleAttributeName: UnderlineStyle.patternDashDotDot.rawValue
        ]
        let expected = NSAttributedString(string: "Hello", attributes: attrs)
        XCTAssertEqual(subject, expected)
    }

    func testMultipleAttributes_arraySyntax() {
        let subject = "Hello".withAttributes([.font(.boldSystemFont(ofSize: 19)), .link(URL(string: "https://google.com")!), .underlineStyle(.patternSolid)])
        let attrs: [String: Any] = [
            NSFontAttributeName: Font.boldSystemFont(ofSize: 19),
            NSLinkAttributeName: URL(string: "https://google.com")!,
            NSUnderlineStyleAttributeName: UnderlineStyle.patternSolid.rawValue
        ]
        let expected = NSAttributedString(string: "Hello", attributes: attrs)
        XCTAssertEqual(subject, expected)
    }

}
