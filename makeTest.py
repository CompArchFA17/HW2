from itertools import product

def expected(*args):
    args = args[0]
    a0 = args[0]=='1'
    a1 = args[1]=='1'
    i0 = args[2];
    i1 = args[3];
    i2 = args[4];
    i3 = args[5];
    if not a1 and not a0:
        return [i0]
    if not a1 and a0:
        return [i1]
    if a1 and not a0:
        return [i2]
    if a1 and a0:
        return [i3]


inputs  = ("address0","address1","in0","in1","in2","in3")
outputs = ["out"]

lengths = []
delay = 1000;

numInputs = len(inputs)
numOutputs = len(outputs)
print("$display(\"", end="")
for eachInput in inputs:
    string = eachInput+" | "
    lengths.append(len(string))
    print(string, end="")
for eachOutput in outputs:
    string = eachOutput+" | "
    lengths.append(len(string))
    print(string, end="")
    string = eachOutput+" expected | "
    lengths.append(len(string))
    print(string, end="")
print("\");")

for inputVals in product("01",repeat=numInputs):
    for i, eachInput in enumerate(inputs):
        print(eachInput+"="+inputVals[i]+";",end="")
    print("#"+str(delay))
    print("$display(\"", end="")
    i = 0
    for eachInput in inputs:
        print("%b"+" "*(lengths[i]-3)+"| ", end="")
        i=i+1
    for eachOutput in outputs:
        print("%b"+" "*(lengths[i]-3)+"| ", end="")
        i=i+1
        print("%s"+" "*(lengths[i]-3)+"| ", end="")
        i=i+1
    print("\", ", end="")
    expectedOutputs = expected(inputVals)
    for eachInput in inputs:
        print(eachInput+", ", end="")
    for i, eachOutput in enumerate(outputs):
        print(eachOutput+", ", end="")
        if i < numOutputs-1:
            print("\""+expectedOutputs[i]+"\", ", end="")
        else:
            print("\""+expectedOutputs[i]+"\");")
