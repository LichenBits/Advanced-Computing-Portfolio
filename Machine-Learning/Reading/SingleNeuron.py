# A single McCulloch-Pitts neuron with 4 inputs
import numpy as np

mi = 4 # threshold for neuron

inputs = np.array( [[0, 1, 0, 1],
                    [1, 1, 1, 0],
                    [0, 0, 1, 1],
                    [0, 1, 0, 0]])

w = np.array( [0, -3, 3, 5] )

print(inputs.dot(w)-mi)

# Theta - activation function of my neuron
for x in (inputs.dot(w)-mi):
  if x >= 0 :
    print(1)
  else :
    print(0)

# Neuron was activated three times.