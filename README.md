In set theory,
order can be encoded in the following manner.


ordered tuple | set representation
--------------|------------------------
(a)           | {{a}}
(a,b)         | {{a},{a,b}}
(a,b,c)       | {{a},{a,b},{a,b,c}}


This program illustrates the computability of this
encoding scheme.

The seq function has this signature:
fn: a' list list -> a' list

for example:
seq [[#"a",#"b"], ["#a"]] = ["#a", "#b"]
which represents this transformation:
{{a,b},{a}} -> (a,b)

Note that the order of the input lists and their lists
is insignificant, as they are representations of (unordered) sets.

The implicit order in the input is made explicit in the output.

