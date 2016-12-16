Butterfly Simulator –  AKA flash MotionBlur Demonstration
==============

***Multidirectional Motion blur with speed tracking. Quality tricks improve performances***

![preview](/assets/img/motionblur.jpg?raw=true "preview")  

## Butterfly Simulator LIVE DEMO

*Just giggle the butterfly as fast as you want !*  
1. [Normal](http://aekuo.com/mathieu/butterfly/index.html)  
2. [Slow Motion](http://aekuo.com/mathieu/butterfly/slow_motion.html)  

## MotionBlur API  

### Add motion blur tracking to a displayobject :

	new MotionBlur(target, blurQuality [, light]);

blurQuality : mainly for performance, see below, 3 avalable presets :  
	MotionBlurQuality.HIGH  
	MotionBlurQuality.MEDIUM  
	MotionBlurQuality.LOW  
light : optional, greater than 1 mignifies the light for bright source targets  

### MotionBlurQuality :

	new MotionBlurQuality(scaleX, scaleY, stageQuality, minSpeed, tolerance, smooth, objectVisible, maxMilisecond);  

scaleX : default 2, resolution reduction factor in the movement direction (performace trick)  
scaleY : default 1, resolution reduction factor in the transvers direction (more visible)  
stageQuality : default StageQuality.LOW, rendering optimization, motionblur hides imperfections  
minSpeed : default 30, min speed to render the effect, we don't want it all the time  
tolerance : default 0.1, min acceleration before rerendering the blur  
smooth : default false, antialiazing  
objectVisible : default false, set the target visible on top of the motion blur  
maxMilisecond : default 0xffffffff, not implemented  

## Further documentation  

No butterflies have been injured during this experiment  