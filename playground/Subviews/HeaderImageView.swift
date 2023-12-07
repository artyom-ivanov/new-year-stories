import SwiftUI

enum HeaderImageType {
    case clock, water, bottle, hand, compass, calendar, avocado, watermelon, nut
}

struct HeaderImageView: View {
    let imageType: HeaderImageType
    @Binding var show: Bool
    @State private var loop1 = false
    @State private var loop2 = false
    @State private var loop3 = false

    var body: some View {
        Rectangle()
            .foregroundStyle(.clear)
            .overlay(
                ZStack {
                    switch imageType {
                    case .compass:
                        Group {
                            Group {
                                Image("compass_left_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 157, height: 166)
                                    .scaleEffect(loop3 ? 0.95 : 1)
                            }
                            .offset(x: -168, y: -94)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)
                            
                            Group {
                                Image("compass_left_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 206, height: 182)
                                    .scaleEffect(loop1 ? 0.9 : 1)
                            }
                            .offset(x: loop2 ? -170 : -160, y: loop3 ? 90 : 94)
                            .rotationEffect(.degrees(loop1 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)
                            
                            Group {
                                Image("compass_right_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 352, height: 203)
                                    .scaleEffect(loop1 ? 1 : 0.9)
                            }
                            .offset(x: loop2 ? 50 : 60, y: loop3 ? -80 : -82)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)
                            
                            Group {
                                Image("compass_right_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 113, height: 106)
                                    .scaleEffect(loop2 ? 0.95 : 1)
                            }
                            .offset(x: 130, y: 136)
                            .rotationEffect(.degrees(loop2 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)
                            
                            Image("compass_body")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 248, height: 337)
                                .scaleEffect(show ? 1 : 0)
                                .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.4), value: show)
                                .rotationEffect(.degrees(loop2 ? 2 : -1))
                            
                            Group {
                                Image("compass_arrow")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 184, height: 74)
                                    .rotationEffect(.degrees(loop1 ? -5 : 5))
                            }
                            .scaleEffect(show ? 1 : 0)
                            .offset(y: 40)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.5), value: show)
                        }
                        
                    case .clock:
                        Group {
                            Group {
                                Image("clock_left_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 41, height: 47)
                                    .scaleEffect(loop3 ? 0.9 : 1)
                            }
                            .offset(x: -168, y: -94)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)
                            
                            Group {
                                Image("clock_left_top_2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 101, height: 121)
                                    .scaleEffect(loop2 ? 0.95 : 1)
                            }
                            .offset(x: -100, y: -40)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)
                            
                            Group {
                                Image("clock_left_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 297, height: 247)
                                    .scaleEffect(loop1 ? 0.9 : 1)
                            }
                            .offset(x: loop2 ? -170 : -160, y: loop3 ? 90 : 94)
                            .rotationEffect(.degrees(loop1 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)
                            
                            Group {
                                Image("clock_right_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 113, height: 107)
                                    .scaleEffect(loop3 ? 0.95 : 1)
                            }
                            .offset(x: 130, y: 144)
                            .rotationEffect(.degrees(loop2 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)
                            
                            Group {
                                Image("clock_center_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 49)
                                    .scaleEffect(loop3 ? 0.95 : 1)
                            }
                            .offset(x: 0, y: -124)
                            .rotationEffect(.degrees(loop2 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)
                            
                            Group {
                                Image("clock_right_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 303, height: 263)
                                    .scaleEffect(loop1 ? 1 : 0.9)
                            }
                            .offset(x: loop2 ? 130 : 124, y: loop3 ? -50 : -54)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)
                            
                            Image("clock_body")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 300, height: 353)
                                .offset(x: 0, y: 20)
                                .scaleEffect(show ? 1 : 0)
                                .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.4), value: show)
                                .rotationEffect(.degrees(loop1 ? 1 : -1))
                            
                            Group {
                                Image("clock_arrows")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 52, height: 135)
                                    .rotationEffect(.degrees(loop3 ? -5 : 5))
                            }
                            .scaleEffect(show ? 1 : 0)
                            .offset(x: loop1 ? -20 : -17, y: 58)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.5), value: show)
                        }
                        
                    case .water:
                        Group {
                            Group {
                                Image("water_left_top_2")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 63, height: 72)
                                    .scaleEffect(loop3 ? 0.9 : 1)
                            }
                            .offset(x: -180, y: -160)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)
                            
                            Group {
                                Image("water_left_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 145, height: 150)
                                    .scaleEffect(loop2 ? 0.95 : 1)
                            }
                            .offset(x: -110, y: -110)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)
                            
                            Group {
                                Image("water_left_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 286, height: 259)
                                    .scaleEffect(loop1 ? 0.9 : 1)
                            }
                            .offset(x: loop2 ? -140 : -144, y: loop3 ? 60 : 64)
                            .rotationEffect(.degrees(loop1 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)
                            
                            Group {
                                Image("water_right_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 106, height: 97)
                                    .scaleEffect(loop3 ? 0.95 : 1)
                            }
                            .offset(x: 120, y: 150)
                            .rotationEffect(.degrees(loop2 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)
                            
                            Group {
                                Image("water_right_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 293, height: 269)
                                    .scaleEffect(loop3 ? 0.95 : 1)
                            }
                            .offset(x: 130, y: -120)
                            .rotationEffect(.degrees(loop2 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)
                            
                            Group {
                                Image("water_left_hand")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 50)
                                    .offset(x: -128, y: 0)
                                    .rotationEffect(.degrees(!loop1 ? 4 : -1), anchor: .bottomTrailing)
                                
                                Image("water_right_hand")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 46, height: 49)
                                    .offset(x: 122, y: 0)
                                    .rotationEffect(.degrees(!loop1 ? -1 : 4), anchor: .bottomLeading)
                                
                                Image("water_body")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 233, height: 289)
                            }
                            .offset(x: 0, y: loop1 ? -10 : 10)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.4), value: show)
                        }
                        .offset(x: 0, y: 20)
                        
                    case .calendar:
                        Group {
                            Group {
                                Image("calendar_left_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 119, height: 113)
                                    .scaleEffect(loop2 ? 0.9 : 1)
                            }
                            .offset(x: -140, y: -130)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)
                            
                            Group {
                                Image("calendar_left_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 249, height: 219)
                                    .scaleEffect(loop1 ? 0.9 : 1)
                            }
                            .offset(x: loop2 ? -190 : -194, y: loop3 ? 60 : 64)
                            .rotationEffect(.degrees(loop1 ? -4 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)
                            
                            Group {
                                Image("calendar_right_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 160, height: 125)
                                    .scaleEffect(loop3 ? 0.92 : 1)
                            }
                            .offset(x: 50, y: 110)
                            .rotationEffect(.degrees(loop1 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)
                            
                            Group {
                                Image("calendar_right_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 417, height: 296)
                                    .scaleEffect(loop3 ? 0.95 : 1)
                            }
                            .offset(x: 115, y: -80)
                            .rotationEffect(.degrees(loop2 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)
                            
                            Image("calendar_body")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 290, height: 295)
                                .scaleEffect(show ? 1 : 0)
                                .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.4), value: show)
                                .rotationEffect(.degrees(loop1 ? 2 : -1))
                                .offset(x: 0, y: -20)
                        }
                        .offset(x: 0, y: 32)
                        
                    case .bottle:
                        Group {
                            Group {
                                Image("bottle_left_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 48)
                                    .scaleEffect(loop2 ? 0.9 : 1)
                            }
                            .offset(x: -140, y: -50)
                            .scaleEffect(show ? 1 : 0)
                            .rotationEffect(.degrees(loop1 ? -3 : 3))
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)
                            
                            Group {
                                Image("bottle_left_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 237, height: 222)
                                    .scaleEffect(loop1 ? 0.9 : 1)
                            }
                            .offset(x: loop2 ? -110 : -114, y: loop3 ? 78 : 74)
                            .rotationEffect(.degrees(loop1 ? -4 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)
                            
                            Group {
                                Image("bottle_right_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 139, height: 102)
                                    .scaleEffect(loop3 ? 0.92 : 1)
                            }
                            .offset(x: 130, y: 110)
                            .rotationEffect(.degrees(loop1 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)
                            
                            Group {
                                Image("bottle_right_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 426, height: 245)
                                    .scaleEffect(loop3 ? 0.95 : 1)
                            }
                            .offset(x: 75, y: -60)
                            .rotationEffect(.degrees(loop2 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)
                            
                            Group {
                                Image("bottle_body")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 234, height: 335)
                                
                                Image("bottle_hearts_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 36, height: 39)
                                    .offset(x: -16, y: 113)
                                    .scaleEffect(loop2 ? 0.9 : 1)
                                
                                Image("bottle_hearts_center")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 46)
                                    .offset(x: 4, y: 12)
                                    .scaleEffect(loop1 ? 0.9 : 1)
                                
                                Image("bottle_hearts_center")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 46)
                                    .offset(x: 58, y: -24)
                                    .scaleEffect(loop3 ? 0.9 : 1)
                                
                                Image("bottle_hearts_left_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 106, height: 188)
                                    .offset(x: -32, y: 10)
                                    .scaleEffect(loop1 ? 0.9 : 1)
                                
                                Image("bottle_hearts_right_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 179, height: 158)
                                    .offset(x: -12, y: 38)
                                    .scaleEffect(loop2 ? 0.9 : 1)
                                
                                Image("bottle_reflect")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 161, height: 51)
                                    .offset(x: 6, y: -48)
                            }
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.4), value: show)
                            .rotationEffect(.degrees(loop1 ? 2 : -1))
                        }
                        .offset(x: 0, y: 32)
                        
                    case .hand:
                        Group {
                            Group {
                                Image("hand_left_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 177, height: 126)
                                    .scaleEffect(loop2 ? 0.9 : 1)
                            }
                            .offset(x: -120, y: -30)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)
                            
                            Group {
                                Image("hand_left_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 26, height: 26)
                                    .scaleEffect(loop3 ? 0.9 : 1)
                            }
                            .offset(x: -140, y: 30)
                            .rotationEffect(.degrees(loop1 ? 5 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)
                            
                            Group {
                                Image("hand_right_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 135, height: 123)
                                    .scaleEffect(loop3 ? 0.92 : 1)
                            }
                            .offset(x: 100, y: 130)
                            .rotationEffect(.degrees(loop1 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)
                            
                            Group {
                                Image("hand_right_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 340, height: 289)
                                    .scaleEffect(loop3 ? 0.95 : 1)
                            }
                            .offset(x: 55, y: loop3 ? -100 : -110)
                            .rotationEffect(.degrees(loop2 ? -3 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)
                            
                            Image("hand_body")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 340, height: 304)
                                .scaleEffect(show ? 1 : 0)
                                .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.4), value: show)
                                .rotationEffect(.degrees(loop1 ? 2 : -1))
                                .offset(x: 0, y: loop1 ? 0 : 10)
                            
                            Image("hand_heart")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 112, height: 124)
                                .scaleEffect(show ? 1 : 0)
                                .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.4), value: show)
                                .rotationEffect(.degrees(loop2 ? 3 : -3))
                                .offset(x: 40, y: loop3 ? -90 : -110)
                        }
                        .offset(x: 0, y: 32)

                    case .avocado:
                        Group {
                            Group {
                                Image("avocado_left_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 218, height: 181)
                                    .scaleEffect(loop2 ? 0.9 : 1)
                            }
                            .offset(x: -160, y: -140)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)

                            Group {
                                Image("avocado_left_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 269, height: 243)
                                    .scaleEffect(loop3 ? 0.9 : 1)
                            }
                            .offset(x: -140, y: 30)
                            .rotationEffect(.degrees(loop1 ? 5 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)

                            Group {
                                Image("avocado_right_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 126, height: 126)
                                    .scaleEffect(loop3 ? 0.92 : 1)
                            }
                            .offset(x: 100, y: 120)
                            .rotationEffect(.degrees(loop1 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)

                            Group {
                                Image("avocado_right_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 265, height: 234)
                                    .scaleEffect(loop3 ? 0.9 : 1)
                            }
                            .offset(x: 160, y: loop3 ? -100 : -110)
                            .rotationEffect(.degrees(loop2 ? -3 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)

                            Group {
                                Image("avocado_left_hand")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 49, height: 26)
                                    .offset(x: -138, y: loop1 ? 30 : 40)
                                    .rotationEffect(.degrees(!loop1 ? 12 : -1), anchor: .bottomTrailing)

                                Image("avocado_body")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 248, height: 313)

                                Image("avocado_right_hand")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 49, height: 26)
                                    .offset(x: 134, y: loop1 ? 30 : 40)
                                    .rotationEffect(.degrees(!loop1 ? -12 : 1), anchor: .bottomLeading)
                            }
                            .offset(x: 0, y: loop1 ? -10 : 10)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.4), value: show)
                        }
                        .offset(x: 0, y: 32)

                    case .watermelon:
                        Group {
                            Group {
                                Image("avocado_left_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 218, height: 181)
                                    .scaleEffect(loop2 ? 0.9 : 1)
                            }
                            .offset(x: -120, y: -140)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)

                            Group {
                                Image("avocado_left_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 269, height: 243)
                                    .scaleEffect(loop3 ? 0.9 : 1)
                            }
                            .offset(x: -140, y: 50)
                            .rotationEffect(.degrees(loop1 ? 5 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)

                            Group {
                                Image("avocado_right_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 126, height: 126)
                                    .scaleEffect(loop3 ? 0.92 : 1)
                            }
                            .offset(x: 100, y: 100)
                            .rotationEffect(.degrees(loop1 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)

                            Group {
                                Image("avocado_right_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 265, height: 234)
                                    .scaleEffect(loop3 ? 0.9 : 1)
                            }
                            .offset(x: 160, y: loop3 ? -100 : -110)
                            .rotationEffect(.degrees(loop2 ? -3 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)

                        Image("watermelon_body")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 328, height: 308)
                            .offset(x: 10, y: loop1 ? -10 : 10)
                            .scaleEffect(show ? 1 : 0)
                            .rotationEffect(.degrees(loop2 ? -1 : 1))
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.4), value: show)
                        }
                        .offset(x: 0, y: 32)

                    case .nut:
                        Group {
                            Group {
                                Image("nut_left_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 218, height: 181)
                                    .scaleEffect(loop2 ? 0.9 : 1)
                            }
                            .offset(x: -160, y: -140)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)

                            Group {
                                Image("nut_left_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 269, height: 243)
                                    .scaleEffect(loop3 ? 0.9 : 1)
                            }
                            .offset(x: -140, y: 30)
                            .rotationEffect(.degrees(loop1 ? 5 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.15), value: show)

                            Group {
                                Image("nut_right_bottom")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 126, height: 126)
                                    .scaleEffect(loop3 ? 0.92 : 1)
                            }
                            .offset(x: 100, y: 120)
                            .rotationEffect(.degrees(loop1 ? -2 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)

                            Group {
                                Image("nut_right_top")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 340, height: 295)
                                    .scaleEffect(loop3 ? 0.9 : 1)
                            }
                            .offset(x: 160, y: loop3 ? -100 : -110)
                            .rotationEffect(.degrees(loop2 ? -3 : 0))
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.2), value: show)

                            Group {
                                Image("nut_left_hand")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 49, height: 43)
                                    .offset(x: -110, y: loop3 ? 30 : 40)
                                    .rotationEffect(.degrees(!loop3 ? 12 : -1), anchor: .bottomTrailing)

                                Image("nut_right_hand")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 49, height: 43)
                                    .offset(x: 110, y: loop3 ? 30 : 40)
                                    .rotationEffect(.degrees(!loop3 ? -12 : 1), anchor: .bottomLeading)

                                Image("nut_legs")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 67, height: 63)
                                    .offset(x: 0, y: 120)

                                Image("nut_body")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 192, height: 304)
                                    .offset(x: 0, y: loop3 ? -40 : -30)
                            }
                            .offset(x: 0, y: 0)
                            .scaleEffect(show ? 1 : 0)
                            .animation(.spring(duration: 0.5, bounce: 0.35).delay(0.4), value: show)
                        }
                        .offset(x: 0, y: 32)
                    }
                }
            )
            .onAppear {
                withAnimation(.easeInOut(duration: 1.7)
                    .repeatForever(autoreverses: true)) {
                        loop1 = true
                    }
                withAnimation(.easeInOut(duration: 1.5)
                    .repeatForever(autoreverses: true)) {
                        loop2 = true
                    }
                withAnimation(.easeInOut(duration: 1.3)
                    .repeatForever(autoreverses: true)) {
                        loop3 = true
                    }
            }
    }
}

#Preview {
    ZStack {
        Color(hex: 0xFFE6A5)
            .ignoresSafeArea()
        HeaderImageView(imageType: .avocado, show: .constant(true))
    }
}
