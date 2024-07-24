import SwiftUI
import TweenKit

struct SunAndMoonExampleView: View {
    @State private var sunOnScreenAmount: CGFloat = 0.0
    @State private var moonOnScreenAmount: CGFloat = 0.0
    @State private var backgroundColorTop = Color(red: 0.263, green: 0.118, blue: 0.565)
    @State private var backgroundColorBottom = Color(red: 1.000, green: 0.357, blue: 0.525)
    @State private var sunRadius: CGFloat = 50
    @State private var sunSideSpokeSize: CGFloat = 1
    @State private var navigateToNewView: Bool = false

    private let scheduler = ActionScheduler(automaticallyAdvanceTime: true)
    private var actionScrubber: ActionScrubber?

    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    if navigateToNewView {
                        NavigationLink(destination: ContentView(), isActive: $navigateToNewView) {
                            EmptyView()
                        }
                    } else {
                        LinearGradient(gradient: Gradient(colors: [self.backgroundColorTop, self.backgroundColorBottom]),
                                       startPoint: .top,
                                       endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
                        
                        Image("sun")
                            .resizable()
                            .frame(width: self.sunRadius * 2, height: self.sunRadius * 2)
                            .position(self.sunPosition(in: geometry.size))
                        
                        Image("moon")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .position(self.moonPosition(in: geometry.size))
                    }
                }
                .animation(Animation.linear(duration: 2).repeatForever(autoreverses: true))
                .onAppear {
                    self.startAnimations()
                }
            }
          
        }
    }

    private func sunPosition(in size: CGSize) -> CGPoint {
        let maxValue = CGPoint(x: size.width / 2, y: size.height / 2)
        let minValue = CGPoint(x: size.width / 2, y: size.height + sunRadius + 50)
        return minValue.lerp(t: Double(self.sunOnScreenAmount), end: maxValue)
    }

    private func moonPosition(in size: CGSize) -> CGPoint {
        let maxValue = CGPoint(x: size.width / 2, y: size.height / 2)
        let minValue = CGPoint(x: size.width / 2, y: size.height + 100)
        return minValue.lerp(t: Double(self.moonOnScreenAmount), end: maxValue)
    }

    private func startAnimations() {
        let moonAppear = makeMoonAction().reversed()
        let sunAppear = makeSunAction()
        let sequence = ActionSequence(actions: moonAppear, sunAppear)

        let animationSequence = sequence.yoyo().repeatedForever()
        
        // Schedule the animation
        scheduler.run(action: animationSequence)
        
        // Schedule a change to navigateToNewView after the animation duration
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
            self.navigateToNewView = true
        }
    }

    private func makeSunAction() -> FiniteTimeAction {
        let duration = 2.0
        
        let moveSunOnScreen = InterpolationAction(from: CGFloat(0.0),
                                                  to: CGFloat(1.0),
                                                  duration: duration,
                                                  easing: .exponentialOut) { self.sunOnScreenAmount = $0; self.sunSideSpokeSize = $0 }
        
        let changeBackgroundColorTop = InterpolationAction(from: UIColor(red: 0.263, green: 0.118, blue: 0.565, alpha: 1.00),
                                                           to: UIColor(red: 0.118, green: 0.376, blue: 0.682, alpha: 1.00),
                                                           duration: duration,
                                                           easing: .exponentialOut) { self.backgroundColorTop = Color($0) }
        
        let changeBackgroundColorBottom = InterpolationAction(from: UIColor(red: 1.000, green: 0.357, blue: 0.525, alpha: 1.00),
                                                              to: UIColor(red: 0.569, green: 0.824, blue: 0.941, alpha: 1.00),
                                                              duration: duration,
                                                              easing: .exponentialOut) { self.backgroundColorBottom = Color($0) }
        
        let group = ActionGroup(actions: moveSunOnScreen, changeBackgroundColorTop, changeBackgroundColorBottom)
        
        return group
    }

    private func makeMoonAction() -> FiniteTimeAction {
        let duration = 2.0
        
        let move = InterpolationAction(from: 0.0,
                                       to: 1.0,
                                       duration: duration,
                                       easing: .exponentialOut) { self.moonOnScreenAmount = $0 }
        
        let changeBackgroundColorTop = InterpolationAction(from: UIColor(red: 0.263, green: 0.118, blue: 0.565, alpha: 1.00),
                                                           to: UIColor(red: 0.114, green: 0.082, blue: 0.133, alpha: 1.00),
                                                           duration: duration,
                                                           easing: .exponentialOut) { self.backgroundColorTop = Color($0) }
        
        let changeBackgroundColorBottom = InterpolationAction(from: UIColor(red: 1.000, green: 0.357, blue: 0.525, alpha: 1.00),
                                                              to: UIColor(red: 0.278, green: 0.122, blue: 0.494, alpha: 1.00),
                                                              duration: duration,
                                                              easing: .exponentialOut) { self.backgroundColorBottom = Color($0) }
        
        let group = ActionGroup(actions: move, changeBackgroundColorTop, changeBackgroundColorBottom)
        
        return group
    }
}

extension CGPoint {
    func lerp(t: Double, end: CGPoint) -> CGPoint {
        return CGPoint(x: CGFloat(Double(x) + (Double(end.x) - Double(x)) * t),
                       y: CGFloat(Double(y) + (Double(end.y) - Double(y)) * t))
    }
}


struct SunAndMoonExampleView_Previews: PreviewProvider {
    static var previews: some View {
        SunAndMoonExampleView()
    }
}
