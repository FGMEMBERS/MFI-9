%%
%% MFI-9B airfoil estimation.
%%
%%   Copyright (C) 2012 - 2013  Anders Gidenstam  (anders(at)gidenstam.org)
%%
%%   This program is free software; you can redistribute it and/or modify
%%   it under the terms of the GNU General Public License as published by
%%   the Free Software Foundation; either version 2 of the License, or
%%   (at your option) any later version.
%% 
%%   This program is distributed in the hope that it will be useful,
%%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%%   GNU General Public License for more details.
%%  
%%   You should have received a copy of the GNU General Public License
%%   along with this program; if not, write to the Free Software
%%   Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%%

%% Airfoil for the main wing:
%% NACA 23008.5

%% A NACA 23008 generated by JavaFoil with the settings
%%  Family:               NACA 5-digit
%%  #points:              77
%%  Thickness t/c:        8%
%%  Design CL:            0.3
%%  Camber Location xf/c: 18%
%%  Closed trailing edge: T

NACA23008 = [
1.00000000	0.00000000
0.99831742	0.00020396
0.99321780	0.00081249
0.98475699	0.00181551
0.97299254	0.00319678
0.95800451	0.00493444
0.93989491	0.00700196
0.91878703	0.00936894
0.89482463	0.01200208
0.86817096	0.01486590
0.83900765	0.01792337
0.80753348	0.02113629
0.77396302	0.02446547
0.73852514	0.02787068
0.70146146	0.03131040
0.66302468	0.03474162
0.62347681	0.03811953
0.58308742	0.04139740
0.54213174	0.04452672
0.50088882	0.04745753
0.45963963	0.05013914
0.41866512	0.05252125
0.37824439	0.05455521
0.33865275	0.05619567
0.30015992	0.05740222
0.26302820	0.05814106
0.22737867	0.05835923
0.19320281	0.05778854
0.16084284	0.05613910
0.13065936	0.05326117
0.10300236	0.04914800
0.07819360	0.04392409
0.05650989	0.03782099
0.03817059	0.03114294
0.02333135	0.02422726
0.01208457	0.01740437
0.00446464	0.01096222
0.00045575	0.00511813
0.00000000	0.00000000
0.00295976	-0.00419075
0.00917405	-0.00734449
0.01851516	-0.00958740
0.03085141	-0.01109841
0.04605609	-0.01208982
0.06401635	-0.01278560
0.08463992	-0.01339961
0.10785713	-0.01411471
0.13361673	-0.01506275
0.16187559	-0.01630512
0.19258447	-0.01781338
0.22567317	-0.01945128
0.26102440	-0.02096117
0.29814465	-0.02209287
0.33664778	-0.02282597
0.37627012	-0.02318101
0.41674029	-0.02318479
0.45778103	-0.02286873
0.49911118	-0.02226735
0.54044761	-0.02141678
0.58150717	-0.02035348
0.62200867	-0.01911328
0.66167479	-0.01773081
0.70023396	-0.01623915
0.73742225	-0.01466985
0.77298514	-0.01305316
0.80667923	-0.01141838
0.83827392	-0.00979417
0.86755295	-0.00820886
0.89431588	-0.00669061
0.91837945	-0.00526724
0.93957885	-0.00396597
0.95776882	-0.00281283
0.97282470	-0.00183196
0.98464327	-0.00104475
0.99314350	-0.00046897
0.99826707	-0.00011796
1.00000000	0.00000000
];


WingXcoord = flipdim(NACA23008(1:39,1));
WingUpper  = flipdim(NACA23008(1:39,2));
WingLower  = NACA23008(39:77,2);

%% Plot the profile.
figure();
plot(WingXcoord, WingUpper,
     WingXcoord, WingLower
    );
axis("equal");

%% PHETE and PHETEP based on the airfoil for DATCOM
%%   PHETE  = 1/2 * (Y_90 - Y_99) / 9
%%   PHETEP = 1/2 * (Y_95 - Y_99) / 4

Y_90wng = interp1(WingXcoord, WingUpper, 0.90, 'spline') - \
          interp1(WingXcoord, WingLower, 0.90, 'spline');
Y_95wng = interp1(WingXcoord, WingUpper, 0.95, 'spline') - \
          interp1(WingXcoord, WingLower, 0.95, 'spline');
Y_99wng = interp1(WingXcoord, WingUpper, 0.99, 'spline') - \
          interp1(WingXcoord, WingLower, 0.99, 'spline');

PHETEwng = 0.5 * (Y_90wng - Y_99wng) / 9
PHETEPwng = 0.5 * (Y_95wng - Y_99wng) / 4


