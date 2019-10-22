---
title: hexo
date: 2018-07-26 16:13:14
tags:
categories: Markdown
---
# Problem
`hexo d` not working  
try this in `_config.yml`
```
deploy:
  type: git
  repo: https://{yourname}:{yourpassword}@github.com/{yourname}/{yourname}.github.io.git
  branch: master
```

# Md sequence and flowchart
## sequence
follow https://github.com/bubkoo/hexo-filter-sequence 
### code:
```
 Alice->Bob: Hello Bob, how are you?
 Note right of Bob: Bob thinks
 Bob-->Alice: I am good thanks!
```

### result:
```sequence
Alice->Bob: Hello Bob, how are you?
Note right of Bob: Bob thinks
Bob-->Alice: I am good thanks!
```
## flowchart
follow https://github.com/bubkoo/hexo-filter-flowchart  
### code:

```
  st=>start: Start|past:>http://www.google.com[blank]
  e=>end: End:>http://www.google.com
  op1=>operation: My Operation|past
  op2=>operation: Stuff|current
  sub1=>subroutine: My Subroutine|invalid
  cond=>condition: Yes
  or No?|approved:>http://www.google.com
  c2=>condition: Good idea|rejected
  io=>inputoutput: catch something...|request  

  st->op1(right)->cond
  cond(yes, right)->c2
  cond(no)->sub1(left)->op1
  c2(yes)->io->e
  c2(no)->op2->e
```


### result:
```flow
st=>start: Start|past:>http://www.google.com[blank]
e=>end: End:>http://www.google.com
op1=>operation: My Operation|past
op2=>operation: Stuff|current
sub1=>subroutine: My Subroutine|invalid
cond=>condition: Yes
or No?|approved:>http://www.google.com
c2=>condition: Good idea|rejected
io=>inputoutput: catch something...|request

st->op1(right)->cond
cond(yes, right)->c2
cond(no)->sub1(left)->op1
c2(yes)->io->e
c2(no)->op2->e
```