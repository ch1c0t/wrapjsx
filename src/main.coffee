import React from 'react'

fragment = (iterable) ->
  React.createElement React.Fragment,
    children: (prepareArrayChildren iterable)

prepareArrayChildren = (iterable) ->
  for element in iterable
    if React.isValidElement element
      element
    else
      if typeof element is 'function'
        element()
      else
        console.log element
        console.error "What to do with the above element?"

isString = (object) ->
  (typeof object is 'string') or (object instanceof String)

prepareProps = (object) ->
  if isString object
    children: object
  else if Array.isArray object
    children: (prepareArrayChildren object)
  else
    object

element = ->
  switch arguments.length
    when 1
      component = arguments[0]
      React.createElement component
    when 2
      [component, second] = arguments
      props = prepareProps second
      React.createElement component, props
    when 3
      [component, props, third] = arguments
      if Array.isArray third
        third = prepareArrayChildren third

      props.children = third
      React.createElement component, props
    else
      console.log arguments
      console.error 'What to do with the above arguments?'

wrap = (component) ->
  (...args) ->
    element component, ...args

STANDARD_ELEMENTS = [
  'a'
  'abbr'
  'address'
  'area'
  'article'
  'aside'
  'audio'
  'b'
  'base'
  'bdi'
  'bdo'
  'big'
  'blockquote'
  'body'
  'br'
  'button'
  'canvas'
  'caption'
  'cite'
  'code'
  'col'
  'colgroup'
  'data'
  'datalist'
  'dd'
  'del'
  'details'
  'dfn'
  'dialog'
  'div'
  'dl'
  'dt'
  'em'
  'embed'
  'fieldset'
  'figcaption'
  'figure'
  'footer'
  'form'
  'h1'
  'h2'
  'h3'
  'h4'
  'h5'
  'h6'
  'head'
  'header'
  'hgroup'
  'hr'
  'html'
  'i'
  'iframe'
  'img'
  'input'
  'ins'
  'kbd'
  'keygen'
  'label'
  'legend'
  'li'
  'link'
  'main'
  'map'
  'mark'
  'menu'
  'menuitem'
  'meta'
  'meter'
  'nav'
  'noscript'
  'object'
  'ol'
  'optgroup'
  'option'
  'output'
  'p'
  'param'
  'picture'
  'pre'
  'progress'
  'q'
  'rp'
  'rt'
  'ruby'
  's'
  'samp'
  'script'
  'section'
  'select'
  'small'
  'source'
  'span'
  'strong'
  'style'
  'sub'
  'summary'
  'sup'
  'table'
  'tbody'
  'td'
  'textarea'
  'tfoot'
  'th'
  'thead'
  'time'
  'title'
  'tr'
  'track'
  'u'
  'ul'
  'var'
  'video'
  'wbr'
]

tags = {}
for name in STANDARD_ELEMENTS
  tags[name] = wrap name

pub = { wrap, element, fragment, tags }
export { wrap, element, fragment, tags }
export default pub
