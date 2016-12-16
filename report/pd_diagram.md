graph TB

  subgraph Control
    PD[Pattern designer]
    Tempo
    SP[Sampler pitch]
    SL[Samples loader]
  end

  PD -- set density/<br>randomize pattern --> Seq[One sequencer out of 8]
  Tempo --> Seq
  SP -- set rate/randomness --> Sam[One sampler out of 8]
  SL -- load random sample --> Sam


  Seq -- bang for onset --> Sam
  Sam --> ezdac
