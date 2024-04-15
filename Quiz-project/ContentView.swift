//
//  ContentView.swift
//  Quiz-project
//
//  Created by SeongKook on 4/15/24.
//

import SwiftUI




struct ContentView: View {
    
    @State var number1: Int = 4
    @State var number2: Int = 9
    @State var resultNumber: Int = 0
    
    
    @State var countCorrect: Int = 0
    @State var countWrong: Int = 0
    
    var body: some View {
        VStack {
            Text("다음 수식은 맞을까요?")
                .padding(.top, 20)
                .font(.largeTitle)
        }
        
        Spacer()
        
        Text("\(number1) X \(number2) = \(resultNumber)")
            .font(.title)
        
        Spacer()
        
        HStack(spacing:40) {
            Button {
                selectCorret()
                reloadGame()
            } label: {
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text("맞음")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .tint(.green)
            
            Button {
                selectWrong()
                reloadGame()
            } label: {
                Image(systemName: "xmark.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text("틀림")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .tint(.red)
        }
        
        Spacer()
        
        HStack(spacing:40) {
            Text("\(countCorrect)개 맞춤")
            Text("\(countWrong)개 틀림")
        }
        .font(.title)
        .fontWeight(.medium)
        
        Spacer()
        
        Button {
            reloadGame()
            countCorrect = 0
            countWrong = 0
        } label: {
            Text("카운트 초기화")
        }
        .padding()
        .font(.largeTitle)
        .fontWeight(.bold)
        .onAppear {
            reloadGame()
        }
    }
    
    func reloadGame() {
        print("새로운 게임의 시작")
        number1 = Int.random(in: 0...10)
        number2 = Int.random(in: 0...10)
        
        if Bool.random() {
            resultNumber = number1 * number2
        }else{
            repeat {
                resultNumber = Int.random(in: -100...100)
            } while resultNumber == number1 * number2
    }
}

func selectCorret() {
    if resultNumber == number1 * number2 {
        countCorrect += 1
    } else {
        countWrong += 1
    }
}
func selectWrong() {
    if resultNumber != number1 * number2 {
        countCorrect += 1
    } else {
        countWrong += 1
    }
}
}

#Preview {
    ContentView()
}
