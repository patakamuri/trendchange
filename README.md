# trendchange

The package is useful in implementing 

- Innovative Trend Analysis test.
- Sequential Mann-Kendall test.
- Distribution free CUSUM test.

If the data points lay on 1:1 line, there is no trend in the data. If the data points exist in the top triangle, it is indicative of positive trend. If the data lies in the bottom triangle, it indicates negative trend in the data.

In Sequential Mann-Kendall test, the series is rearranged based on the ranks of the original series. Prograde and retrograde series plots are generated as per Sneyers (1990). The point where prograde and retrograde series intersect will approximately indicate the possible point of change. When there is no clear trend in the data, the series will intersect at several locations.

Disribution free CUSUM test is used to identify the change point in a series of data. The point at which Maximum value of cumulative sum occurs, will indicate the change point in the time series. If the maximum value is equal to or greater than the critical value, it indicates significantce of the change point.

[![Build Status](https://travis-ci.com/patakamuri/trendchange.svg?branch=master)](https://travis-ci.com/patakamuri/trendchange)
