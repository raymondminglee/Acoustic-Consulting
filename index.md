<br>
<br>

# NEST+m Auditorium Consulting
---
## Introduction
---
NEST+m, New Explorations into Science, Technology + Math, is a local k-12 public school located in the lower east side of Manhattan, New York. They approach us, the Cooper Union Acoustic and Vibration Laboratory for help
because of their auditorium's bad acoustical environment. The school's auditorium is fan-shaped with a volume of about 529 seats. The school is concerned due to auditorium's high reverberation time(echoes) and low intelligibility. 
<br><br>
This project seeks a low-cost solution for reducing the reverberation time while also engaging the
schools’ students in a creative and interactive project. My teammate and I offered the school a proposed solution based on our measurement during the site visit. The proposed solution was backed up using CATT Acoustic modeling.
After NEST+m accepted our proposal, we did another measurement to see if the expected improvement is accomplished. 
It is a chance for the Cooper Union Acoustic and Vibration Laboratory to give back and engage in community outreach.
<br><br>
## Initial Site-Visit
---
Upon our first visit, we took __Rverberation Time(RT)__ measurement to see what we are facing for this auditorium.  

*__Reverberation Time__*  
Reverberation time describes how long sound energy stays in a given space. It is often perceived as echoes of the space.  

We used the interrupted method, which means we exited the room with enough sound energy and measure the time for the sound to decay. The following plot shows our measured RT of the auditorium

[<img src="pic/RT_mea.png?raw=true"/>](https://github.com/raymondminglee/Acoustic-Consulting/blob/master/pic/RT_mea.png)
<br>
It is clear that the RT is too __high__ for an auditorium.
## Recommendation and Prediction
---
We aim to find a low-cost solution to bring down the RT of the auditorium, so we proposed acoustic panels for the school.
We use Sabine's formula to calculate what would the expected RT be with acoustic panels and how many panels we need. 
[<img src="pic/result_1.PNG?raw=true"/>](https://github.com/raymondminglee/Acoustic-Consulting/blob/master/pic/result_1.PNG)
<br> <br>
The school accepted our proposal of using 12 4'\*8' Knauf panel covering 384 ft^2 with only about $4000 on cost 
## Second Site-Visit
---
After installation, we pay the auditorium a second visit and did a more rigorous measurement. We also did thorough modeling of the auditorium acoustic simulation software CATT. The following content detailed our measurements, derivation, and modeling of the acoustical property of the NEST+m auditorium.  

### Measurement & Matlab Code
Our measurement aims to capture the impulse response of the auditorium. By measuring the impulse response of the space using a sine sweep, we could derive all the needed acoustical indexes and parameters we need using Matlab. For this project, we derived RT, Early Decay Time (EDT), and Clarity Index(C50 and C80). Matlab script used for this project is uploaded to the project repository. For all the Matlab implementation of the acoustical DSP function, please go to the [Acoustical DSP in Matlab](https://github.com/raymondminglee/Acoustic-Consulting) page.  
The following plots are the impulse response of space and energy decay curve for deriving time decay of the sound.
[<img src="pic/matlab_plot.PNG?raw=true"/>](https://github.com/raymondminglee/Acoustic-Consulting/blob/master/pic/matlab_plot.PNG)

-[Matlab Code](https://github.com/raymondminglee/script)
## Modeling and Simulation
---
Model of the auditorium is created using SketchUp and imported into CATTAcoustic software.  
### Sketch Up Model
<img src="pic/sketchup.png?raw=true"/>

### CATT Acoustic simulation result
<img src="pic/catt.png?raw=true"/>

### Comparison between Simulation and Measurement
[<img src="pic/sim_plot.PNG?raw=true"/>](https://github.com/raymondminglee/Acoustic-Consulting/blob/master/pic/sim_plot.PNG)

## Auralization
---
Now, since we have the actual impulse response of the room, we could do something interesting here, called __Auralization__. Which means, we could feed in an audio clip of music recorded anechoic and get out what we would perceive as if this piece of music is being played in this auditorium.

Here is a recording of Beethoven's Symphony No 7 in the anechoic chamber. It should sound very __dry__ cause there is no reverberation associated with this recording.  
[Original Recording](/audio/Beethoven_orig.m4a)  
Now, let's hear how this piece would sound like if it is being played at NEST+m's auditorium  
[Aurulized audio](/audio/Beethoven_sim.m4a)  

## Comprehensive Report and Presentation
---
If you are interested, a comprehensive report, a summary of our proposal to the school and presentation slides are available for download.  

-[Proposal Summary](https://github.com/raymondminglee/Acoustic-Consulting/blob/master/doc/NEST%2Bm_summary.pdf)
-[Comprehensive Report](https://github.com/raymondminglee/Acoustic-Consulting/blob/master/doc/NEST%2Bm_Report.pdf)
-[Project's Slides](https://github.com/raymondminglee/Acoustic-Consulting/blob/master/doc/Presentsation.pdf)





---
