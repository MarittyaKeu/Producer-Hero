# Producer Hero

### Statement done
The concept of our project is to create a mixer that music producers often use. We have used the RSound, 2htdp/Universe, and 2htdp/image libraries to use in our project. For this project, we made an application that use the keyboard to generate an RSound and the end user can channel their inner producer to create a beat. The application allows the user to record the beat they've generated and play it back.

### Analysis done
At first we thought it would be hard to implement this program without using some of the things we had learned in class. We thought that because all of the three libraries we used have their own functions. However, we implement a list function that keeps append items to the end of the list. This function added strings and rsounds to the list. We filter string? and filter rsound? to takes the items that we need from the list. We apply map to the string-join function that takes a list. In addition, we use an image recursion function from the image.rkt, but we did a few changes and updates for the background.

### External Technologies done
At this point, we are not sure if we will use external technologies.

### Data Sets or other Source Materials (in progress)

RSound uses and manipulate wav files so we downloaded some sample sounds and an 808 drum kit to play around with. Some wav files we've played around with so far are from the following websites listed below......

http://www.brainybetty.com/soundsforpowerpoint2.htm

http://hiphopmakers.com/free-808-drum-kit-227-samples


### Deliverable and Demonstration
For our end result, we expect to have a full interactive mixer application. The application will come with instructions with what sound a certain letter on the keyboard will generate. The user should be able to use the keyboards to produce some sort of beats and have it recorded and played back.


### Evaluation of Results done

We have a successful running program. In addition, we ran every individual functions, tested every keys, and passed all the tests.


### Screenshot (in progress)

+![main image](/Pics/main.png?raw=true "main image")
This is our main menu screen. To advance to the next screen (help menu) type h.

+![help image](/Pics/help.png?raw=true "help image")
This screen is our help menu. It has a map key to show what sound each key stroke will generate. Press the space bar to advance to the next screen. 

+![hero image](/Pics/producer.png?raw=true "hero image")
The final screen is where the magic happens. We used a recursive circular image that was given as an example in the Racket documentation and added a neat feature that randomly changes images' color. This sort of give it a color feature that makes it seems as if the image is spinning. Also, when you type in the keys it is displayed within the circular image. However, we removed any duplicate keys that were pressed. 

### Architecture Diagram done
+![test image](/Pics/architecture-diagram.png?raw=true "test image")

At the start of our application, we create a starting window using the 2htdp/universe library which is going to playing background introduction music. From there we are able to navigate to either a new help screen or the main program's screen. If you are at the help screen, you will be shown some tips on how to use our application, and also a keystroke that will bring you to the main program's screen. At the main program's screen, the magic happens. This is where you are able to start mixing sounds together to generate a nice beat and also record it into(hopefully) a file stored on computer.

## Schedule done
This is how are schedule looked like.........

### First Milestone (Sun Apr 9) 
For our first milestone, we have drawn our three sceens and had up and running properly using 2hdtp/universe and 2hdtp/image libraries.

### Second Milestone (Sun Apr 16) 
For our second milestone, we got RSound working properly and also got the keys strokes to generate a different RSounds.

### Public Presentation (Fri Apr 28, 2017) 
We did some code optimizations, added it some more wavs sounds (piano notes) and rewrote some functions usinghigher order functions we learned in class such as foldr and filter. 

## Group Responsibilities

### Marittya "Mike" Keu  @MarittyaKeu
I used Rackets' RSound library to create a bunch of global RSound objects and procedures to use in the main file. 

### Emmanuel Rosario @emmanrosa done
I used the 2hdtp/universe library to created scenes and saved all the user keystrokes in a list and play the sounds. Also, I filter the strings out of list, checked for duplicates and then converted the list to a string. Once I get the string, I can display then on the backgrounds using a text function from 2hdtp/image library.  
