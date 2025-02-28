ServerOptions.inDevices.postln;
Server.default.options.inDevice_("Scarlett Solo USB");
Server.default.reboot;

s.boot;

(
Ndef(\modulatedMic, {
    var micInput, noiseGate, modAmp, modFreq, delay, echo, modulatedInput;

    // mic
    micInput = SoundIn.ar(0);

    // noise gate to clean the input signal
    noiseGate = Compander.ar(micInput, micInput, 0.2, 1, 0.1, 0.01, 0.05);

    // amplitude, speed, and rhythm modulation
    modFreq = SinOsc.kr(0.2).range(0, 1);  
    modAmp = SinOsc.kr(modFreq).range(0.2, 1);  

    // mic modulation 
    modulatedInput = noiseGate * modAmp;

    // delay and echo
    delay = DelayN.ar(modulatedInput, 0.2, 0.2);  
    echo = CombN.ar(delay, 0.2, 0.2, 4);  

    // Output modulated and delayed/echoed mic
    echo;

}).play;
)
