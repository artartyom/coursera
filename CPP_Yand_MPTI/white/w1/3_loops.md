# Week 1 -- Loops

## ifelse

```
...
if (a == b && c == d || e == f)
    cout << "Condition satisfied";
 else 
    cout << "Condition not satisfied";

...
```

> NB: tabulation does NOT define nestedness.

```
if (a >= 0)
    if (a > 0)
        cout << "positive";
else
    cout << "negative";
```

In this example, else is paired to the **second** if statement. If a == -1, no output will be shown. To avoid this, use parens:

```
if (a >= 0){
    if (a > 0){
        cout << "positive";
    }
} else {
    cout << "negative";
}
```

Parens can also be used to use conditions on chunks of code >1 line long. Basically, for clarity it's better to always use parens.

## while

```
...
while (...){
   ... 
}
...
```

While: check condition first, execute later. Min 0 iters.

## do while

```
...
do {
    ...
} while (...);
...
```

> **NB: semicolon after while!**

Do while: execute first, check condition later. Min 1 iter.

## range-based for

```
...
#include <vector>
#include <map>
#include <string>
...
vector<int> a = {1, 2, 3, 4, 5, 6};
map<string, int> b = {
    {"a", 1},
    {"b", 2},
    {"c", 3}
    };
int sum = 0;

for (auto i: a){
    sum += i;
}

cout << sum;

sum = 0;
string concat;

for (auto i: b){
    concat += i.first;
    sum += i.second;
}

cout << concat << endl;
cout << sum;
...
```

## for

```
string a = "asdfasdfasdf";
for (int i = 0; i < a.size(); ++i){
    if a[i] == "s" {
        cout << i << endl;
    }
}
cout << "Out of loop" << endl;
```

expected output: 

```
1
5
9
Out of loop
```

for-loop has three sections
- initialize the looping variable
- run condition
- variable increase

> `break` gets out of the for-loop

```
string a = "asdfasdf";
for (int i = 0; i < a.size(); ++i){
    if a[i] == "s" {
        cout << i << endl;
        break;
    }
}
cout << "Out of loop" << endl;
```

Expected output: 

```
1
Out of loop
```