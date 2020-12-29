`wrapjsx` provides a way to use React without JSX. To install:

```
npm install wrapjsx
```

A usage example:

```
import { useState } from 'react'
import { render } from 'react-dom'

import { wrap, fragment, tags } from 'wrapjsx'
{ div, button } = tags

Button = wrap ({ name }) ->
  [state, setState] = useState name
  onClick = -> setState 'CLICKED'
  button { onClick }, state

App = fragment [
  Button name: 'A'
  Button name: 'B'
  div className: 'some', 'Some string'
  div 'Another string'
]

render App, (document.getElementById 'app')
```
