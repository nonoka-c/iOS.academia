// 差分
import Foundation // Timerクラスを使用するために必要なモジュール
import PlaygroundSupport // Playground上でTimerクラスを機能させるために必要なモジュール

// デフォルトだとTimerクラスを継続的に処理させることが出来ないため、フラグを変更
PlaygroundPage.current.needsIndefiniteExecution = true

class trafficLights {
    var timer: Timer?
    var count: Int = 26
    var changeLight: Int = 0
    
    func start() {
        // 任意の箇所でTimerクラスを使用して1秒毎にcountup()メソッドを実行させるタイマーをセット
        timer = Timer.scheduledTimer(
            timeInterval: 1, // タイマーの実行間隔を指定(単位はn秒)
            target: self, // ここは「self」でOK
            selector: #selector(countdown), // timeInterval毎に実行するメソッドを指定
            userInfo: nil, // ここは「nil」でOK
            repeats: true // 繰り返し処理を実行したいので「true」を指定
        )
    }
    
    // Timerクラスに設定するメソッドは「@objc」キワードを忘れずに付与する
    @objc func countdown() {
        // countの値をインクリメントする
        count -= 1
//        print("残り時間は\(count)秒です")
        
        if 25 == count {
            print("信号は青です")
        } else if 15 == count {
            print("信号が黄色に変わりました")
            
        } else if 10 == count {
            print("信号が赤に変わりました")
        } else if 0 == count {
            print("信号が青に変わりました")
            // タイマーを止める
            timer?.invalidate()
        }
    }
}
    
    let alarm = trafficLights()
    alarm.start()

