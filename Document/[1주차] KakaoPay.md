## 1주차 카카오페이💰

[전체 코드](https://github.com/I-Swift-UI/yangsubinn/tree/main/KakaoPay/KakaoPay)

| 구현하려던 UI | 구현한 UI(BoxLayout) | 추가 구현한 UI(BoxRowLayout) | 추가 구현한 UI(BoxGridLayout) |
|--|--|--|--|
| <img src="https://user-images.githubusercontent.com/81167570/214290079-0619d26a-6466-4c1d-b72d-6cac74c3e6fe.jpg" width=300 /> | <img width="300" alt="스크린샷 2023-01-25 오후 11 45 07" src="https://user-images.githubusercontent.com/81167570/214593710-91c38ff3-ae1f-40f6-8dfb-7436eeba782d.png"> | <img width="300" alt="스크린샷 2023-01-25 오후 11 45 56" src="https://user-images.githubusercontent.com/81167570/214593892-b2bd00a7-d655-473c-b00c-b052ba5e27e4.png"> |  <img width="300" alt="스크린샷 2023-01-25 오후 11 46 26" src="https://user-images.githubusercontent.com/81167570/214594013-dcdc0df0-3f40-4482-a8e3-8669406f62f5.png">  |



### 1️⃣ BoxView
BoxView를 BoxType으로 나누어 UI 적용

```swift
enum BoxType {
    case large // 노랑색, 금액 나오는 가장 큰 박스
    case normal // 검정색, 작은 박스
    case recentPayment // 검정색, 하단 가장 최근 결제
}
```

```swift
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
                        .frame(width: boxType == .large ? largeImageSize : smallImageSize, height: boxType == .large ? largeImageSize : smallImageSize)
                        .foregroundColor(Color.white.opacity(0.5))
                })
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .bottomTrailing
                )
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 16, trailing: 16))
            })
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .topLeading
            )
            .background(boxType == .large ? Color.yellow : Color.black)
        }
    }
}

// BoxView 자체에 radius와 shadow를 주기 위한 modifier
struct BoxModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(12)
            .shadow(color: Color(.systemGray4), radius: 8)
    }
}
```

### 2️⃣ contentView 안에서 레이아웃 적용

stack뷰의 조합으로 만들어보려 했는데, 각각의 frame 사이즈를 이런 직접적으로 적용하는건 비효율적인 것 같아서 Layout으로 수정    
<img width="300" alt="스크린샷 2023-01-24 오후 3 53 58" src="https://user-images.githubusercontent.com/81167570/214289364-0d53c87e-da5d-4cdb-a330-b0b46e460755.png">

```swift
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
```

### 3️⃣ Layout 커스텀

[WWDC 영상](https://developer.apple.com/videos/play/wwdc2022/10056/?time=709) 참고

*iOS 16.0부터 사용 가능     
<img width="697" alt="스크린샷 2023-01-24 오후 8 52 07" src="https://user-images.githubusercontent.com/81167570/214289521-19b16ea0-6d3c-4884-b9e2-3284ff025a4a.png">

```swift
BoxLayout {
    BoxView(title: "4,200원", subTitle: "카카오페이머니", boxType: .large).modifier(BoxModifier())
    BoxView(title: "선택하기", subTitle: "송금", boxType: .normal).modifier(BoxModifier())
    BoxView(title: "선택하기", subTitle: "결제", boxType: .normal).modifier(BoxModifier())
    BoxView(title: "iTunes&App Store", subTitle: "3,000원", boxType: .recentPayment).modifier(BoxModifier())
}
.padding()
.frame(height: 420)
```

### 4️⃣ 추가 Layout 커스텀

#### BoxRowLayout
<img width="300" alt="스크린샷 2023-01-25 오후 11 45 56" src="https://user-images.githubusercontent.com/81167570/214593892-b2bd00a7-d655-473c-b00c-b052ba5e27e4.png">

```swift
struct BoxRowLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard !subviews.isEmpty else { return }
        
        let subviewsCount: CGFloat = 3
        
        let spacing: CGFloat = 10
        let size = CGSize(width: (bounds.width - spacing * 2) / subviewsCount, height: bounds.height)
        
        var x = bounds.minX
        
        for index in subviews.indices {
            subviews[index].place(at: CGPoint(x: x, y: bounds.minY),
                                  anchor: .topLeading,
                                  proposal: ProposedViewSize(size))
            x += size.width + spacing
        }
    }
}
```

```swift
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
```


#### BoxGridLayout
<img width="300" alt="스크린샷 2023-01-26 오전 12 01 18" src="https://user-images.githubusercontent.com/81167570/214597768-621ab6c8-af35-475a-a5c3-5920e55770c4.png"> <img width="300" alt="스크린샷 2023-01-26 오전 12 03 33" src="https://user-images.githubusercontent.com/81167570/214598211-696d5234-3145-48ac-a2bb-3aaf63bd122c.png">



```swift
struct BoxGridLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        proposal.replacingUnspecifiedDimensions()
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        guard !subviews.isEmpty else { return }
        
        let rowitemCount = 3
        let spacing: CGFloat = 10
        let length = (bounds.width - spacing * CGFloat((rowitemCount - 1))) / CGFloat(rowitemCount)
        
        var x = bounds.minX
        var y = bounds.minY
        
        for index in subviews.indices {
            subviews[index].place(at: CGPoint(x: x, y: y),
                                  anchor: .topLeading,
                                  proposal: ProposedViewSize(CGSize(width: length, height: length)))
            if index % rowitemCount == rowitemCount - 1 {
                x = bounds.minX
                y += length + spacing
            } else {
                x += length + spacing
            }
        }
    }
}

```

```swift
BoxGridLayout {
    BoxView(title: "선택하기", subTitle: "송금", boxType: .normal).modifier(BoxModifier())
    BoxView(title: "선택하기", subTitle: "결제", boxType: .normal).modifier(BoxModifier())
    BoxView(title: "iTunes&App Store", subTitle: "3,000원", boxType: .normal).modifier(BoxModifier())
    BoxView(title: "선택하기", subTitle: "송금", boxType: .normal).modifier(BoxModifier())
    BoxView(title: "선택하기", subTitle: "결제", boxType: .normal).modifier(BoxModifier())
    BoxView(title: "iTunes&App Store", subTitle: "3,000원", boxType: .normal).modifier(BoxModifier())
    BoxView(title: "선택하기", subTitle: "결제", boxType: .normal).modifier(BoxModifier())
}
.padding()
```


