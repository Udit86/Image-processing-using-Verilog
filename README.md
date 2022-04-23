# Image-processing-using-Verilog
General image operations on a Grayscale Image using Verilog

The design module is able to perform following operations on a grayscale image :- 
1. Increase Brightness
2. Decrease Brightness
3. Image Thresholding
4. Image inversion

The Working process of the code is as follows:-

The "txt_to_jpg.py" file is used to create a .txt file which contains pixel values of an image in 8-bit binary format.
The obtained text file is then passed into the simulation source file of verilog i.e. "Image_parser.v".
The Design Module is in "Main.v".
The simulation source returns a text file with the processed image in similar format as the input file.
Then "jpg_to_txt.py" file is used to create .jpg file from the text file obtained after simulation.
