import React from 'react'

fragment = (children) ->
  elements = for child in children
    if React.isValidElement child
      child
    else
      console.log child
      console.error "What to do with the above object?"

  React.createElement React.Fragment, null, ...elements

isString = (object) ->
  (typeof object is 'string') or (object instanceof String)

element = ->
  switch arguments.length
    when 1
      component = arguments[0]
      React.createElement component
    when 2
      [component, second] = arguments

      props = if isString second
        children: second
      else
        second

      React.createElement component, props
    when 3
      [component, props, content] = arguments
      React.createElement component, props, content
    else
      console.log arguments
      console.error 'What to do with the above arguments?'

wrap = (component) ->
  (...args) ->
    element component, ...args

STANDARD_ELEMENTS = [
  'div'
  'button'
]

tags = {}
for name in STANDARD_ELEMENTS
  tags[name] = wrap name

export { wrap, element, fragment, tags }
