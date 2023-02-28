function fizzBuzz(array) {
    both = []
    for (i = 0; i < array.length; i++) {
        if (array[i] % 5 === 0 && array[i] % 3 === 0) {
            both.push(array[i])
        }
    }
    console.log(both)
}

fizzBuzz([2, 15, 20, 5, 30, 6])

function isPrime(number) {
    if (number < 2) {
        return false
    }
    let i = 2
    while (i < number) {
        if (number % i === 0) {
            return false
        }
        i++
    }
    return true
}

console.log(isPrime(2));
console.log(isPrime(10));
console.log(isPrime(15485863));
console.log(isPrime(3548563));

function sumOfNPrimes(n) {
    arr = firstNPrimes(n)
    sum = 0
    for (i = 0; i < n; i++) {
        sum += arr[i]
    }
    return sum
}

function firstNPrimes(n) {
    arr = []
    i = 2
    while (arr.length < n) {
        if (isPrime(i)) {
            arr.push(i)
        }
        i++
    }
    return arr
}

console.log(firstNPrimes(5));
console.log(sumOfNPrimes(5));