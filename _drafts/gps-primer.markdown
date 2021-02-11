---
layout: post
title: "How GPS Actually Works: Part 1"
description: "Where in the world is my Android phone?"
# date: 2020-04-21 21:24:17 -0700
categories: technical 
---

## Introduction

GPS is one of those things that everyone uses all the time but nobody really thinks about. A recent conversation I had with friends turned up some surprising questions. GPS communication is two-way, right? That's why it doesn't work in cities, because too many people are trying to use it? Don't they have to keep adding satellites as more people use the system? Doesn't the government know when you use it?

It turns out these are all common misconceptions. The genius of GPS, and the reason it is so ubiquitous, is that communication is one-way. Your device doesn't have to transmit anything to work out its location, so there is no limit to the number of users and the US government has no way of knowing when you use it.

Most people have a basic mental model for how GPS works that goes something like, "My phone finds the distance to three satellites and uses that information to triangulate its position." That covers the basics, but it turns out there are some interesting details to this process. This post aims to lay out those details in an easily digestible fashion.

## Background

First, a few definitions. GPS stands for Global Positioning System, which was developed by the US Air Force and first became operational in 1993. Russia has its own system, called GLONASS (Global Navigation Satellite System), which has been operational since 1995. China and the EU also recently completed constellations called BeiDou and Galileo, respectively, and Japan and India have systems which do not (yet) provide global coverage.

The generic term for these systems is GNSS, which stands for Global Navigation Satellite System. Most modern receivers support both GPS and GLONASS, and Galileo and BeiDou have been adopted rapidly in consumer devices over the past few years. To reflect this development the remainder of this post will refer to GNSS generally rather than the US-specific GPS.

## Fundamentals

So, how do these systems triangulate your position from satellite signals? Let's start with that mental model of triangulation that I mentioned earlier. The basic concept works like this: if you know the range $r_a$ between a point on a plane and a known location $A$, you know that the unknown point must be located somewhere on the circle with radius $r_a$ centered on $A$. If you know the distance $y$ to a second point, then your mystery point is at one of two intersections of the circles centered the known points. Add a third reference point and boom, you've located your mystery point.

This mental model assumes several things:

1. Our world is two-dimensional
2. We know the locations of at least three reference points, and
3. We can easily find the range to those reference points.

It turns out none of these assumptions hold true in satellite navigation. Let's examine how GNSS constellations address each of them in turn.

### Three-Dimensional Triangulation

The world is not flat, and GNSS receivers are used in aircraft, so the receiver cannot assume its location lies on a plane. To address this, let's generalize the concept of triangulation to three dimensions. The range to a single known reference point narrows our location down to a sphere of points with a distance $x$ from the reference. A second reference narrows things down to the circle where the two equidistant spheres intersect. A third reference reduces the possibilities to two points.

At this point you can probably guess where this is going. Adding a fourth reference does indeed resolve the ambiguity and allow us to triangulate our mystery point. In the case of satellite navigation, this fourth reference can actually be Earth. How? In the three-satellite case, one of the two candidate locations will be out in space, farther from Earth than the satellites themselves. In most cases we can eliminate that candidate and call it a day.

Unfortunately things in the real world are not so simple. It turns out we still need that fourth satellite, but it's used to resolve the time, not position. More on this later.

### Reference Locations

Our reference points are satellites, which orbit the Earth at approximately <insert speed>. Thus we cannot assume our reference points are fixed, and we must determine their positions every time we want to triangulate our own.

Unfortunately, GNSS constellations to not have enough transmission bandwidth to broadcast their exact position every second. Instead the satellites broadcast their orbital parameters every few minutes, allowing receivers to calculate their positions as needed.

### Range Finding

*Spoiler alert: here's where I explain why we need that fourth satellite.*

So, we know where the satellites are. How do we figure out the range from each one to the receiver?

Most rangefinders (i.e. sonar, radar, lidar) operate on a time-of-flight principle: send out some sort of pulse and measure how long it takes to come back. But sending pulses and listening for returns consumes energy - energy which is likely in short supply for a mobile, battery-powered receiver.

To reduce receiver complexity and eliminate constraints on the number of receivers in simultaneous operation, GNSS constellations are designed for only one-way communication between satellite and receiver. That means the satellite transmits the signal and encodes time of transmission, allowing the receiver to simply measure time of reception and subtract to get time-of-flight.

There's only one problem. Commodity GNSS receivers use quartz clocks, which are cheap and energy-efficient, but cannot keep time accurately enough to provide a dependable reference for the signal reception time.

Hence, the fourth satellite. A fourth reference measurement provides another independent variable, enabling the receiver to calculate the offset between its clock and the GNSS reference clock as well as its position in three dimensions. The details of this process are beyond the scope of this post, but hopefully you know have a solid conceptual understanding of what happens inside your phone when you click that little crosshairs button on Google Maps.

A side effect of this process is that it makes GPS the most accurate and widely available time server in the world. You can get (insert accuracy spec)-level accuracy anywhere on the world with GPS coverage, which means, well, anywhere on Earth. GPS is used by both civilian and military aircraft as the primary reference time source. In fact, time synchronization is so central to today's navigation infrastructure that GPS's governing bodies go by the acronym PNT, which stands for Positioning, Navigation and Timing.
