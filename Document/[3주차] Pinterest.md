## 3주차 핀터레스트

[전체 코드](https://github.com/I-Swift-UI/yangsubinn/tree/main/Pintereest/Pintereest)

![ezgif com-gif-maker - 2023-02-06T161209 066](https://user-images.githubusercontent.com/81167570/217528784-a8167d7c-ae56-45ee-a1cd-01eefcb3d708.gif)

### Layout
`ContentView` > ScrollView
- `LayoutView` > HStack > ScrollView + ScrollView (scroll disable) 
    - `ItemView` > Image + Text


### @State
State(상태)가 변하면 뷰를 다시 그림
- 뷰 내부에서만 사용할 수 있기 때문에 private 선언
- 하위 뷰나 다른 뷰에서 참조하기 위해선 @Binding 필요

### @State를 사용하는 이유
swiftUI에서 View 안의 body는 immutable한 요소
- get-only이기 때문에 안에 있는 요소의 값(내용)을 수정할 수 없음 `Cannot assign to property: 'self' is immutable`
- body 안에 사용될 내용을 수정하고 싶다면 @State 으로 선언해서, 값이 변경될 경우 뷰를 다시 그리도록 함

### @Binding
- 상위 뷰의 요소를 받아서 사용하기 위한 프로퍼티 앞에 선언
    - 상위 뷰와 하위 뷰가 하나의 값을 공유하며, 한 뷰에서 값이 변경되면 다른 뷰에서도 값이 변경되는 그런 환경에서 쓰임
- @State와 마찬가지로 @Binding을 붙일 경우, mutable 해져 값을 변동할 수 있음



ex1) 상위 뷰: [ContentView](https://github.com/I-Swift-UI/yangsubinn/blob/main/Pintereest/Pintereest/View/ContentView.swift) / 하위 뷰: [LayoutView](https://github.com/I-Swift-UI/yangsubinn/blob/main/Pintereest/Pintereest/View/LayoutView.swift)
```swift
struct contentView: View {

		@State private var imageList: [ItemModel] = []

		...

		var body: some View {
				LayoutView(data: $imageList)
		}		
}

struct LayoutView: View {

		@Binding var data: [ItemModel]

		...

		var body: some View {
				ItemView(itme: data)
		}
}
```






ex2) 상위 뷰: MemoListView / 하위 뷰: MemoDetailView    
- 상위 뷰에서 텍스트가 변하면 하위 뷰에서도 값이 변경되고 반대의 경우도 변경사항이 반영됨    
![ezgif com-resize](https://user-images.githubusercontent.com/81167570/217530051-26d192de-963d-4575-bdb2-61743c7feeb3.gif)

- MemoListView
    ```swift
    struct MemoListView: View {
        
        @State var presenting = false
        @State var placeholder = "안녕하세요"
        
        var body: some View {
            VStack {
                TextEditor(text: $placeholder)
                    .foregroundColor(Color.blue)
                    .font(.title)
                    .disabled(true)
                
                TextEditor(text: $placeholder)
                    .font(.title)
                    .foregroundColor(Color.black)
                Spacer()
                
                Button(action: {
                    self.presenting = true
                }, label: {
                    Text("바뀐 문구 확인")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding()
                })
                .background(Color.blue)
                .sheet(isPresented: self.$presenting) {
                    MemoDetailView(text: $placeholder)
                }
            }
            .padding()
        }
    }
    ```
    
- MemoDetailView
    ```swift
    struct MemoDetailView: View {
        
        @Binding var text: String
        
        var body: some View {
            TextEditor(text: $text)
                .font(.title)
                .padding()
        }
    }
    ```


### Network + 무한스크롤

이미지 받아오는 함수
- 통신할 때마다 startIndex를 더해주고, 다음 호출때는 더한 startIndex부터 시작하도록 호출
```swift
@State private var startIndex = 1

/// 이미지 받아오는 서버 통신 함수
    func getImageData(start: Int = 1, display: Int = 20) {
        ImageService.shared.fetchImageSearchData(start: start, display: display) { response in
            switch response {
            case .success(let data):
                guard let data = data as? ImageEntity else { return }
                self.imageList.append(contentsOf: data.items.map { $0.toModel() })
                self.startIndex += display
            default:
                print("❌", response)
            }
        }
    }
```

body의 onAppear에서 최초 실행
```swift
var body: some View {
        ScrollView {
            LayoutView(data: $imageList)
        }
        .padding()
        .onAppear {
            getImageData()
        }
    }
```

dragGesture가 발생할 때마다 호출
```swift
var body: some View {
        ScrollView {
            LayoutView(data: $imageList)
        }
        .padding()
        .onAppear {
            getImageData()
        }
        .gesture(DragGesture().onChanged({ value in
            print("drag", value)
            getImageData(start: startIndex)
        }))
    }
```


