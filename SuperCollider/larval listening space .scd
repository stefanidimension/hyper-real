s.boot;


(
Ndef(\feedbackLoop, {
    var sound, feedback, delayTime, pannedSignal, panPosition, modFreq, modIndex, fm, am, carrierFreq;

    // Mic input
    sound = SoundIn.ar(0);

    // Carrier frequency for modulation (base freq of the mic input)
    carrierFreq = 20; // Base freq or modulation

    // Modulation freq
    modFreq = 2;  // Low modulation freq to keep sound subtle

    // Modulation index for freq modulation (smaller value to keep it intelligible)
    modIndex = 10;

    // Frequency modulation 
    fm = SinOsc.ar(modFreq, 0, modIndex) + carrierFreq;

    // Amplitude modulation keeping amplitude modulated between 0.3 and 0.6 to avoid distortion
    am = SinOsc.ar(modFreq).range(0.2, 0.6);

    // Applying FM and AM to the mic 
    sound = sound * am;  

    // Delay modulation for feedback
    delayTime = SinOsc.kr(0.2).range(0.06, 0.2);  

    // Feedback with delay
    feedback = CombN.ar(sound, 0.6, delayTime, 6); // applied to the modulated sound

    // Panning
    panPosition = SinOsc.kr(0.012);  

    // Panning the feedback signal
    pannedSignal = Pan2.ar(feedback, panPosition);

    pannedSignal
}).play;
)

