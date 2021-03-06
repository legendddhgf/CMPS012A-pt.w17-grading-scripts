#!/bin/bash
# cmps012a-pt.w17 grading
# usage: pa5.sh
# (run within your pa5 directory to test your code)

SRCDIR=https://raw.githubusercontent.com/legendddhgf/CMPS012A-pt.w17-grading-scripts/master/pa5
# Get all necessary extras

curl $SRCDIR/QueensUnitTests1.java > QueensUnitTests1.java
curl $SRCDIR/QueensUnitTests2.java > QueensUnitTests2.java

for num in 1 2 3 4 5 6 7 8 9 10
do
   curl $SRCDIR/model-out$num.txt > model-out$num.txt
done

if [ ! -d .backup ]; then
   mkdir .backup
fi

cp *.java Makefile .backup

make

if [ ! -e Queens ] || [ ! -x Queens ]; then # exist and executable
   echo ""
   echo "Makefile doesn't correctly create Queens!!!"
   echo ""
   rm -f *.class
   javac Queens.java
   echo "Main-class: Queens" > Manifest
   jar cvfm Queens Manifest *.class
   rm Manifest
   chmod +x Queens
fi


TEST1=""
TEST2="x"
TEST3="-v"
TEST4="-v x"
TEST5="5"
TEST6="-v 5"
TEST7="8"
TEST8="9"
TEST9="10"
TEST10="11"

# Run tests
echo "If nothing between '=' signs, then test is passed::"
echo "Test 1:"
echo "=========="
timeout 0.5 Queens $TEST1 >& out1.txt
diff -bBwu out1.txt model-out1.txt > diff1.txt
cat diff1.txt
echo "=========="

echo "Test 2:"
echo "=========="
timeout 0.5 Queens $TEST2 >& out2.txt
diff -bBwu out2.txt model-out2.txt > diff2.txt
cat diff2.txt
echo "=========="

echo "Test 3:"
echo "=========="
timeout 0.5 Queens $TEST3 >& out3.txt
diff -bBwu out3.txt model-out3.txt > diff3.txt
cat diff3.txt
echo "=========="

echo "Test 4:"
echo "=========="
timeout 0.5 Queens $TEST4 >& out4.txt
diff -bBwu out4.txt model-out4.txt > diff4.txt
cat diff4.txt
echo "=========="

echo "Test 5:"
echo "=========="
timeout 0.5 Queens $TEST5 > out5.txt
diff -bBwu out5.txt model-out5.txt > diff5.txt
cat diff5.txt
echo "=========="

echo "Test 6:"
echo "=========="
timeout 0.5 Queens $TEST6 > out6.txt
diff -bBwu out6.txt model-out6.txt > diff6.txt
cat diff6.txt
echo "=========="

echo "Test 7:"
echo "=========="
timeout 0.5 Queens $TEST7 > out7.txt
diff -bBwu out7.txt model-out7.txt > diff7.txt
cat diff7.txt
echo "=========="

echo "Test 8:"
echo "=========="
timeout 0.5 Queens $TEST8 > out8.txt
diff -bBwu out8.txt model-out8.txt > diff8.txt
cat diff8.txt
echo "=========="

echo "Test 9:"
echo "=========="
timeout 2 Queens $TEST9 > out9.txt
diff -bBwu out9.txt model-out9.txt > diff9.txt
cat diff9.txt
echo "=========="

echo "Test 10:"
echo "=========="
timeout 2 Queens $TEST10 > out10.txt
diff -bBwu out10.txt model-out10.txt > diff10.txt
cat diff10.txt
echo "=========="


make clean

echo ""

if [ -e Queens ] || [ -e *.class ]; then
   echo "WARNING: Makefile didn't successfully clean all files"
fi

echo ""

# Compile unit tests
javac Queens.java
javac QueensUnitTests1.java
javac QueensUnitTests2.java

echo "Unit Tests:"
timeout 0.5 java QueensUnitTests1
timeout 0.5 java QueensUnitTests2

rm -f *.class Queens
