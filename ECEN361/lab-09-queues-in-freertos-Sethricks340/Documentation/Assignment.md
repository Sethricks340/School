# ECEN-361 Lab-09:Queues and IPC

     Student Name:  Seth Ricks

## Introduction and Objectives of the Lab

This lab will introduce the concept of interprocess communication mechanisms, particularly queues and task messages. This will be done in the framework of FreeRTOS middleware as supplied by the STM32 ecosystem. Semaphores are also a means of simply signalling other tasks, but are not covered in this lab.

**Queues**

Queues are a well-known data structure, serving a FIFO strategy to store/forward data. The student has likely programmed with queues in other classes. We take this data structure and move it into an environment where access to the queue is available to multiple producers (tasks that add to the queue), and consumers (tasks that take first-off data from the queue.) Simple everyday analogous systems utilizing this type of structure can be seen in many operations: A tech-support call-center producing many incoming calls at a time, putting them in the queue for service, while many operators pull the calls off to consume and process them.

In FreeRTOS, the queue structure is global in nature, and available to be written-to and read-from most any other process. In general, processes will be dedicated to handing one or the other operation – either producing or consuming. Events (interrupts) can be setup to signal on various states of the queue: EMPTY, FULL, FILLED-to-a-LEVEL, etc. These can a be the source of interrupts and exceptions in processing. The queue can be configured to store any data type.

For this lab we will build a small queue pipeline with three producers, and 2 consumers. Elements that go into the queue pipeline are from the superset of all ASCII characters, but each producer has the unique quality that they deliver only subsets of the full character set, so:

**Producers**

1. Random symbols, punctuation, etc. [**‘!’ ...’/’**] (from character ‘!’ to ‘/’ in ASCII table)
    One character issued per 1500mS
2. Typed Uppercase Letters (from keyboard – PuTTY)  
    One character per keystroke – about 200mS (however fast you can type!)
3. Random lowercase letters [**a..z**]  
    One character issued per 1800mS   
    **(to be completed by student in Part 2)**

**Consumer**:

1. Reads the queue once every two seconds and displays items on the queue
2. Halt and Dump  
   This consumer looks for button 3 to be pressed, then stops production sources, and dumps the entire queue
   **(to be completed by student in Part 3)**

**Other Processes**

Status: Using the 7-Seg LEDs, the running count of of bytes currently in the queue is displayed. If ever the queue is empty or full, the display shows: “**----**” or “**FuLL**“, respectively.

The following is a simple diagram of a queue being fed by all three sources. As shown, the queue not full and no priority scheme is implemented between the producing tasks.

![A diagram of a computer code Description automatically generated](media/179869c87a04bdcb491d563b175f1d17.png)Color-coding of the item shown in the queue is added to show the source of that item.

There is also control on the production: a dedicated button start/stops each of the following producers.

- The Random Symbol Producing Task Button_1 Start/Stop
- The Random lowercase character Production Task Button_2 Start/Stop  
  **(to be completed by student in Part 2)**

As given to the student, there is a  consumer outputting process which waits for button 3 to be pressed, then sends the queue to the USART2 out. (USB TTY via PuTTY).

Note that keystrokes typed into the UART keyboard (via the TTY Terminal) are ‘filtered’ before being put onto the queue. This type of pre-processing is typical and could be likened to a real-world example of a tech-support site sending customers with different types of issues into different waiting queues.

In this code, all keystrokes typed are checked to see that they are strictly alphabetic [‘A’ … ‘z’] and then added to the queue only as uppercase. This allows us to determine the source of the item in the queue, by the type of data: uppercase, lowercase, and special-characters all can come only from their unique source producer.

## Part 1: Examine the existing code and operation

1. Verify that the queue is adding random characters (7-seg count is increasing)
2. Bring up your terminal emulator (PuTTY, etc.)
3. Press button 3 to observe the characters dumped from the queue.
      (random characters inserted with typing):  
      ![A screenshot of a computer Description automatically generated](media/5e4585218b634b7e0a932ece179d995f.png)

Now look through the code a bit and answer the following questions.

