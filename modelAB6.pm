dtmc

const double ProbaFilter0 = 0.15;
const double ProbaFilter1 = 0.3;
const double ProbaFilter2 = 0.4;
const double ProbaFilter3 = 0.1;
const double ProbaFilter4 = 1-ProbaFilter0-ProbaFilter1-ProbaFilter2-ProbaFilter3;

//cannot change
const double DistanceZoneFilter0 = 20; 
const double DistanceZoneFilter1 = 40;
const double DistanceZoneFilter2 = 60;
const double DistanceZoneFilter3 = 80;
const double DistanceZoneFilter4 = 100;

global startPointX:[0..500] init 0;
global startPointY:[0..100] init 0;

const double frequency = 1;
const int Time = 5;

global a:[0..100];

module computation

	s:[0..7] init 0;
	y:[0..10000] init 0;
	x: [0..10000] init 0;
	times: [0..floor(Time/frequency)] init 0;
	p: [0..100] init 0;

	[loopbegin](s=0) -> (s'=1);
	[loopend](s=1) -> (s'=2);
	[](s=2)-> (y'=a) & (s'=3);
	[loopbegin](s=3) -> (s'=4);
	[loopend](s=4) -> (s'=5);
	[](s=5)-> (x'=a) & (s'=6);
	[](s=6) & (Time - frequency * times != 0) 
		& (floor(startPointX+(500-(x+startPointX))*frequency / (Time - frequency * times))<=1000)
		& (floor(startPointY+(0-(y+startPointY))*frequency / (Time - frequency * times))<=1000)
		-> (x'=floor(startPointX+(500-(x+startPointX))*frequency / (Time - frequency * times)))
		& (y'=floor(startPointY+(0-(y+startPointY))*frequency / (Time - frequency * times)))
		& (s'=7);
//	frequency / (Time - frequency * times)


endmodule

module loop

	l:[0..7] init 0;

	[loopbegin](l=0)->  (l'=1);
	[](l=1) & (ProbaFilter0 + ProbaFilter1 + ProbaFilter2 + ProbaFilter3 + ProbaFilter4 =1) 
		-> ProbaFilter0: (l'=2) + ProbaFilter1: (l'=3) + ProbaFilter2: (l'=4) + ProbaFilter3: (l'=5) + ProbaFilter4: (l'=6);


	[](l=2) ->
		1/20: (a'=1) & (l'=7) + 1/20: (a'=2) & (l'=7) + 1/20: (a'=3) & (l'=7) + 1/20: (a'=4) & (l'=7) + 1/20: (a'=5) & (l'=7)
		+ 1/20: (a'=6) & (l'=7) + 1/20: (a'=7) & (l'=7) + 1/20: (a'=8) & (l'=7) + 1/20: (a'=9) & (l'=7) + 1/20: (a'=10) & (l'=7) 
		+ 1/20: (a'=11) & (l'=7) + 1/20: (a'=12) & (l'=7) + 1/20: (a'=13) & (l'=7) + 1/20: (a'=14) & (l'=7) + 1/20: (a'=15) & (l'=7) 
		+ 1/20: (a'=16) & (l'=7) + 1/20: (a'=17) & (l'=7) + 1/20: (a'=18) & (l'=7) + 1/20: (a'=19) & (l'=7) + 1/20: (a'=20) & (l'=7);

	[](l=3) ->
		1/20: (a'=21) & (l'=7) + 1/20: (a'=22) & (l'=7) + 1/20: (a'=23) & (l'=7) + 1/20: (a'=24) & (l'=7)
		+ 1/20: (a'=25) & (l'=7) + 1/20: (a'=26) & (l'=7) + 1/20: (a'=27) & (l'=7) + 1/20: (a'=28) & (l'=7) + 1/20: (a'=29) & (l'=7)
		+ 1/20: (a'=30) & (l'=7) + 1/20: (a'=31) & (l'=7) + 1/20: (a'=32) & (l'=7) + 1/20: (a'=33) & (l'=7) + 1/20: (a'=34) & (l'=7)
		+ 1/20: (a'=35) & (l'=7) + 1/20: (a'=36) & (l'=7) + 1/20: (a'=37) & (l'=7) + 1/20: (a'=38) & (l'=7) + 1/20: (a'=39) & (l'=7) + 1/20: (a'=40) & (l'=7);

	[](l=4) ->
		1/20: (a'=41) & (l'=7) + 1/20: (a'=42) & (l'=7) + 1/20: (a'=43) & (l'=7) + 1/20: (a'=44) & (l'=7)
		+ 1/20: (a'=45) & (l'=7) + 1/20: (a'=46) & (l'=7) + 1/20: (a'=47) & (l'=7) + 1/20: (a'=48) & (l'=7) + 1/20: (a'=49) & (l'=7)
		+ 1/20: (a'=50) & (l'=7) + 1/20: (a'=51) & (l'=7) + 1/20: (a'=52) & (l'=7) + 1/20: (a'=53) & (l'=7) + 1/20: (a'=54) & (l'=7)
		+ 1/20: (a'=55) & (l'=7) + 1/20: (a'=56) & (l'=7) + 1/20: (a'=57) & (l'=7) + 1/20: (a'=58) & (l'=7) + 1/20: (a'=59) & (l'=7) + 1/20: (a'=60) & (l'=7);

	[](l=5) ->
 		1/20: (a'=61) & (l'=7) + 1/20: (a'=62) & (l'=7) + 1/20: (a'=63) & (l'=7) + 1/20: (a'=64) & (l'=7)
		+ 1/20: (a'=65) & (l'=7) + 1/20: (a'=66) & (l'=7) + 1/20: (a'=67) & (l'=7) + 1/20: (a'=68) & (l'=7) + 1/20: (a'=69) & (l'=7)
		+ 1/20: (a'=70) & (l'=7) + 1/20: (a'=71) & (l'=7) + 1/20: (a'=72) & (l'=7) + 1/20: (a'=73) & (l'=7) + 1/20: (a'=74) & (l'=7)
		+ 1/20: (a'=75) & (l'=7) + 1/20: (a'=76) & (l'=7) + 1/20: (a'=77) & (l'=7) + 1/20: (a'=78) & (l'=7) + 1/20: (a'=79) & (l'=7) + 1/20: (a'=80) & (l'=7);

	[](l=6) ->
		1/20: (a'=81) & (l'=7) + 1/20: (a'=82) & (l'=7) + 1/20: (a'=83) & (l'=7) + 1/20: (a'=84) & (l'=7)
		+ 1/20: (a'=85) & (l'=7) + 1/20: (a'=86) & (l'=7) + 1/20: (a'=87) & (l'=7) + 1/20: (a'=88) & (l'=7) + 1/20: (a'=89) & (l'=7)
		+ 1/20: (a'=90) & (l'=7) + 1/20: (a'=91) & (l'=7) + 1/20: (a'=92) & (l'=7) + 1/20: (a'=93) & (l'=7) + 1/20: (a'=94) & (l'=7)
		+ 1/20: (a'=95) & (l'=7) + 1/20: (a'=96) & (l'=7) + 1/20: (a'=97) & (l'=7) + 1/20: (a'=98) & (l'=7) + 1/20: (a'=99) & (l'=7) + 1/20: (a'=100) & (l'=7);

	[loopend](l=7)->(l'=0);
endmodule
