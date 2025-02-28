s.boot;


(
Ndef(\feedbackLoop, {
    var sound, feedback, delayTime, pannedSignal, panPosition, modFreq, modIndex, fm, am, carrierFreq;

    // Microphone input
    sound = SoundIn.ar(0);

    // Carrier frequency for modulation (set to base frequency of the microphone input)
    carrierFreq = 20; // Base frequency for modulation

    // Modulation frequency
    modFreq = 2;  // Low modulation frequency to keep the sound subtle

    // Modulation index for frequency modulation (smaller value to keep it intelligible)
    modIndex = 10;

    // Frequency modulation (FM)
    fm = SinOsc.ar(modFreq, 0, modIndex) + carrierFreq;

    // Amplitude modulation (AM), keeping amplitude modulated between 0.3 and 0.6 to avoid distortion
    am = SinOsc.ar(modFreq).range(0.2, 0.6);

    // Applying FM and AM to the microphone input (keeping the sound clean and subtle)
    sound = sound * am;  // Amplitude modulation applied to the microphone input

    // Delay time modulation for feedback
    delayTime = SinOsc.kr(0.2).range(0.06, 0.2);  // Delay time modulated between 0.01 and 0.2 seconds

    // Feedback with delay (Comb filter)
    feedback = CombN.ar(sound, 0.6, delayTime, 6); // Feedback applied to the modulated sound

    // Pan position (slowly moving left to right)
    panPosition = SinOsc.kr(0.012);  // LFO controlling pan (0.05 Hz rate)

    // Panning the feedback signal
    pannedSignal = Pan2.ar(feedback, panPosition);

    pannedSignal
}).play;
)