## Part 1: Questions (3 pts)

* How are the interrupts for the buttons used to start/stop the respective producers for the Queue?
  
  **Processing the buttons is done *outside* of an ISR, because it deals with queues. If it was done inside of an ISR and the queue transation process happened to block, it could make the entire program stall. 'process_button_Task' is called as a separate task, containing a while loop that constantly checks for button inputs inside of a switch statement.**

* Only uppercase characters are being shown in the queue. Are these just being shown as upper, or converted to upper before being pushed onto the queue?  Where is the line of code that does this?
  
  **The convertion of the received data to uppercase happens at this line:**
  ```c
  upper = toupper(recvd_data);
  ```
  **This takes the data and makes a new variable called 'upper', that is simply a copy of 'recvd_data' but in uppercase.**

## Part 2: Add producer and consumer routines

Note that the tasks to add the random characters are S/W timers. These are just like H/W timers, but don’t have an interrupt line. They are started in S/W and then execute a callback when they expire. They can be configured in the .IOC GUI as well. Note the callback routine name is defined here as well:

![A screenshot of a computer Description automatically generated](media/919b20e8602e33934a03131094a7b2e4.png)

The timers are configured as a part of the FREERTOS (since they are S/W based). These timers are set to be periodic – so they produce their characters repeatedly at a consistent interval.

Complete the skeleton process to start inserting random lowercase characters. Note the setup parts necessary to add a process are included,for you, see the lines:

- `void Add_Random_lowercase_to_Queue(void *argument); //(the function prototype)`
- `void Add_Random_lowercase_to_Queue(void *argument) //(this is the timer callback)`
- `lowercaseTimerHandle = osTimerNew(Add_Random_lowercase_to_Queue, *osTimerPeriodic*, NULL, \&lowercaseTimer_attributes); //(this enables the S/W Timer)`
- `osTimerStart(lowercaseTimerHandle,Random_lowercase_Timer_Speed);`

## Part 2: Questions (3 pts)

* Paste a screenshot of the TTY with the Queue now filling with all three sources:
  Typing (‘A’ .. ‘Z’);   random characters (‘!’ .. ‘=’);   and your new random lowercase (‘a’ .. ‘z’) producing task
  
  ![A screenshot of a PuTTy with Queue from Three Sources](media/part_2.png)

## Part 3: Define a “HALT” button

The code as distributed has defined two of the three buttons. In this part you’ll define the third to be a “HALT.”

Currently, they are defined:

![](media/a614dc0e13115772ef9cc38b847f6a91.png)

**S1**: Start/Stop RandomSymbols from being put in the Queue

**S2**: Start/Stop Random lowercase letters from being put in the Queue

**S3**: HALT/RESUME taking characters from Queue. Upon halting, flush the Queue  


Queue applications may have conditions that call for a stop to processing: maybe a call-operator has to take a break, or the potato truck is full and the next truck needs to come to be filled, some contaminated ingredients were introduced into the assembly line, etc.

For the last part, let’s finish the “HALT/RESTART” button that does the following:

- Disable/Resume further input (halt all the producers). See how it’s done with buttons **S1** and **S2**.
- Print a “Halting message” or "Resumed message" on the TTY
- Pull all the contents off the queue and print them

I have written the halting/queue dump part of the code, your job is to write the code to Disable/Resume further input (halt/resume all the producers).

**Here is the PuTTy output with all three inputs and halting:**

![PuTTy with all 3 buttons and halting photo](media/part_3.png)

**New button code included, for halting everything and restarting.**

