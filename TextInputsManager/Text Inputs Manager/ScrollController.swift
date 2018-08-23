//
//  ScrollController.swift
//  SKTextInputsManager
//
//  Created by Sergey on 23.08.2018.
//

import UIKit

final class ScrollController: ContainerControlling {
    
    private var scroll: UIScrollView
    
    init(scroll: UIScrollView) {
        self.scroll = scroll
    }
    
    // MARK: - ViewManipulating -
    
    func moveTo(_ responder: UIView, keyboardFrame rect: CGRect, spaceAboveKeyboard: CGFloat) {
        var frame = scroll.convert(responder.bounds, from: responder)
        frame.origin.y += spaceAboveKeyboard
        scroll.scrollRectToVisible(frame, animated: false)
    }
    
    func handleKeyboardAppearance(keyboardFrame rect: CGRect, spaceAboveKeyboard: CGFloat) {
        let bottomInset = rect.height - scroll.distanceToBottomOfScreen + spaceAboveKeyboard
        scroll.contentInset.bottom = bottomInset
    }
    
    func handleKeyboardDisappearance() {
        scroll.contentInset.bottom = 0
    }
    
}
