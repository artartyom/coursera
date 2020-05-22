# Week 1 -- basics

## Builtin Types
- `int x = -5`
- `double pi = 3.14`
- `bool logicalValue = false`
- `char symbol = 'Z'`
- `string hw = "Hello world!"` NB: requires `#include <string>`

### Vectors

```
#include <vector>
...
vector<int> nums = {1; 3; 5; 7};
```

Operations with vectors work kinda like methods in Python. For example, to find vector length:

`cout << nums.size();`

### Dictionaries (maps)

```
#include <map>
...
map<string, int> name_to_value;
name_to_value["one"] = 1;
name_to_value["two"] = 2;
...
cout << name_to_value["two"];
```

## User types (classes?)
```
struct Person {
    string name;
    string surname;
    int age;
};
```
How can we use it? For example, in vectors:
```
vector<Person> staff;
staff.push_back({"Ivan", "Ivanov", 25});
staff.push_back({"Petr", "Petrov", 32});
```
Let's print

`cout << staff[0].name` - expect `Ivan`

NB: vectors are numbered from 0!

## What can we do with simple types (int, char, string)?
int: arithmetics.
```
#include <iostream>
using namespace std;

int main(){
    int x = 4;
    int y = 5;
    cout << (x + y) * (x - y);

    if (x == y) {
        cout << "equal";
    } else {
        cout << "not equal";
    }
    return 0;
}

```
**NB the usage of if () {} else {} - just like R**

Strings can also be compared.
```
#include <iostream>
#include <string>
using namespace std;

int main(){
    string x = "abc";
    string y = "def";
    if (x < y) {
        cout << "less";
    } else {
        cout << "not less";
    }
    return 0;
}
```
Previous comparison returns "less". `abc` is lexicographically less than `def`.

## What can we do with containers?
Containers contain (duh) >1 element. NB: Strings are also containers!
### - loop through the elements of the container

```
    ...
    string s = "abcdef";
    for (char c: s) {
        cout << c << ",";
    }
    ...
```
```
    ...
    vector<int> nums = {1, 5, 10, 15}
    for (int num : nums) {
        cout << num << ",";
    }
    ...
```

NB: to avoid declaring type explicitly, use keyword auto: `for (auto i : j)`

**NB the use of for () {} - just like R; `:` stands for `in`**

### - Count the number of occurrences of a specific element
```
    #include <iostream>
    #include <vector>
    using namespace std;

    int main(){
    vector<int> nums = {1, 5, 2, 3, 5};
    int quantity = 0;
    for (auto x : nums){
        if (x == 5){
            quantity += 1;
        }
    }
    cout << "There are " << quantity << " fives.";
    return 0;
```    
Super-long. We can do shorter using the `algorithm` library.
```    
    #include <algorithm>
    #include <iostream>
    #include <vector>
    using namespace std;

    int main(){
        vector<int> nums = {1, 5, 2, 3, 5};
        int quantity = count(begin(nums), end(nums), 5);
        cout << "There are " << quantity << " fives."
        return 0;
    }
```
NB: begin(), end() - a way to initialize a sequence

### Sorting
Can also be done easily with `algorithm`
```
...
int(main){
    vector<int> nums = {1, 5, 2, 3, 5};
    sort(begin(nums), end(nums));
    for (auto x : nums){
        cout << x << " ";
    }
    return 0;
}
```
 >**NB:**\
 `nums` is sorted **IN-PLACE**, i.e. old `nums` is overwritten

 Sorting with sort() also works for strings.

## Input-output

Need `#include <iostream>` for that.

input: `cin` (Console INput)

output: `cout` (Console OUTput)

Example of summing two numbers: see `sumTwo.cpp`

> **NB:**\
`cin >> x >> y` writes **first input to x, second input to y**;\
`cout << x << y` prints **first x, then y**

Strings are read until the first Space. For example,
```
cin >> name
cout << name
```
with input `Artem Shevlyakov` will produce `Artem` as output!!!

## ifelse
See `checkEquality.cpp`

## for loop
Basic: seen this already
```
...
for (int n: x){
    ...
}
...
```
More advanced: conditional for-loop
```
int main(){
    int n = 5;
    int sum = 0;
    for (int i = 1; i <= n; ++i){
        sum += i;
    }
}
```
Similar to the R construct `for (i in range(1, n)){}` 

## while loop

```
...
int n = 5;
int sum = 0;
int i = 1;

while (i <= n){
    sum += i;
    i += 1;
}
...
```
## Comments
single-line: `// comment text`
Multiline:
```
/* multi
 * line
 * comment */
```