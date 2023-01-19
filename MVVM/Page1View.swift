//
//  ContentView.swift
//  MVVM
//
//  Created by 花形春輝 on 2023/01/19.
//

import SwiftUI

struct Page1View: View {            // ← View
    // ViewModel
    @StateObject var viewModel = Page1ViewModel()
    
    var body: some View {
        VStack {
            // タイトル
            Spacer()
            Text(viewModel.title)
            
            // ボタンステータス
            Spacer()
            Button(viewModel.buttonStatus){
                viewModel.onButton1Click()
            }

            Spacer()
            
        }
        .padding()
        .onAppear(){
            // 初期表示
            viewModel.onAppear()
        }
    }
}

class Page1ViewModel:ObservableObject {   // ← ViewModel
    /// メンバ変数
    var title = "MVVMモデルサンプル"       // ← Model
    @Published var buttonStatus = ""    // ← Model
    
    func onAppear(){
        buttonStatus = "押下前"
    }
    
    /// ボタン1押下時
    func onButton1Click(){
        buttonStatus = "押下後"
    }
}

