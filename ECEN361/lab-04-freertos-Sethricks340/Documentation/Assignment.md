# ECEN-361 Lab-04:FreeRTOS & Multi-tasking

     Student Name:  Fill-in HERE

## Introduction and Objective of the Lab

In Lab-02, we saw how individual counter blocks could initiate tasks and work like a multi-tasking system. Each timer block would produce an interrupt, launch the task, then re-start its count. In “parallel” we had

- 3 different LEDs blinking
- A timer cycling thru, displaying each of the Seven-Segment display digits.
- Random Reaction Timer counting
- A response-timer keeping track of how long till a button was pressed.
- A serial port timer sending UART data to the USB-COM: port.

While this operated like a multi-tasking system, the reality is that there were very strict limitations and flexibility to this system. Our Nucleo was running out of timer blocks, there was no controlled/shared memory, interrupts had to planned such they were never “nested,” etc. This brute force approach is not scalable.

In Lab-03 we examined a simple approach to looking at how to launch multiple jobs per a scheduler.

Our next step is to implement a true, commercial-grade RTOS, which gives us all the infrastructure needed to implement multi-tasking. Instead of using multiple counters/timers/interrupts, we will now let the RTOS manage task swapping, memory management, and all else, based on a single timer: SYSTICK.

FreeRTOS will be the RTOS of choice for this class. The benefits and reasons for this system are reviewed in class, and it is supported directly with the STM32CubeIDE that we use. This lab will be the first use of FreeRTOS in our labs and has the following objectives:

* **Part 1:** Introduction of FreeRTOS with a process-based 'blinky' project.

* **Part 2:** Creation of tasks to do the same things we did in Lab-02, but with processes controlled by FreeRTOS instead of setting-up and controlling all the timers.

For each of the parts, follow the instructions, then fill in answers to the questions. Expected answers are indicated with "[*answer here*]".

## Lab Instructions

### Part 1.1: Starting with the YT-based, add the MultiBoard into the project

Before the lab, you should have followed the instructions for the Pre-lab-4 Exam, and built a 'blinky' that runs from FreeRTOS.

With that project working, power-down the Nucleo, add on the multi-function shield, and start your FreeRTOS blinky again.

### Part 1.2: Questions (2pts)

* Which light blinks on the multiboard (i.e., Dx)?
  
  * **D1**

* Are the multiboard LED and main Nucleo LED in sync with one another (i.e., do they turn on and off at the same time with same logic)? Why or why not?
  
  * **No, they are not in sync. In fact, they are perfectly out of sync. This is because the onboard led on the nucleo board is active high, while the led on the multifunction board is active low. So while one is on, the other is off, and visa versa.**

Finally, locate the process in the code where the on-board light is toggled. Look for:

**HAL_GPIO_TogglePin(GPIOA,GPIO_PIN_5);**

**osDelay(2000);**

With the MultiFunction Board in place, change that line to toggle the LED D4 instead:

* Explore the differences between the two “delay” calls: HAL_Delay and OsDelay
  
  * **The OsDelay call allows the schedueler to run other tasks while we wait for this delay. The HAL_Delay is blocking, so it doesn't allow anything else to run.**

**HAL_GPIO_TogglePin(LED_D4_GPIO_Port,LED_D4);**

### Part 2.1: Using the Multi-Board and Launching other FreeRTOS tasks

Now, import this lab's project into your workspace with File/Import and point to the directory of the this lab project.

Clean and build the project and observer that there are no errors or warnings.

Run the project and observe that the D2_LED blinks at 1 Hz (once per second).

*Note that the D1_LED is not being used because it is tied to the built-in user LED on the STM32 board. These two are in conflict with one board treating it as active-high, and the other as active-low. So, D1_LED is unused.*

There is no seven-segment display.

#### Task: Create 2 more blinking events with tasks (no interrupts or timer blocks this time) (3 pts)

New Task Handles and attributes can be added through the STM32 .ioc GUI:

![](media/Add_task.png)

Note that to add a new task in FreeRTOS, three things have to be coded. These are labelled with comments in “main.c” as “Task-Part-A,” “Task-Part-B,” and “Task-Part-C”. As they are discussed below - find these comments in the code for reference.

1. `/******* Task-Creation-Part-A *********/`
   
   * Declare a prototype for the function (this is a requirement for the C-compiler to link)

2. `/******* Task-Creation-Part-B *********/`
   
   * Write the task process itself

