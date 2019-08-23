<br>
<br>

# NEST+m Auditorium Consulting


## Introdution
NEST+m is a local k-12 public school located in the lower east side of Manhattan, New York. They approch to us, the Cooper Union Acouistic and Vibration Laboratory for help
because of their auditorium's bad acoustical environment. The school's auditorium is fan-shaped witha volumn of about 529 seats. The school is concenred due to auditorium's high reverberation time(echoness) and low intelligibility. 
<br><br>
This project seeks a low-cost solution for reducing the reverberation time while also engaging the
schools’ students in a creative and interactive project. My teammate and I offered the school a proposed solution based on our meaurement during the site visit. The proposed solution was backed up using CATT Acoutsic modeling.
After NEST+m acceptted our proposal, we did another measurement to see if the expected improvment is accomplished. 
<br><br>

## Initial Site-Visit
Upon our first visit, we took __Rverberation Time(RT)__ measurement to see what we are facing for this auditorium.  

*__Reverberation Time__*  
Reverberation time describes how long sound energy stays in a given space. It is often precived as echoness of the space.  

We used interrupted method, which means we excited the room with enough sound energy and measure the time for the sound to decay. The foloowing plot shows our measured RT of the auditorium

<img src="pic/RT_mea.png?raw=true"/>
<br>
It is clear that the RT is too __high__ for an auditorium.

## Recommandation and Prediction
We aim to find a low-cost solution to bring down the RT of the auditorium, so we proposed acoustic panels for the school.
We use Sabine's formula to caculate what would the expected RT be with acoustic paneland how many panels we need. 
<img src="pic/result_1.PNG?raw=true"/>
<br> <br>
The school accepted our proposal of using 12 4'\*8' Knauf panel convering 384 ft^2 with only about $4000 on cost 

## Second Site-Visit
Afer installation, we pay the auditorium a second visit and did a more rigirous measurement. We also did a thorough modeling of the auditorium acoustic simulation software CATT. The foloowing cintent detailed our measurememt, derivation, and modeling of the acoustical property of the NEST+m auditorium.  

### Measurement & Matlab Code
Our measurement aim to capture the impulse response of the auditorium. By measuring the impulse response of the space using a sine sweep, we could derived all the needed acoustical index and parameter we need using Matlab. For this project, we drived RT, Early Decay Time (EDT), and Clearity Index(C50 and C80). Matlab script used for this project is uploaded to the project repository. For all the Matlab implementation of acousstical DSP function, please go to the [Acoustical DSP in Matlab](https://github.com/raymondminglee/Acoustic-Consulting) page.  
The following plots are impulse response of the space, and energy decay curve for deriving time decay of the sound.
<img src="pic/matlab_plot.PNG?raw=true"/>

-[Matlab Code](https://github.com/raymondminglee/Acoustic-Consulting)

## Modeling and Simulation
Model of the auditorium is created using SketchUp and imported into CATTAcoustic software.  
### Sketch Up Model
<img src="pic/sketchup.png?raw=true"/>

### CATT Acoustic simulation result
<img src="pic/catt.png?raw=true"/>

### Comparison between Simulation and Measurement
<img src="pic/sim_plot.PNG?raw=true"/>




---




