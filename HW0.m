
% -------------------------------- %
% Wine data set Analysis
% Author: Anisha Gartia
% Last Modified: January 23, 2016
% -------------------------------- %

%--- Import wine data set for analysis ---%
fwine = 'csv_winedata.csv';
wine = csvread(fwine);

%--- Import list of attlribute names---%
mycell = textread('attributenames.txt','%s');
attrib = char(mycell);

%--- Scatter plot for Alcohol vs Hue ---%
x_index = strmatch('Alcohol',attrib);
X = wine(:,x_index+1);
y_index = strmatch('Hue',attrib);
Y = wine(:,y_index+1);  
gscatter(X,Y,wine(:,1),'brg','xo*',4);
xlabel('Alcohol');
ylabel('Hue');
title('Scatter plot of Alcohol and Hue of wine dataset');

%--- Scatter plot for Dilution vs Color Intensity ---%
x_index = strmatch('OD280/OD315_of_diluted_wines',attrib);
X = wine(:,y_index+1);  
y_index = strmatch('Color_intensity',attrib);
Y = wine(:,x_index+1);
gscatter(X,Y,wine(:,1),'grm','xo*',4);
ylabel('Color Intensity');
xlabel('OD280/OD315 of diluted wines');
title('Scatter plot of diluted wines and Color Intensity');


%--- Perform Principal component analysis and plot the first three components ---%
pcacoeff = pca(wine(:,2:end));
x = pcacoeff(:,1);
y = pcacoeff(:,2);
z = pcacoeff(:,3);
scatter3(x,y,z,10,z)
xlabel('First component','FontSize',7)
ylabel('Second component','FontSize',7)
zlabel('Third Component','FontSize',7)
title('First three principal components')
view(40,40)