3. `/******* Task-Creation-Part-C *********/`
   
   * Launch the task by putting it in the scheduling queue

Note that the “StartDefaultTask “ is required when the system is built. That task currently blinks the D1_LED at 1000mS. Using the single task in the code as a prototype (“StartDefaultTask”), create three more tasks that blink:

* D2_LED: Once every 500 mS
* D3_LED: Once every 250 mS
* D4_LED: Once every 125 mS

## Part 2.2: Seven Segment Display Counter (5pts)

Now add one final task that display a counter on the Seven-Segment LED display. Count up from 0, and increment the count once per 1500 mS.

## Ideas for Credit to get to 'A' & Extra-Credit (2 pts for any)

* Stop one of the LED processes when the digit count gets to 20. Explain how you did it. Did you use a global variable? Or read about and use the oSSuspend task API?
  
  **In the interest of time, I decided to make the Seven Seg LEDs stop at 9999 instead of wrapping back around to zero. I did this with the following code, the commented out portion is my original function.**

  ```c
  void SS_Task(void *argument)
    {
	while(true)
        {
        //			MultiFunctionShield_Display (count);
        //			count = (count < 9999) ? (count + 1) : 0; // Wrap back around to 0
        //            osDelay(count_time);

			MultiFunctionShield_Display (count);
			count = (count < 9999) ? (count + 1) : 9999; // Wrap back around to 0
          osDelay(count_time);
        }
	osThreadTerminate(NULL);
    }
  ```

* Eliminate the SevenSegment refresh routine, currently based off timer17, so that it refreshs like any other process to give the appearance of all 4 digits being turned on at the same time. Explain what you did.
  
  * [*answer here*]

* Use one of the push buttons from an earlier lab to set up an interrupt such that it doubles the count frequency of the 7-Segment LED counter to go faster and faster.   Explain how you did it.

**I did this part with the following code:**
  
  ```c 
  ...
  // USER PV (changed from macro)
  int count_time = 1500;
  ...

  void HAL_GPIO_EXTI_Callback(uint16_t GPIO_Pin)
	{
	// Button 1 generate GPIO interrupts
	switch(GPIO_Pin)
	{
	  case Button_1_Pin:
    // If dividing count time by two results in a truncated value of 0, reset the count time
		count_time = (count_time > 0) ? (count_time / 2) : 1500;
		break;
	  default:
      __NOP();
	}
  ```

  **The button triggers the interrupt, which divides the count time variable down by two. If it reaches the point where integer division results in a 0, then it resets the count time to 1500 ms.**


* Finally, even though it told me not to, I decided to change the LED1 code so that it also blinks in sequence with the other binary countdown. The comments are the original code. I did this with the following code:

```c 
  //  /*Configure GPIO pin : LED_D1_Pin */
  //  GPIO_InitStruct.Pin = LED_D1_Pin;
  //  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_OD;
  //  GPIO_InitStruct.Pull = GPIO_PULLUP;
  //  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  //  HAL_GPIO_Init(LED_D1_GPIO_Port, &GPIO_InitStruct);

  // I was told not to change this, but I did anyway
  /*Configure GPIO pin : LED_D1_Pin */
  GPIO_InitStruct.Pin = LED_D1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;   // push-pull instead of open-drain
  GPIO_InitStruct.Pull = GPIO_NOPULL;           // no internal pull-up
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_VERY_HIGH;
  HAL_GPIO_Init(LED_D1_GPIO_Port, &GPIO_InitStruct);

  ...


  /* USER CODE END Header_StartDefaultTask */
void StartDefaultTask(void *argument)
{
  /* USER CODE BEGIN 5 */
/* This task is created automatically and can't be deleted
*/
/* Infinite loop */
  for(;;)
  {
	  //  HAL_GPIO_WritePin(LED_D1_GPIO_Port,LED_D1_Pin,1); //Active low on the multiboard
	  // I was told not to change this, but I did anyway
	  HAL_GPIO_TogglePin(LED_D1_GPIO_Port,LED_D1_Pin); // Toggle LED1
	  osDelay(D1_time);
  }
  // If we goof, exit gracefully
  osThreadTerminate(NULL);
  /* USER CODE END 5 */
}
```

**I changed the Open Drain to Push-Pull, which allows the LED to fully turn on and off. I also changed the WritePin HAL function to Toggle Pin, so that the LED actually changes and doesn't just stay on. I also changed the configuration to be with a no internal pull up, since the main nucleo board already has one.**