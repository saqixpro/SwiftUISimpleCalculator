// Calculator App With Swift and Swift UI

import SwiftUI

struct MainApp : View {
    
    @State var value: String = "0";
    @State var _operator = "";
    @State var num1: Float = 0;
    @State var num2: Float = 0;
    
    
    func onPressNumber(number: Int){
        if(value == "0"){
            value = String(number)
        } else {
            value = value + String(number);
        }
    }
    
    func onPressDot(){
        if(!value.contains(".")){
            value += ".";
        }
    }
    
    func removeLastNumber(){
        value.popLast();
    }
    
    func clearValue(){
        _operator = "";
        num1 = 0;
        num2 = 0;
        value = "0";
    }
    
    func setOperator(val: Int){
        num1 = Float(value) ?? 0;
        switch val {
        case 1:
            _operator = "×";
            break;
        case 2:
            _operator = "-";
            break;
        case 3:
            _operator = "+";
            break;
        case 4:
            _operator = "÷";
        default:
            _operator = "";
        }
        value = "0";
    }
    
    func calculateResult(){
        num2 = Float(value) ?? 0;
        
        switch _operator {
        case "×":
            value = String(num1 * num2);
            break;
        case "-":
            value = String(num1 - num2);
            break;
        case "+":
            value = String(num1 + num2);
            break;
        case "÷":
            if(num2 != 0){
                value = String(num1 / num2)
            } else {
                print("Cannot Divide by Zero");
            }
            break;
        default:
            value = "0";
        }
    }
    
    var body: some View {
        VStack{
            VStack{
                Spacer()
                HStack{
                    Text(num1 == 0 ? "" : String(num1)).foregroundColor(.white).font(.system(size: 24))
                    Text(_operator).foregroundColor(.white).font(.system(size: 24))
                    Text(String(num2 == 0 ? "" : String(num2))).foregroundColor(.white).font(.system(size: 24))
                }.frame(width: 350, alignment: .bottomLeading)
                Text(String(value)).foregroundColor(.white).font(.system(size: 60)).frame(width: 350, alignment: .bottomTrailing)
            }
            VStack{
                HStack{
                    Btn(label: "±", action: {
                        print(1);
                    }, background: .white)
                    Btn(label: "C", action: removeLastNumber, background: .white)
                    Btn(label: "AC", action: clearValue, background: .white)
                    Btn(label: "÷", action: {
                        setOperator(val: 4)
                    }, background: .orange)
                }
                HStack{
                    Btn(label: "1", action: {
                        onPressNumber(number: 1)
                    }, background: .gray)
                    Btn(label: "2", action: {
                        onPressNumber(number: 2)
                    }, background: .gray)
                    Btn(label: "3", action: {
                        onPressNumber(number: 3)
                    }, background: .gray)
                    Btn(label: "×", action: {
                        setOperator(val: 1)
                    }, background: .orange)
                }
                HStack{
                    Btn(label: "4", action: {
                        onPressNumber(number: 4)
                    }, background: .gray)
                    Btn(label: "5", action: {
                        onPressNumber(number: 5)
                    }, background: .gray)
                    Btn(label: "6", action: {
                        onPressNumber(number: 6)
                    }, background: .gray)
                    Btn(label: "-", action: {
                        setOperator(val: 2)
                    }, background: .orange)
                }
                HStack{
                    Btn(label: "7", action: {
                        onPressNumber(number: 7)
                    }, background: .gray)
                    Btn(label: "8", action: {
                        onPressNumber(number: 8)
                    }, background: .gray)
                    Btn(label: "9", action: {
                        onPressNumber(number: 9)
                    }, background: .gray)
                    Btn(label: "+", action: {
                       setOperator(val: 3)
                    }, background: .orange)
                }
                HStack{
                    Btn(label: "0", action: {
                        onPressNumber(number: 0)
                    }, background: .gray, width: 130)
                    Btn(label: ".", action: onPressDot, background: .gray)
                    Btn(label: "=", action: calculateResult, background: .orange)
                }
            }.frame(width: 400, height: 400)
        }.background(.black)
    }
}


struct Btn: View {
    var label: String;
    var action: () -> Void;
    var background: Color;
    var width: CGFloat = 40;
    
    func getForegroundColor() -> Color {
        return background == .white ? .black : .white;
    }

    
    var body : some View {
        Button(label, action: action).font(.system(size: 30)).frame(width: width, height: 40).padding(20).background(background).foregroundColor(getForegroundColor()).cornerRadius(50)
    }
}


struct MainApp_Preview: PreviewProvider{
    static var previews: some View{
        MainApp()
    }
}
