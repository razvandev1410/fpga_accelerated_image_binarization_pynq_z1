This project implements a real-time hardware-accelerated system for grayscale image binarization using the PYNQ-Z1 board. By switching the computational effort from the CPU to the FPGA (Programmable Logic), the system avoids processing bottlenecks associated with high-resolution images.

Experimental results demonstrate a massive performance improvement when using the FPGA accelerator compared to a reference software implementation running on the ARM Cortex-A9 CPU:

Hardware Execution Time (FPGA): ~0.013 seconds
Software Execution Time (ARM CPU): ~43.3 seconds
Speed-up Factor: ~3332x


Setup and Usage
Connect the PYNQ-Z1 board to a power source and link it to an external display via the HDMI OUT port.
Connect the board to your local network/laptop via an Ethernet cable.
Insert the SD card containing the image to be processed.
Power on the board and access the Jupyter Notebook environment via your browser (e.g., http://192.168.2.99:9090/?token=...).
Run the provided Python script to allocate contiguous memory, load the .bit overlay (design_1_wrapper.bit), and initiate the DMA transfer.
The processed binary image is sent back to the RAM and displayed on the connected HDMI monitor.
