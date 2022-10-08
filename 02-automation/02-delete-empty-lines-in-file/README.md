## Remove all empty lines from file

Blank line --> Empty line with no space

### Using awk
```
awk 'NF' sample.txt
```
NF stands for "number of fields", those lines being empty have 0 fields, so that awk evaluates 0 to False and no line is printed; however, if there is at least one field, the evaluation is True and makes awk perform its default action: print the current line.
