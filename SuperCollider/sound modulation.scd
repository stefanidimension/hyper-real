ServerOptions.inDevices.postln;
Server.default.options.inDevice_("Scarlett Solo USB");
Server.default.reboot;

s.boot;

(
Ndef(\modulatedMic, {
    var micInput, noiseGate, modAmp, modFreq, delay, echo, modulatedInput;

    // Capture microphone input
    micInput = SoundIn.ar(0);

    // Apply a noise gate to clean the input signal (threshold-based)
    noiseGate = Compander.ar(micInput, micInput, 0.2, 1, 0.1, 0.01, 0.05);

    // Modulation of amplitude, speed, and rhythm
    modFreq = SinOsc.kr(0.2).range(0, 1);  // Slow modulation frequency
    modAmp = SinOsc.kr(modFreq).range(0.2, 1);  // Modulating amplitude between 0.5 and 1.5

    // Modulate the microphone input by multiplying it with the modulated amplitude
    modulatedInput = noiseGate * modAmp;

    // Apply delay and echo
    delay = DelayN.ar(modulatedInput, 0.2, 0.2);  // Short delay (max: 0.5 sec, delay time: 0.2 sec)
    echo = CombN.ar(delay, 0.2, 0.2, 4);  // Echo with feedback (max delay: 0.3 sec, delay time: 0.2 sec, feedback: 3)

    // Output the modulated and delayed/echoed microphone input
    echo;
}).play;
)