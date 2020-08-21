# Test_Case INPUT/OUTPUT files Batch Generation

This bash script helps in generating the Input/Output files for programming tasks. In most cases, multiple test cases need to be generated. This process is automated. You need to provide the test case generation cpp file for input data and an optimal solution to generate the output data.

### Installing
Download this repository manually or by using git clone on terminal.

### Using
Copy your original solution which you expect might fail in the file `SOL.cpp`. <br>
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
By default, The input/output files are generated and stored in the input & output folder respectively. The naming convention and directory structure are those required for uploading on hackerrank.com, which can be changed easily by updating the bash script.
