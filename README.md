# Producer Hero

### Statement 
The concept of our project is to create a mixer that music producers often use. We have used the RSound, 2htdp/Universe, and 2htdp/image libraries to use in our project. For this project, we made an application that use the keyboard to generate an RSound and the end user can channel their inner producer to create a beat. The application allows the user to record the beat they've generated and play it back.

### Analysis 
At first we thought it would be hard to implement this program without using some of the things we had learned in class. We thought that because all of the three libraries we used have their own functions. However, we implemented a function that appends item into a new list. We filter string? and filter rsound? to takes the items that we need from the list. We apply map to the string-join function that takes a list. In addition, we use an image recursion function from the image.rkt, but we did a few changes and updates for the background.


### External Technologies 
We did not use any external technologies.


### Data Sets or other Source Materials
RSound uses and manipulate wav files so we downloaded an 808 drum kit to use in our project from the following sites...

http://hiphopmakers.com/free-808-drum-kit-227-samples

Beethoven's 5th Symphony (Introduction music)
https://www.youtube.com/watch?v=_4IRMYuE1hI

This website was used to convert the youtube file into an mp3 file.
http://www.youtube-mp3.org/

We used this website to convert our mp3 file to a wav file.
http://audio.online-convert.com/convert-to-wav

### Deliverable and Demonstration
We have a fully functional mixer application. The application has a help menu with all of the key maps. The key map explains what each RSound or procedures corresponds to which keys. At the play menu, the user can interact with the application using the keyboard and play a bunch of different RSounds to generate a nice beat (or if you're like us, generate a bunch of random noises). Also, we implemented some features which allows the user to playback the sounds they've played back so far, play the playlist in reverse, record the sound, and also save the sound to the local computer.


### Evaluation of Results 
We have a successful running program. In addition, we ran every individual functions, tested every keys, and made sure they run the way it is suppose to run.


### Screenshot 
![main image](/Pics/main.png?raw=true "main image")
This is our main menu screen. To advance to the next screen (help menu) type h.

![help image](/Pics/help.png?raw=true "help image")
This screen is our help menu. It has a map key to show what sound each key stroke will generate. Press the space bar to advance to the next screen. 

![hero image](/Pics/producer.png?raw=true "hero image")
The final screen is where the magic happens. We used a recursive circular image that was given as an example in the Racket documentation and added a neat feature that randomly changes the images' color. This gives it a neat feature and gives the illusion that the image is spinning. Also, when you type in a key, it is displayed inside of the circular image. However, we removed any duplicate keys that were pressed. 

### Architecture Diagram done
![test image](/Pics/diagram.png?raw=true "test image")

At the start of our application, we created a starting window using the 2htdp/universe library which is going to be playing background introduction music. From there we are able to navigate to a new help screen. You will be shown a key map to show what keys generate what sound. From there, we navigate to the main application screen. There is where the magic happens. This is where you are able to start mixing sounds together to generate a nice beat. You can also play back a list of the sound you've created thus far or play it in reverse.
## Schedule

### First Milestone (Sun Apr 9) 
For our first milestone, we have our three scenes up and running properly using 2hdtp/universe and 2hdtp/image libraries.

### Second Milestone (Sun Apr 16) 
For our second milestone, we got RSound working properly and also got the keys strokes to generate a different RSounds.

### Public Presentation (Fri Apr 28, 2017) 
We did some code optimizations, added it some more wavs sounds (piano notes) and rewrote some functions usinghigher order functions we learned in class such as foldr and filter. 

## Group Responsibilities

### Marittya "Mike" Keu  @MarittyaKeu
I used Rackets' RSound library to create a bunch of global RSound objects and procedures to use in the main file. 

### Emmanuel Rosario @emmanrosa 
I used the 2hdtp/universe library to created scenes and saved all the user keystrokes in a list and play the sounds. Also, I filter the strings out of list, checked for duplicates and then converted the list to a string. Once I get the string, I can display then on the backgrounds using a text function from 2hdtp/image library.  
