declare name "Channel Delay (Stereo)";
declare version "0.1.0";
declare author "Viacheslav Lotsmanov";
declare license "GNU/GPLv3";

delay_l = hslider("Left delay (ms)", 0, 0, 5000, 1);
delay_r = hslider("Right delay (ms)", 0, 0, 5000, 1);

delay_g = hgroup("Delay", (delay_l, delay_r));

import("math.lib");
import("music.lib");

delay_by_ms(ms) = int((SR/1000.0) * ms);

smooth(c) = *(1-c) : +~*(c);

gain_l = hslider("Left gain (dB)", 0, -90, +12, 1) : db2linear : smooth(0.999);
gain_r = hslider("Right gain (dB)", 0, -90, +12, 1) : db2linear : smooth(0.999);

gain_g = hgroup("Gain", (gain_l, gain_r));

process =
	*( @(delay_by_ms(delay_l)) , gain_l ) ,
	*( @(delay_by_ms(delay_r)) , gain_r ) ;
