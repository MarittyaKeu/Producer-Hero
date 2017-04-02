# Producer Hero

### Statement
The concept of our project is to create a mixer that music producers often use. We will be using the RSound, 2htdp/Universe, and 2htdp/image libraries to use in our project. For this project, we are hoping to make an application that uses the keyboard to generate an RSound and the end user can channel their inner producer to create a beat. The application will also allow the user to record the beat they've generated and play it back. 

### Analysis

So far we are planning to implement a recursive function that will keep track of how many times the user presses a key while the application is running. Beside the recursion function, we don’t know yet what else, we are going to be adding to this application. We can implement our whole program without using some of the things we had learned in class. All of the three libraries we will be using have their own functions. However, we believe in code optimization and the only way we can carry out some of stuff from the course.

### External Technologies
At this point, we are not sure if we will use external technologies. 

### Data Sets or other Source Materials

RSound uses and manipulate wav files so we downloaded some sample sounds and an 808 drum kit to play around with. Some wav files we've played around with so far are from the following websites listed below......

http://www.brainybetty.com/soundsforpowerpoint2.htm

http://hiphopmakers.com/free-808-drum-kit-227-samples


### Deliverable and Demonstration

For our end result, we expect to have a full interactive mixer application. The application will come with instructions with what sound a certain letter on the keyboard will generate. The user should be able to use the keyboards to produce some sort of beats and have it recorded and played back. 


### Evaluation of Results
Success of this project will mean that we have a fully functional software that displays the user interface correctly with and the the keystrokes responds to a generated RSound. Also, we are going to keep count of how many times a key is pressed, therefore we hope to have the correct count displayed somewhere on the screen.


## Architecture Diagram

+![test image](/architecture-diagram.png?raw=true "test image")

At the start of our application, we create a starting window using the 2htdp/universe library which is going to playing background introduction music. From there we are able to navigate to either a new help screen or the main program's screen. If you are at the help screen, you will be shown some tips on how to use our application, and also a keystroke that will bring you to the main program's screen. At the main program's screen, the magic happens. This is where you are able to start mixing sounds together to generate a nice beat and also record it into(hopefully) a file stored on computer. 

## Schedule
This is our tentative schedule......

### First Milestone (Sun Apr 9)
For our first milestone, we will draw our three window frames(sceens) and get it up and running properly.

### Second Milestone (Sun Apr 16)
For our second milestone, we intend to get RSound working properly and also get the keyboard strokes to generate a sound.

### Public Presentation (Mon Apr 24, Wed Apr 26, or Fri Apr 28 [your date to be determined later])
If we have time, we will try to make a game similar to Guitar Hero

## Group Responsibilities


### Marittya "Mike" Keu  @MarittyaKeu


I will be using RSound to incorporate into our project. I will create a bunch of RSound objects which we will then use and maniuplate to play sounds using keyboard.

### Emmanuel Rosario @emmanrosa
I’m going to use 2hdtp/universe to create scenes and all the user inputs can be handle inside of them. Also, inside those scenes I’m going to place the images using 2hdtp/image.  