```c
void process_button_Task(void *arguments)
	{
	char got_char = '\0';
	char * got_char_ptr = &got_char;
	uint8_t msg_prio =100;
	char queue_dump[QUEUE_SIZE+1]; // in case we have to add an extra '\0' to print
	while(true)
		{
		switch(button_pushed)
			{
			...
      // (other two buttons unchanged)

			case 3:
				{
				int q=0;

				if (randoms_running)     //Start the HALT here
					{
					printf("QUEUE Halted.\n\r");

					// to stop: //edited: include in report
					timer_status = osTimerStop(RandomSymbolTimerHandle);
					timer_status = osTimerStop(lowercaseTimerHandle);

					randoms_running = false;
					printf("QUEUE INPUT HALTED    Flush below:\n\r");
					printf("QUEUE   0        1         2         3         4         5\n\r");
					printf("        12345678901234567890123456789012345678901234567890\n%c%c",'\r','\r');
					while (osMessageQueueGet(ASCII_Char_QueueHandle, got_char_ptr, &msg_prio, (uint32_t) 1) == osOK)
						queue_dump[q++] = got_char;
					queue_dump[q] ='\0';		// to be a string, has to be terminated in a null
					printf("        %s\n\r",queue_dump);

					osMessageQueueReset(ASCII_Char_QueueHandle); 

					}
				else  // were halted so restart
					{
					// Cleared out the shadow to print for the string display next time
					printf("QUEUE Resumed\n\r\r");
					// Turn on the consumer
					randoms_running = true;
					// Turn on the random producers

					// to start: 
					timer_status = osTimerStart(RandomSymbolTimerHandle,Random_Symbol_Timer_Speed);
					HAL_NVIC_EnableIRQ(EXTI1_IRQn);

					timer_status = osTimerStart(lowercaseTimerHandle,Random_lowercase_Timer_Speed);
					HAL_NVIC_EnableIRQ(EXTI4_IRQn);

					}
			}
			break;
			}
			button_pushed = 0;
		    osDelay(20);  // Time to make sure the switch is debounced
		}
	}

```


## Ideas for Credit to get to 'A' & Extra-Credit (2 pts for any)

**The code said to assume that no keys were being pressed, but I didnt like that. So I added a very simple if statement, using the 'random_running' variable. Here is that code:**
```c
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
	{
	if (huart == &huart2)
		{
		if (randoms_running){ //edited: only read UART when enabled
			uint8_t upper;
			upper = toupper(recvd_data);
			srand((unsigned) recvd_data);
			osMessageQueuePut(ASCII_Char_QueueHandle, &upper, 100, 0U);
			HAL_UART_Receive_IT(&huart2,&recvd_data,1); //start next data receive interrupt
		}
		HAL_UART_Receive_IT(&huart2,&recvd_data,1); //start next data receive interrupt
	}
}
```


* Currently, the data is taken out of the queue only once every “read_pacing_delay” milliSeconds.  Add an option to change that queue read speed by way of user input.  If you add little decoding in the routine where a typed character is received, you could speed-up or slow-down the read pacing.  (That routine is: `HAL_UART_RxCpltCallback()` and already converts any character to upper case.   For example, you could make the “+” key make it go faster by lowering the pacing by 100mS.
  
  
**I decided to do the above as well. I added some simple checks for the '+' and '-' signs, which incremented and decremented the 'read_pacing_delay' variable, respectively. I found that anything below 500 ms results in an inevitably empty queue, due to items being taken out faster than put in. Around 600 ms, it was around stable to one value. The code and a screenshot of this are included below.**


```c
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart)
	{
	if (huart == &huart2)
		{
		if (randoms_running){
			uint8_t upper;
			upper = toupper(recvd_data);
			if (recvd_data == '+'){
			    printf("Plus detected, increasing read_pacing_delay to %d\n\r", read_pacing_delay);
			    read_pacing_delay += 10;

			}
			else if (recvd_data == '-'){
				if (read_pacing_delay >= 20){
				    read_pacing_delay -= 10;
				    printf("Minus detected, increasing read_pacing_delay to %d\n\r", read_pacing_delay);
				}
				else{
				    printf("Reached min pacing delay.\n\r");
				}
			}
			srand((unsigned) recvd_data);
			osMessageQueuePut(ASCII_Char_QueueHandle, &upper, 100, 0U);
			HAL_UART_Receive_IT(&huart2,&recvd_data,1); //start next data receive interrupt
		}
		HAL_UART_Receive_IT(&huart2,&recvd_data,1); //start next data receive interrupt
	}
}
```

![PuTTy with all 3 buttons and halting photo](media/extra_credit.png)