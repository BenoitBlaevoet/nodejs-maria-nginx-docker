import express from 'express'

const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('hello world')
})

app.get('/test', (req, res) => {
  res.send({ hello: 'world' })
})

app.listen(port, () => {
  console.log(`Listening to port: ${port}`)
})
