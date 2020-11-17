func selectionSort(_ input: [Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }
    
    var array = input
    
    for i in 0..<array.count {
        for j in i+1..<array.count {
            if array[j] < array[i] {
                let aux = array[j]
                array[j] = array[i]
                array[i] = aux
            }
        }
    }
    
    return array
}

func insertionSort(_ input: [Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }
    
    var array = input
    
    for i in 1..<array.count {
        var j = i
        while j > 0 && array[j] < array[j-1] {
            let aux = array[j-1]
            array[j-1] = array[j]
            array[j] = aux
            j -= 1
        }
    }
    
    return array
}

func bubbleSort(_ input: [Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }
    
    var array = input
    var swap = true
    while swap {
        swap = false
        for i in 0..<array.count-1 {
            if array[i] > array[i+1] {
                let aux = array[i]
                array[i] = array[i+1]
                array[i+1] = aux
                swap = true
            }
        }
    }
    
    return array
}

func mergeSort(_ input:[Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }
    
    let splitIndex = input.count / 2
    let leftArray = mergeSort(Array(input[0..<splitIndex]))
    let rightArray = mergeSort(Array(input[splitIndex..<input.count]))
    
    return merge(leftArray, rightArray)
}

func merge(_ leftArray: [Int], _ rightArray: [Int]) -> [Int] {
    var sorted = [Int]()
    var i = 0, j = 0
    
    while i < leftArray.count && j < rightArray.count {
        if leftArray[i] < rightArray[j] {
            sorted.append(leftArray[i])
            i += 1
        } else if leftArray[i] > rightArray[j] {
            sorted.append(rightArray[j])
            j += 1
        } else {
            sorted.append(leftArray[i])
            sorted.append(rightArray[j])
            i += 1
            j += 1
        }
    }
    
    if i < leftArray.count {
        sorted.append(contentsOf: leftArray[i..<leftArray.count])
    } else if j < rightArray.count {
        sorted.append(contentsOf: rightArray[j..<rightArray.count])
    }
    
    return sorted
}

func quicksort(_ input: [Int]) -> [Int] {
    guard input.count > 1 else {
        return input
    }
    
    let pivotIndex = input.count / 2
    let pivot = input[pivotIndex]
    
    let less = input.filter { $0 < pivot }
    let equal = input.filter { $0 == pivot }
    let greater = input.filter { $0 > pivot }
    
    return quicksort(less) + equal + quicksort(greater)
}

let array1 = [1, 4, 3, 2, 0]
let array2 = [64, 25, 12, 22, 11]
let array3 = [10, 9, 8, 7, 6, 5, 3, 9, 4, 3, 2, 1, 0]
print(quicksort(array1))
print(quicksort(array2))
print(quicksort(array3))
