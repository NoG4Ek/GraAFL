# GraAFL
![GraAFL](https://github.com/NoG4Ek/GraAFL/blob/master/GraAFL.png)
Java projects phasing tool in binary file format. GraAFL - combination of two instruments [Native-Image](https://www.graalvm.org/reference-manual/native-image/) + [WinAFL](https://github.com/googleprojectzero/winafl)

## How it works?
  
1. A native image is built from a java project using Native-Image (preferably optimized) in the form of a static .dll library 
2. To provide the ability to search for errors using winafl, a Harness is used that can crash with a Windows error. It loads the .dll library and looks for a function in it, looks at its status and makes a decision. 
3. To sort out uninteresting exceptions, use ExceptionSorter and the -rse / -rsi flags. 
4. For ease of use and automation of the process, the JBWJ mechanism is used 
5. After finding the pool of input data on which the project falls, they are re-run to check against the original .jar

## To get started
Some points take you outside the bounds of this page. When you're done, go back and move on to the next steps.

 1. First you need to install [GraalVM](https://www.graalvm.org/) (e) with the appropriate tool.
 2. Install [WinAFL](https://github.com/googleprojectzero/winafl) and build based on the latest [DynamoRIO](https://dynamorio.org/page_releases.html) version (NOTE: versions below 8.0.0 do not support the latest windows)
 3. Pull up all dependent submodules of this project
 4. Place the assembled WinAFL next to all the folders in the main directory and (for convenience) keep DRIO inside the afl folder
 5. Put the folder with target projects in the main directory of GraAFL

## Using
After you have received the main structure, you need to collect everything in one place and run, for this:

 1. Use GraAFLCollector to collect .bat file, put it in the main directory and run it, specifying the target folder 	 `...WinAFL / bin / Release`, for example
 2. Go to this folder and collect .bat using JBWJ.jar. The following options are supported:
```
 -D       : DynamoRIO Directory
 -cores   : Number of parallelized phasers per core (default: 1)
 -dllAs   : Specify this parameter to automatically build the NI image, but without optimizations. For optimization, build the image yourself using the ImageTest example and NICommands.txt
 -f VAL   : Function Name For Fuzz
 -i VAL   : Input Directory (default: .\input)
 -jar VAL : Target project .jar
 -o VAL   : Output Directory (default: .\out)
 -rse VAL : Regex To Exclude Sort Output Exceptions (default: )
 -rsi VAL : Regex To Include Sort Output Exceptions (default: )
 -t VAL   : Time For Time Out Target On Tests (default: 5000)
 ```
 3. Use the resulting .bat file to start phasing and further run all generated input data through the .jar project
 4. Use information (*)ST.txt and newExceptions.txt to find out new information about found errors and add information to sort uninteresting exceptions
 5. Good luck =)

### Tips

1. See _toolkit to find some helpful instruments
2. Use a pool of ready and optimized input data from winafl for tests

## Problem board
Some exceptions in java projects cause the harness to fall and DRIO does not maintain it. Found problems:
1. Some IIOExceptions that affect reflexive access 

## Mark
<details>
  <summary>Spoiler warning</summary>

<button>['Be happy'](https://i.pinimg.com/originals/b2/f1/86/b2f186c4ab6e95f4296179c616433def.jpg )</button>

</details>
