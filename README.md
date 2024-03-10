# FPGA-Project
Faculty of Media Engineering and Technology Dept. of Computer Science and Engineering Dr. Shereen Afifi![](Aspose.Words.edf7d06f-7e0f-48d3-b200-039a4916edf6.001.png)

*CSEN 605: Digital System Design Winter 2023*

***Assignment and Project Document***

***Part 1 Homework Assignment***

1. Design a 4-bit adder on the DE10-lite FPGA board using 8 switches (4 for each input). The sum should be displayed using 5 LEDS representing the 5-bit sum.
1. Output the result on two of the 7-segment displays. (BCD addition). ***Note**: You can solve the assignment first to help you in solving the project.*

***Part 2 Project Description***

You are going to develop a project based on FPGA using the board provided to you (or optionally your own) and writing VHDL code.

The material in the course does not fully exploit the capabilities of the FPGA board so you must do so yourself by consulting the user manual as well as the internet. Some examples include Arduino connector with ADC, push buttons,

seven segment displays, an accelerometer and a VGA output.

Delivering your project by presenting a demo (A 2 to 3 min video in English that clearly shows the project and how does it work), as well as a small report that outlines the idea, the set of sensors and parts you used, the implementation (codes, circuits, pin assignment) and the results. Moreover, A real model representing your application as much as possible should be implemented and presented.

You can buy many of the external devices from the local market at:

- Future Electronics ( <https://store.fut-electronics.com/>)
  - Address: El-Sarayat street, Abdo Basha, Abasia (in front of Faculty of Engineering, Ain Shams University)
- RAM ( <http://ram-e-shop.com/>)

○ Address: 32 El Falaky St., Bab El Louk, El Tahrer, Cairo, Egypt.

You’ll be divided into **Two Batches**:

**Batch 1** : From November 16 to December 1

Evaluations for Batch 1: From December 2 to December 5 **Batch 2** : From December 6 to December 21

Evaluations for Batch 2: From December 21 to December 24

**Submission Guidelines:**

1. Submit the whole project including all the source code files.
1. Report documenting the whole project idea, inputs and outputs, pin assignment and explaining your code.
1. Video (2-3 min) showing a demo of the project running.
1. Notepad with your names, ids, tutorial number and emails.
1. Submit a folder for the assignment solution project including all the source code files.
1. Upload all the above material as a single zip file to google drive and make the link shareable.
1. Rename your zip folder by the following format

   ( TEAMNUMBER\_BATCHNUMBER).

8. Prepare a drive link containing the zipped folder to be submitted through a google form before the deadline (the form will be announced later for each batch).

**Things you should consider**

- Availability of the components (Project description has links to some stores and their contacts)
- Group formation: exactly 6 members per team or you’ll be randomly assigned.
- The contribution of each member should be clear so think of how you will divide the tasks
- Evaluation is on campus. You need to present the project to the instructor/TA and be prepared for questions and/or modifications. All group members must be present.

**NOTE THAT:**

1. **NO EXTENSIONS BY ANY MEANS TO ANY BATCH UNDER ANY EXCUSE WILL BE POSSIBLE. KINDLY STICK TO THE DATES STATED ABOVE.**
1. **Sensors and actuators cannot be replaced by switch, button, buzzer, or LEDs, etc. It can only be used as additional devices; i.e., the project shouldn’t be built upon a button and LED for example. It should be a REAL SENSOR such ( IR, proximity..etc) and the MOVING PARTS could be ( motor, water pump..etc).**

**Ideas**

**PROJECT: “Pet Feeder”**

You need to implement an automated pet feeder that dispenses food bar for a pet. You have a feeder container in which you will define the initial number of existing bars (for example: it could be the maximum capacity of the container). The pet owner should enter the amount of bars to be dispensed (e.g. 2 bars per time).

The system should detect if the pet is standing in front of the container, then dispense the entered amount of food bars for it. Also, the available amount of food bars in the container should be displayed on the screen.

**Tasks:**

1) You have to display the starting TOTAL number of bars on the 7 SEGMENT DISPLAY. (This step should be done only once at the beginning)
1) The user/owner must enter the number of bars needed using an internal/external input device.
1) Using your own choice of sensor, the system should be able to detect if the pet is standing for the food.
1) If it’s detected, the system then needs to check if there are available bars
   1. If yes, a moving part should draw the bar from the container.
   1. If not, an “EMPTY” word should be displayed on the 7 SEGMENT DISPLAY of the board.
1) The updated amount of bars available should be displayed on the 7 SEGMENT DISPLAY for each dispense action.
