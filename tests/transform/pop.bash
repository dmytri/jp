#!/bin/bash
source "test-bootstrap.bash"
IFS=

empty=$(./jp .pop 2>/dev/null)
if [ $? -eq 1 ];then
  pass "pop empty stack errors"
else
  fail "pop empty stack does not error"
fi

popone=$(echo '{"a":1}' | ./jp .pop)
if [ "$popone" = '' ];then
  pass "pop popone"
else
  printf -v poponeesc "%q" "$popone"
  fail "pop popone: got $poponeesc"
fi

poptwo=$(./jp 1 '{}' '[]' .pop .pop)
if [ "$poptwo" = '1' ];then
  pass "pop poptwo"
else
  printf -v poptwoesc "%q" "$poptwo"
  fail "pop poptwo: got $poptwoesc"
fi

end