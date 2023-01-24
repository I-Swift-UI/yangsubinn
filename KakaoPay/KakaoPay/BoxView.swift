//
//  BoxView.swift
//  KakaoPay
//
//  Created by 양수빈 on 2023/01/22.
//

import SwiftUI

enum BoxType {
    case large
    case normal
    case recentPayment
}

struct BoxView: View {
    var title: String
    var subTitle: String
    var boxType: BoxType
    var largeImageSize: CGFloat = 40
    var smallImageSize: CGFloat = 30
    
    var body: some View {
        GeometryReader { geometryProxy in
            VStack(alignment: .leading, content: {
                Text(title)
                    .font(boxType == .normal ? .headline:  .system(size: 26).bold())
                    .foregroundColor(boxType == .large ? .black : .white)
                    .offset(x: 10)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 1, trailing: 0))
                
                Text(subTitle)
                    .font(.subheadline)
                    .foregroundColor(boxType == .large ? Color.gray : Color.white.opacity(0.5))
                    .offset(x: 10)
                
                VStack(alignment: .trailing, content: {
                    Image(systemName: "camera")
                        .resizable()
                        .scaledToFit()
                        .frame(width: boxType == .large ? largeImageSize : smallImageSize,
                               height: boxType == .large ? largeImageSize : smallImageSize)
                        .foregroundColor(Color.white.opacity(0.5))
                })
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .bottomTrailing
                )
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 16))
            })
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .background(boxType == .large ? Color.yellow : Color.black)
        }
    }
}

struct BoxModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(12)
            .shadow(color: Color(.systemGray4), radius: 8)
    }
}

struct BoxView_Previews: PreviewProvider {
    static var previews: some View {
        BoxView(title: "선택하기", subTitle: "니ㅑ항", boxType: .normal)
        BoxView(title: "선택하기", subTitle: "ㅇㅇ하ㅓ나ㅓ", boxType: .recentPayment)
        BoxView(title: "3,400원", subTitle: "카카오페이머니", boxType: .large)
    }
}
