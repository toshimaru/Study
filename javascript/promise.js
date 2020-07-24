async function resolveAfter10Seconds() {
    return new Promise(resolve => {
        setTimeout(() => {
            console.log('resolveAfter10Seconds')
            resolve()
        }, 10000)
    })
}

console.log('before Promise')
resolveAfter10Seconds()
console.log('after Promise')

asyncFunc = async () => {
    console.log('before Promise')
    await resolveAfter10Seconds()
    console.log('after Promise')
}
asyncFunc()
