//
//  ContentView.swift
//  KakaoPay
//
//  Created by 양수빈 on 2023/01/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Stack
        VStack {
            HStack {
                BoxView(title: "4,200원", subTitle: "카카오페이머니", boxType: .large).modifier(BoxModifier())
                    .frame(width: (UIScreen.main.bounds.width - 40)*2/3)
                VStack {
                    BoxView(title: "선택하기", subTitle: "송금", boxType: .normal).modifier(BoxModifier())
                    BoxView(title: "선택하기", subTitle: "결제", boxType: .normal).modifier(BoxModifier())
                }
            }
            BoxView(title: "iTunes&App Store", subTitle: "3,000원", boxType: .recentPayment)
                .modifier(BoxModifier())
                .frame(height: 140)
        }
        .frame(height: 420, alignment: .top)
        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        
        // BoxLayout
        BoxLayout {
            BoxView(title: "4,200원", subTitle: "카카오페이머니", boxType: .large).modifier(BoxModifier())
            BoxView(title: "선택하기", subTitle: "송금", boxType: .normal).modifier(BoxModifier())
            BoxView(title: "선택하기", subTitle: "결제", boxType: .normal).modifier(BoxModifier())
            BoxView(title: "iTunes&App Store", subTitle: "3,000원", boxType: .recentPayment).modifier(BoxModifier())
        }
        .padding()
        .frame(height: 420)
        
        // BoxRowLayout
        VStack(spacing: 10) {
            BoxView(title: "16P", subTitle: "카카오페이포인트", boxType: .recentPayment).modifier(BoxModifier())
                .frame(height: 140)
            BoxRowLayout {
                BoxView(title: "선택하기", subTitle: "송금", boxType: .normal).modifier(BoxModifier())
                BoxView(title: "선택하기", subTitle: "결제", boxType: .normal).modifier(BoxModifier())
                BoxView(title: "iTunes&App Store", subTitle: "3,000원", boxType: .normal).modifier(BoxModifier())
            }
            .frame(height: 140)
            BoxRowLayout {
                BoxView(title: "선택하기", subTitle: "송금", boxType: .normal).modifier(BoxModifier())
                BoxView(title: "선택하기", subTitle: "결제", boxType: .normal).modifier(BoxModifier())
                BoxView(title: "iTunes&App Store", subTitle: "3,000원", boxType: .normal).modifier(BoxModifier())
            }
            .frame(height: 140)
        }
        .padding()
        
        // BoxGridLayout
        BoxGridLayout(rowitemCount: 3) {
            BoxView(title: "선택하기", subTitle: "송금", boxType: .normal).modifier(BoxModifier())
            BoxView(title: "선택하기", subTitle: "결제", boxType: .normal).modifier(BoxModifier())
            BoxView(title: "iTunes&App Store", subTitle: "3,000원", boxType: .normal).modifier(BoxModifier())
            BoxView(title: "선택하기", subTitle: "송금", boxType: .normal).modifier(BoxModifier())
            BoxView(title: "선택하기", subTitle: "결제", boxType: .normal).modifier(BoxModifier())
            BoxView(title: "iTunes&App Store", subTitle: "3,000원", boxType: .normal).modifier(BoxModifier())
            BoxView(title: "선택하기", subTitle: "결제", boxType: .normal).modifier(BoxModifier())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
