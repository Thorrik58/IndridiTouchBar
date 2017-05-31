import Cocoa

fileprivate extension NSTouchBarCustomizationIdentifier {
    static let touchBar = NSTouchBarCustomizationIdentifier("com.thorrik58.indridi")
}

fileprivate extension NSTouchBarItemIdentifier {
    static let gera = NSTouchBarItemIdentifier("A eg ad gera")
    static let alveg       = NSTouchBarItemIdentifier("Alveg")
    static let vitlaus     = NSTouchBarItemIdentifier("Vitlaus")
    static let ofnunum      = NSTouchBarItemIdentifier("Ofnunum")
    static let bank   = NSTouchBarItemIdentifier("Bank")
    static let brjaladur   = NSTouchBarItemIdentifier("😡")


}


class WindowController: NSWindowController, NSTouchBarDelegate {

    func handleSound(sender: NSButton) {
        let title = sender.title
        
        guard let sound = NSSound(named: title) else {
            return
        }
        if !sound.isPlaying{
            sound.play()
        }
    }
    
    @available(OSX 10.12.2, *)
    override func makeTouchBar() -> NSTouchBar? {
        let touchBar = NSTouchBar()
        touchBar.delegate = self
        touchBar.customizationIdentifier    = .touchBar
        touchBar.defaultItemIdentifiers     = [.gera, .vitlaus, .fixedSpaceSmall, .alveg, .ofnunum, .bank, .brjaladur]
        
        return touchBar
    }
    
    @available(OSX 10.12.2, *)
    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItemIdentifier) -> NSTouchBarItem? {
        let touchBarItem    = NSCustomTouchBarItem(identifier: identifier)
        touchBarItem.view   = NSButton(title: identifier.rawValue, target: self, action: #selector(handleSound))
        return touchBarItem
    }
}
