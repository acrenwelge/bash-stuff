#!/usr/bin/env zx

// Testing out [zx](https://github.com/google/zx)
// a tool for writing better scripts in Node.js
// usage: `zx hello-world.mjs`

let date = await $`date`
let path = await $`pwd`
await $`echo Current date is ${date}.`
await $`echo The filepath is ${path}.`
echo('')

let name = await question('What is your name? ')
await $`echo Your name is ${name}`
