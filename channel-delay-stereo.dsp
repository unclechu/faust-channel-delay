declare name "Channel Delay (Stereo)";
declare version "0.0.1";
declare author "Viacheslav Lotsmanov";
declare license "GNU/GPLv3";

delay_l = hslider("Left delay (ms)", 0, 0, 5000, 1);
delay_r = hslider("Right delay (ms)", 0, 0, 5000, 1);

delay_g = hgroup("Delay", (delay_l, delay_r));

import("math.lib");

delay(ms) = int((SR/1000.0) * ms);

process = @(delay(delay_l)),@(delay(delay_r));
