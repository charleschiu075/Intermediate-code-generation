# Intermediate-code-generation

Compute integer arithmetic expressions separated by semicolons using Flex and Bison.

## Requirements
- `flex`
- `bison`
- `gcc`

## Build
```bash
make
```

## Run
Place semicolon-separated expressions into `testcase.in`. Whitespace is ignored and each result is printed on its own line.
```bash
echo "1 + 2; 3 * (4 + 5);" > testcase.in
./calc
# Output:
# 3
# 27
```
