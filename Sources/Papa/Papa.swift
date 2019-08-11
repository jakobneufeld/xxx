public protocol PapaDelegate {
    func didShout(word: BadWordEnum)
    func didTalk()
    func didInteract(action: PapaAction)
    func didSay(text: String)
}
 public protocol BadWordEnum {
    var isABadWord: Bool{get}
}
public indirect enum BadWord: BadWordEnum{
    public var isABadWord: Bool{return true}
    case s
    case f
    case combi(BadWord, BadWord)
    case none
    
}
public enum PapaAction {
    case hit
    case shout
    case none
}
public struct Papa {
    var name: String
    var coname: String
    var delegate: PapaDelegate?
    func talk() {
        delegate?.didTalk()
        switch Int.random(in: 1...3) {
        case 1: saySomething()
        case 2: shout()
        case 3: interact()
        default:
            break
        }
    }
    func shout() {
        delegate?.didShout(word: BadWord.f)
    }
    func saySomething() {
        delegate?.didSay(text: "Mystery, Of The Hicksos")
    }
    func interact() {
        delegate?.didInteract(action: .hit)
    }
    
}

