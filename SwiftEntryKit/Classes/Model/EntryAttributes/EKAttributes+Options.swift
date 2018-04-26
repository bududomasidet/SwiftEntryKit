//
//  EKAttributes+Options.swift
//  SwiftEntryKit
//
//  Created by Daniel Huri on 4/22/18.
//

import Foundation

public extension EKAttributes {

    /** Additional options that could be applied to an *EKAttributes* instance */
    public struct Options {
        
        public enum Scroll {
            
            /** The scroll ability is totally disabled */
            case disabled
            
            /** The scroll in the opposite direction to the edge is disabled */
            case edgeCrossingDisabled
            
            /** The scroll abiliby is enabled */
            case enabled
            
            var isLooselyEnabled: Bool {
                return self != .disabled
            }
            
            var isEdgeCrossingDisabled: Bool {
                return self == .edgeCrossingDisabled
            }
        }
        
        /** Describes the previous entry's behavior when the current entry shows */
        public enum PopBehavior {
            
            /** Overrides the previous entry - The previous entry disappears promptly when the current one shows */
            case overriden
            
            /** Animate the previous entry - The previous entry rolls out when the current one shows.
             
             - note: This animation is applied instead of *exitAnimation* which is the default exit animation
             */
            case animated(animation: Animation)
            
            public var isOverriden: Bool {
                switch self {
                case .overriden:
                    return true
                default:
                    return false
                }
            }
        }
        
        /** Describes the previous entry behaviour when the current entry shows
         */
        public var popBehavior = PopBehavior.animated(animation: Animation(duration: 0.6, types: [.scaleDefault]))
        
        /** Describes the scrolling behavior of the entry */
        public var scroll = Scroll.enabled
        
        
        /** Haptic notification feedback. */
        public var useHapticFeedback = true
    }
}
