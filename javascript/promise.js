function resolveAfter10Seconds() {
    return new Promise(resolve => {
        setTimeout(() => {
            console.log('resolveAfter10Seconds')
            resolve()
        }, 10000)
    })
}

console.log('=== before Promise ===')
resolveAfter10Seconds()
console.log('=== after Promise ===')

const asyncFunc = async() => {
    console.log('=== before Promise in async ===')
    await resolveAfter10Seconds()
    console.log('=== after Promise in async in async ===')
}
asyncFunc()

