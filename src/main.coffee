import React from 'react'

fragment = (children) ->
  elements = for child in children
    if React.isValidElement child
      child
    else
      console.log child
      console.error "What to do with the above object?"

  React.createElement React.Fragment, children: elements

isString = (object) ->
  (typeof object is 'string') or (object instanceof String)

content = (value) ->
  if isString value
    children: value
  else if Array.isArray value
    children: value
  else
    value

element = ->
  switch arguments.length
    when 1
      component = arguments[0]
      React.createElement component
    when 2
      [component, second] = arguments
      props = content second
      React.createElement component, props
    when 3
      [component, props, third] = arguments
      props.children = third
      React.createElement component, props
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

pub = { wrap, element, fragment, tags }
export { wrap, element, fragment, tags }
export default pub
