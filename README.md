# Test-Generation-AND-Stress-Testing

Bash Script for automation of Test Case Generation and Stress Testing

# 1. Stress Testing bash script

Stress testing is a technique of testing your solution on a number of random test cases to find where the code might fail. 

### Installing
Download this repository manually or by using git clone on terminal.

### Using
Copy your original solution which you expect might fail in the file `SOL.cpp`. <br>
Copy your brute force solution which is expected to give correct output in the file `BRT.cpp`. <br>
Change the `GEN.cpp` file so as to generate test cases according to the question. <br>

Now open your terminal in the directory where file `run.sh` resides and execute:<br>
Once give the execute permissions to `run.sh` file using: <br>
$ `sudo chmod +x run.sh` <br>
and then execute: <br>
$ `bash run.sh` to run the script.

### Changing number of test cases
`bash run.sh`
**->** This will generate **10** (_default_) test cases and then check the program against it.

`bash run.sh 100`
**->** This will generate **100** test cases and then check the program against it.

### Output:
The output of running file `run.sh` on every test case is either `Accepted` if your solution's output matches the brute solution output or `Wrong Answer` and will show the input on which the solution failed, the output of your solution and expected output according to the brute force solution on terminal and the script will be terminated. Now you can debug your original solution and check where it goes wrong. <br>
If you wish to terminate the script at any moment you wish use the command `ctrl + c` in your terminal.<br>
