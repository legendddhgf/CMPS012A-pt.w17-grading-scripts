# cmps012a-pt.w17/pa3

The following is a set of performance tests to run on your GCD program. It takes
six example input files and compares your results to our correct model outputs.
We have made this available to you to check your work before making your final
submission.

## Installation

Run the following in your working directory (the directory you wrote your code
in) to download the test script.

```bash
curl https://raw.githubusercontent.com/legendddhgf/CMPS012A-pt.w17-grading-scripts/master/pa3/pa3.sh > pa3.sh
chmod +x pa3.sh
```

# Usage

After downloading the script, you can then run it with the following command:

```bash
./pa3.sh
```

It will print out the difference between your output and the correct output,
using the `diff` command. Lack of any output between the set of "=========="
means that your program is running correctly.

> WARNING: For now on you will not get a perfect score if there is any output
between any of the pairs of equal signs

## Removal

You can delete the test and all other downloaded/generated files with:
`rm -f pa3.sh diff*.txt out*.txt model-out*.txt`.
