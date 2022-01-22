# Artificial-Intelligence-Applied-to-Control-Systems-Projects

Projects and assignments for the Artificial Intelligence 
Techniques to Control Systems
course at UCM, with topics such as: 
- Smart control.
- Expert systems. 
- Neural Networks. 
- Logic Diffuse. 
- Evolutionary computing. 
- Intelligent agents


## PRACTICE 1: Modelling, Identification and Control 

By means of some calculation computer program, 
identify a system whose input and output data are known using
Matlab's cftool or basic fitting. 

Proyect: [here](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/tree/main/Practica1#readme)

## PRACTICE 2: PID Controller

The goal of this project was to construct PID controllers and learn how they work:

Using Matlab/Simulink, identify an open-loop system and use the model 
parameters to tune a closed-loop PID controller. Use the “system” simulink block, supplied inside the “plant” simulink model (plant.zip).

Proyect: [here](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/tree/main/practica2#readme)

## PRACTICE 3: Expert Control Systems

Project aimed at the construction of a PID controller through an expert system:

Automatically improve the qualitative tuning of the parameters of a
PID controller through an expert system whose inference engine is formed
by a set of rules obtained from experience.

Proyect: [here](https://github.com/DanielaCordova/Artificial-Intelligence-Applied-to-Control-Systems-Projects/tree/main/practica3#readme)

## PRACTICE 4: Fuzzy Control

Project aimed at the construction of a Fuzzy control system.


## PRACTICE 5: Neuro Control
This project is aimed at creating a neural network that controls a robot arm

**PART 1:** 

a) Design a neural network using the Matlab/Simulink *nntool* tool that performs the XOR function. 
Observe the influence of the network parameters on the error convergence. Try various learning strategies. 

**PART 2:** 

In this practice we are going to make use of a set of neural networks to move a robot arm. 
We will use the arm model shown in Figure 1 as a platform to obtain arm movement data, and to train and validate the constructed networks. 

This arm has five joints:
1. Base: The arm can rotate around its base.
1. Shoulder: Allows vertical rotation of the entire arm.
1. Elbow: allows all the parts of the arm to rotate vertically from that joint onwards.
1. Wrist (vertical joint): allows the gripper to rotate vertically.
1. Wrist (horizontal joint): allows the clamp to rotate left and right.

All the joints have been simulated without stops, which means that they can freely rotate 360º. 
In addition, the model does not take into account the collisions of its moving parts with each other. 
Therefore, the model can perform movements that would be impossible for a real arm.

## PRACTICE 6: PID Parameters Optimization by Using Genetic Algorithm 

The goal of the project was to develop a PID controller through genetic algorithms.

## License

[MIT](https://choosealicense.com/licenses/mit/)


## Author

- [@DanielaCordova](https://github.com/DanielaCordova)
