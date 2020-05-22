# Week 1 -- operations with variables

## Assignment

```
...
string s = "Hello";
string t = s;

t += ", world!";
s = "hiiiiiii";

cout << "s = " << s << endl;
cout << "t = " << t << endl;
...
```

We will see\
    `s = hiiiiiii`\
    `t = Hello, world!`


> `t` is a separate variable and does not reference `s`. `s` is FULLY COPIED to `t`; `t` is not modified when we modify `s` and vice versa.

## Increments

`x = x + 2` is the same as `x += 2`. The same thing goes for `-=`, `*=`, `/=`

`x++` or `++x` is the same as `x += 1`

- `++x` - prefix increment
- `x++` - postfix increment

```
int c = 1;
int a = c++;

c = 1;
int b = ++c;
```

In this example, `a == 1` and `b == 2`. \
`a = c++` assigns first, increases later.\
`b = ++c` increases first, assigns later.

## Logical

`&&` - conjunction (AND)

```
...
string s = "abc";
if (!s.empty() && s < "zzz"){
    cout << "Condition satisfied!"
}
...
```

`||` - disjunction (OR)

