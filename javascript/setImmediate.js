console.log('=== begin ===')

setImmediate(() => {
  console.log('setImmediate')
})
// setTimeout also can be used
setTimeout(() => {
  console.log('setTimeout')
})

console.log('=== end ===')
