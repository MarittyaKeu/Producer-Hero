# Producer Hero

### Statement
The concept of our project is to create a mixer that music producers often use. We will be using the RSound, 2htdp/Universe, and 2htdp/image libraries to use in our project. For this project, we are hoping to make an application that uses the keyboard to generate an RSound and the end user can channel their inner producer to create a beat. The application will also allow the user to record the beat they've generated and play it back. 

### Analysis

- Will you use data abstraction? How?
- Will you use recursion? How?
- Will you use map/filter/reduce? How? 
- Will you use object-orientation? How?
- Will you use functional approaches to processing your data? How?
- Will you use state-modification approaches? How? (If so, this should be encapsulated within objects. `set!` pretty much should only exist inside an object.)
- Will you build an expression evaluator, like we did in the symbolic differentatior and the metacircular evaluator?
- Will you use lazy evaluation approaches?

The idea here is to identify what ideas from the class you will use in carrying out your project. 

**Your project will be graded, in part, by the extent to which you adopt approaches from the course into your implementation, _and_ your discussion about this.**

### External Technologies
At this point, we are not sure if we will use external technologies. 

### Data Sets or other Source Materials

RSound uses and manipulate wav files so we downloaded some sample sounds and an 808 drum kit to play around with.

Some wav files we've played around with so far are from the following websites listed below......

http://www.brainybetty.com/soundsforpowerpoint2.htm

http://hiphopmakers.com/free-808-drum-kit-227-samples


### Deliverable and Demonstration

For our end result, we expect to have a full interactive mixer application. The application will come with instructions with what sound a certain letter on the keyboard will generate. The user should be able to use the keyboards to produce some sort of beats and have it recorded and played back. 


### Evaluation of Results
How will you know if you are successful? 
If you include some kind of _quantitative analysis,_ that would be good.

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
