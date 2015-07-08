%median_unique.m
%by Ben Davis
%July 8, 2015
%Matlab script
%Calculate the median number of unique words per tweet, and update this 
%median as tweets come in.
%Reads tweets from tweet_input/tweets.txt
%Writes output to tweet_output/ft2.txt

fid = fopen('tweet_input/tweets.txt'); %open file
s=textscan(fid,'%s','Delimiter','\r'); %delimit by strings and returns
fclose(fid); %close dile
str=s{:}; %save cells as string
N = size(str,1); %identify number of tweets
num = zeros(N,1); %initialize variable
med = zeros(N,1); %initialize variable
for i=1:N %for loop to scan each tweet individually
    read = textscan(char(str(i)),'%s'); %scan tweet for strings
    tweet = read{:}; %save cell data as string
    [ii,jj,kk]=unique(tweet); %identify unique strings
    freq=hist(kk,(1:numel(jj))')'; %create histogram
    num(i) = size(freq,1); %number of unique tweets
    med(i) = median(num(1:i)); %median of tweet (and all previous tweets)
end
txt = fopen('tweet_output/ft2.txt','wt'); %create text file
for j=1:N
    fprintf(txt,'%.2f\n',med(j)); %format and write to text file
end
fclose(txt);