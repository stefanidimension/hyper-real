s.boot;

(
Ndef(\feedbackLoop, {
    var sound, feedback, delayTime, pannedSignal, panPosition;

    // Microphone input
    sound = SoundIn.ar(0);

    // Delay time modulation (very slow LFO)
    delayTime = SinOsc.kr(0.1).range(0.01, 0.2);  // Delay time modulated between 0.01 and 0.2 seconds

    // Feedback with delay
    feedback = CombN.ar(sound, 0.3, delayTime, 4); // Comb delay for feedback, with maximum delay time of 0.3 seconds

    // Pan position that moves slowly from left to right
    panPosition = SinOsc.kr(0.012);  // LFO controlling pan (0.05 Hz rate)

    // Panning feedback signal
    pannedSignal = Pan2.ar(feedback, panPosition);

    pannedSignal
}).play;
)
