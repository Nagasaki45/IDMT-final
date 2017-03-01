graph LR
  subgraph Hardware
    L1[Load cell A] -- analog voltage --> HX711
    L2[Load cell B] -- analog voltage --> HX711
    HX711 -- digital voltage --> Arduino
  end
  subgraph Sofware
    Arduino -- serial --> Python
    Python -- OSC --> Pd
  end
