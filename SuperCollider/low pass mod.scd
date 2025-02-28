s.boot


(
Ndef(\modulatedMic, {
    var micInput, noiseGate, lowPass, modAmp, modFreq, delay, echo, modulatedInput;

    // mic
    micInput = SoundIn.ar(0);

    // noise gate to clean the input signal
    noiseGate = Compander.ar(micInput, micInput, 0.2, 1, 0.1, 0.01, 0.05);

    // low-pass filter to remove high-level frequencies 
    lowPass = LPF.ar(noiseGate, 500);  // Cutoff frequency at 500Hz (adjust as needed)

    // amplitude, speed, and rhythm modulation
    modFreq = SinOsc.kr(0.5).range(1, 5);  // Slow mod
    modAmp = SinOsc.kr(modFreq).range(0.5, 1.5);  // Modulating ampl

    // modulate the filtered mic by multiplying it with the modulated ampl
    modulatedInput = lowPass * modAmp;

    // delay and echo
    delay = DelayN.ar(modulatedInput, 0.8, 0.2);  
    echo = CombN.ar(delay, 0.3, 0.2, 3);  

    // Output the modulated and delayed/echoed mic input
    echo;

}).play;
)§
