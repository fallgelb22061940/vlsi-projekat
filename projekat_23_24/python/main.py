import serial as serial
import numpy as np
import struct as struct
import matplotlib.pyplot as plt
from PIL import Image #dodato

IMAGE_SIZE = 256

# Read image from FPGA
# Uncomment for pyserial read
ser = serial.Serial('COM4', 115200)

fpgaIm = np.zeros([IMAGE_SIZE, IMAGE_SIZE])

pixelValsRaw = ser.read(int(IMAGE_SIZE*IMAGE_SIZE))
pixelVals = struct.unpack(f'<{int(IMAGE_SIZE*IMAGE_SIZE)}B', pixelValsRaw)

fpgaIm = np.reshape(np.array(pixelVals), [IMAGE_SIZE, IMAGE_SIZE])

print(fpgaIm)

plt.imshow(fpgaIm, cmap='gray', vmin=0, vmax=255)
plt.title("FPGA image")
plt.show()

# Read corrupted image from SW file

#swIm = plt.imread('lenaCorrupted.bmp')
swIm = np.array(Image.open('lenaCorrupted.bmp')) #dodato
swIm.setflags(write=1)                           #dodato

plt.imshow(swIm, cmap='gray', vmin=0, vmax=255)
plt.title("SW original image")
plt.show()

# Plot differences between FPGA and SW image
plt.imshow(swIm-fpgaIm, cmap='gray', vmin=0, vmax=255)
plt.title("Differences between FPGA and SW image")
plt.show()

# Histogram equalization
# Calculate histogram
pixVals = np.arange(0,256)
h = np.zeros(256)

for r in range(swIm.shape[0]):
    for c in range(swIm.shape[1]):
        h[swIm[r][c]] += 1

plt.stem(pixVals, h)
plt.title("SW image histogram")
plt.xlabel("Pixel value")
plt.ylabel("Number of pixels")
plt.show()

# Calculate cumulative histogram and an equalization map
ch = np.zeros(len(h))
for p in range(len(h)):
    ch[p] = np.sum(h[0:p])

cdf = ch/(swIm.shape[0]*swIm.shape[1]/256)
plt.plot(pixVals, cdf)
plt.title("Equalization map")
plt.xlabel("Input pixel value")
plt.ylabel("Output pixel value")
plt.show()

# Equalize
for r in range(swIm.shape[0]):
    for c in range(swIm.shape[1]):
        swIm[r][c] = cdf[swIm[r][c]]

plt.imshow(swIm, cmap='gray', vmin=0, vmax=255)
plt.title("SW equalized image")
plt.show()
