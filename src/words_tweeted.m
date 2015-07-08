%words_tweeted.m
%by Ben Davis
%July 8, 2015
%Matlab script
%Calculate the total number of times each word has been tweeted.
%Reads tweets from tweet_input/tweets.txt
%Writes output to tweet_output/ft1.txt

fid = fopen('tweet_input/tweets.txt'); %open file
s=textscan(fid,'%s'); %scan file for strings 
fclose(fid); %close file
str=s{:}; %save cell data as strings
[ii,jj,kk]=unique(str); %identify unique elements in array
freq=hist(kk,(1:numel(jj))')'; %create histogram of words
[ii num2cell(freq)] %print results to screen
%write and format text file
num = size(freq,1); %number of unique words
length = zeros(num); %intialize variable
spaces = zeros(num); %intialize variable
for j = 1:num
    length(j) = numel(ii{j}); %character counter for each word
end
m = max(length(1:num)); %indentify longest word
for k = 1:num
    spaces(k) = m-length(k); %number of trailing spaces to pad right
end
txt = fopen('tweet_output/ft1.txt','wt'); %open text file
formatSpec = '%s%s     %i\n'; %format text file
    for i = 1:num %for loop to write data into text file
        fprintf(txt,formatSpec,ii{i},blanks(spaces(i)),freq(i));
    end
fclose(txt);