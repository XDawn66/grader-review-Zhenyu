CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
grade= 100
rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
if [[ -f 'student-submission/ListExamples.java' ]]
then 
    cp student-submission/ListExamples.java grading-area
else
    echo 'incorrect file format or the file is not exist!'
    exit
fi

javac grading-area/ListExamples.java
if [[ $? != 0 ]]
then
    echo 'Complie error!'
    garde = $((grade - 100))
fi

cp TestListExamples.java grading-area
cd grading-area

javac -cp ".;../lib/hamcrest-core-1.3.jar;../lib/junit-4.13.2.jar" *.java
java -cp ".;../lib/junit-4.13.2.jar;../lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples > result.txt

grep -w "run" result.txt > grade.txt || grep -w "OK" result.txt > grade.txt
s1= "Could not find class"
s2= "error: ';' expected"
s3= "test timed out"


#if [[ ]]