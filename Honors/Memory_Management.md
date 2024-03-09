# Lab: Memory management (Honors contract)

## Objectives
Identify types and sizes of memory

## Tasks
Perform the following tasks:  
1. Identify the size and cache levels of a computer. You can use your personal computer for this task.
2. Identify which devices use SRAMs and DRAMs.

## What do you think I should submit?
- Write a two-three-page long document.
  
## How to submit it?
Upload your work in the .pdf or .txt format and clearly define your responses. Use headings when possible and cite references.

## Deadline
The deadlines are posted on the Canvas.

## Rubric
- The document is not over three-letter pages, and the tasks are detailed. (10 marks)  
- The document length is within the boundary; however, the explanation is not detailed. (6+ marks)
- The document length is over three pages, or the explanation needs to be clarified. (0 marks)















Memory Mastery:
Exploring the Spectrum of Computing Memory Types, Cache Levels, and Applications
Computer Organization and Assembly Language
Dr. Danish Khan
Sophia Su 










Memory Mastery
Memory plays an important role in the performance and the functionality of modern computing systems. From storing data temporarily for processing to accelerating tasks through caching mechanisms, memory types and sizes significantly impact overall system efficiency. In this essay, I aim to dive into the intricacies of memory in computing, covering various aspects such as types, sizes, cache levels, and their applications.
Cache Levels in Modern Processors
Typically, memory size is measured in units like kilobytes (KB), megabytes (MB), gigabytes (GB), and terabytes (TB). Nowadays, modern processors incorporate multi-level cache memory systems, including L1, L2, and L3 caches, each with their own varying capacities and transfer speeds. Modern computers use these multi-level cache memory systems so that data can be stored on a chip temporarily and accessed quickly. 
The differences in L1, L2, and L3 cache memory can be distinguished by the capacity and transfer speed. While the primary cache, L1, is the smallest capacity, it is extremely fast. L2, on the other hand, is slower but has a greater ability to store information, while L3 is the slowest amongst the three caches but typically has the largest storage capacity. Unlike the L1 and L2 caches, which are embedded within each of the CPU cores, the L3 cache is a memory pool which is shared among all the cores on the CPU and can be used by the entire processor. This reduces memory access latency by storing frequently accessed data closer to the CPU cores. Occasionally there is also L4, and all of these levels have distinctions in their size, location, and speed.	




Comparison in Cache Levels: M1 vs. Xeon
Upon doing some research on my own 2020 Macbook Air’s M1 chip, I found out that it is a series of ARM-based SoC with eight cores which are four performance cores and four power-efficiency cores. The four performance cores have 192 KB of L1 instruction cache, 128 KB of L1 data cache, and 12 MB shared L2 cache. The four energy efficiency cores are smaller, with 128 KB L1 instruction cache, 64 KB L1 data cache and a 4MB shared L2 cache. The last level cache size, L3, is 8MB shared among all cores.
I believed it would be interesting to compare the cache levels of this Mac to my PC, a Dell Precision 7550. It has an Intel Xeon W-10855M Processor, with a L1 cache of 384 KB per core, L2 cache of 1.5 MB per core, and L3 cache of 12 mB shared across all 6 cores. To sum up, the Xeon has larger L1, L2, and L3 caches compared to both the performance and efficiency cores of the M1 chip. Upon researching some benchmark test comparisons between the two, I was surprised to find that the M1 chip overpowers the Intel chip [1][2]. 
Interplay between SRAM and DRAM
Since our discussion revolves around caches, it's essential to explore the interplay between Static Random Access Memory (SRAM) and Dynamic Random Access Memory (DRAM). SRAM, known for its speed, often finds application in a computer's cache memory, typically within the processor's L2 or L3 cache. However, the main memory for most computers is DRAM due to its higher density and lower cost. This enables DRAM to store more data within a given area, making it ideal for serving as RAM in systems requiring extensive storage capacities, albeit with a trade-off in speed.
Both SRAM and DRAM are volatile memory types, meaning they lose data when power is interrupted. Despite this shared characteristic, there are significant differences between them, particularly in their construction. SRAM stores each data bit using a flip-flop circuit, allowing for binary representation as 0 or 1. This mechanism relies on six transistors, with four allocated to storing the bit and the remaining two managing cell access.
In contrast, DRAM requires only one transistor and one capacitor per bit. The capacitor's charge determines whether the bit is 1 or 0, and the transistor functions as a switch for reading and altering the capacitor's state. Although DRAM offers higher capacity compared to SRAM, or similar size, its capacitors are prone to electron leakage, resulting in charge loss over time. Consequently, DRAM requires periodic refreshing to preserve data integrity. While SRAM outperforms DRAM and consumes less power, it is more expensive and offers lower data storage capacity. These trade-offs highlight the nuanced selection process between SRAM and DRAM based on specific computing system requirements.
Applications of SRAM and DRAM
SRAM finds application in various devices, including cache memory in CPUs, networking equipment, high-speed registers, and embedded systems like medical devices, printers, and GPUs. On the other hand, DRAM is commonly used as main memory (RAM) in computers, graphics cards, servers, mobile devices, gaming consoles, digital cameras, network equipment, automotive electronics, and smart TVs.
In conclusion, memory types and sizes are pivotal components of computing systems, exerting significant influence on performance and efficiency. Familiarity with the characteristics and applications of different memory technologies is important for optimizing system design and achieving efficient computational tasks. We shall continue to work together to explore and innovate in memory technology so we can create a better future for humanity.


References:
1. CPU-Monkey. "Intel Xeon W-10855M vs Apple M1." CPU-Monkey, https://www.cpu-monkey.com/en/compare_cpu-intel_xeon_w_10855m-vs-apple_m1. Accessed [8 March, 2024].
2. Notebookcheck. "W-10855M vs M1." Notebookcheck, https://www.notebookcheck.net/W-10855M-vs-M1_12207_12937.247596.0.html. Accessed [8 March, 2024].






