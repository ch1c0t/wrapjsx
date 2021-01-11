`wrapjsx` is a way to use React with functions instead of JSX. To provide a more convenient syntax, it uses `React.createElement` under the hood. To install:

```
npm install wrapjsx
```

A usage example:

```
import { useState } from 'react'
import { render } from 'react-dom'

import { wrap, fragment, tags } from 'wrapjsx'
{ div, button } = tags

Button = wrap ({ text = 'default text' }) ->
  [text, setText] = useState text
  onClick = -> setText 'CLICKED'
  button { onClick }, text

App = fragment [
  Button
  Button text: 'A'
  Button text: 'B'
  div className: 'some', 'Some string'
  div 'Another string'
  div [
    div 'first child'
    div 'second child'
    Button
    div
  ]
  div
]

render App, (document.getElementById 'app')
```
