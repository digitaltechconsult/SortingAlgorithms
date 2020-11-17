import Foundation

public class BenchTimer {
    public static func measureBlock(closure: () -> Void) -> CFTimeInterval {
        let runCount = 10
        var executionTimes = Array<Double>(repeating: 0.0, count: runCount)
        for i in 0..<runCount {
            let startTime = Date().timeIntervalSince1970
            closure()
            let endTime = Date().timeIntervalSince1970
            executionTimes[i] = endTime - startTime
        }
        let sum = executionTimes.reduce(0.0) { (x, y) -> Double in
            return x + y
        }
        return sum / Double(runCount)
    }
}

