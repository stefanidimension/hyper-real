s.boot


(
Ndef(\modulatedMic, {
    var micInput, noiseGate, lowPass, modAmp, modFreq, delay, echo, modulatedInput;

    // Capture microphone input
    micInput = SoundIn.ar(0);

    // Apply a noise gate to clean the input signal (threshold-based)
    noiseGate = Compander.ar(micInput, micInput, 0.2, 1, 0.1, 0.01, 0.05);

    // Apply a low-pass filter to remove high-level frequencies (above 500Hz)
    lowPass = LPF.ar(noiseGate, 500);  // Cutoff frequency at 500Hz (adjust as needed)

    // Modulation of amplitude, speed, and rhythm
    modFreq = SinOsc.kr(0.5).range(1, 5);  // Slow modulation frequency
    modAmp = SinOsc.kr(modFreq).range(0.5, 1.5);  // Modulating amplitude between 0.5 and 1.5

    // Modulate the filtered microphone input by multiplying it with the modulated amplitude
    modulatedInput = lowPass * modAmp;

    // Apply delay and echo
    delay = DelayN.ar(modulatedInput, 0.8, 0.2);  // Short delay (max: 0.5 sec, delay time: 0.2 sec)
    echo = CombN.ar(delay, 0.3, 0.2, 3);  // Echo with feedback (max delay: 0.3 sec, delay time: 0.2 sec, feedback: 3)

    // Output the modulated and delayed/echoed microphone input
    echo;
}).play;
)§
