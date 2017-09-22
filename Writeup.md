# Homework 2
## Tobias Shapinsky

### Multiplexer
Results:
```
A0 A1 | I0 I1 I2 I3 | Out | Expected Out
0  0  | 1  0  1  0  | 1   | 1
1  0  | 1  0  1  0  | 0   | 0
0  1  | 1  0  1  0  | 1   | 1
1  1  | 1  0  1  0  | 0   | 0
```
![multiplexer](https://github.com/TShapinsky/HW2/blob/master/multiplexer.PNG?raw=true)

### Decoder
Results:
```
En A0 A1| O0 O1 O2 O3 | Expected Output
0  0  0 |  0  0  0  0 | All false
0  1  0 |  0  0  0  0 | All false
0  0  1 |  0  0  0  0 | All false
0  1  1 |  0  0  0  0 | All false
1  0  0 |  1  0  0  0 | O0 Only
1  1  0 |  0  1  0  0 | O1 Only
1  0  1 |  0  0  1  0 | O2 Only
1  1  1 |  0  0  0  1 | O3 Only
```
![decoder](https://github.com/TShapinsky/HW2/blob/master/decoder.png?raw=true)

### Adder
Reults:
```
A B Cin | S Cout | Expected
0 0 0   | 0 0    | 0 0
0 0 1   | 1 0    | 1 0
0 1 0   | 1 0    | 1 0
0 1 1   | 0 1    | 0 1
1 0 0   | 1 0    | 1 0
1 0 1   | 0 1    | 0 1
1 1 0   | 0 1    | 0 1
1 1 1   | 1 1    | 1 1
```
![adder](https://github.com/TShapinsky/HW2/blob/master/adder.PNG?raw=true)
